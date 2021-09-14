//
//  RaportParser.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 11/08/2018.
//  Copyright © 2018 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation
import SourceKittenFramework

enum ElementDeclaration: String {
    case kClass = "source.lang.swift.decl.class"
    case kExtension = "source.lang.swift.decl.extension"
    case kStruct = "source.lang.swift.decl.struct"
    case kProtocol = "source.lang.swift.decl.protocol"
}

enum ComponentsVariableElement: String {
    case kInstanceVariable = "source.lang.swift.decl.var.instance"
    case kClassVariable = "source.lang.swift.decl.var.class"
    case kStaticVariable = "source.lang.swift.decl.var.static"
}

enum ComponentsMethodElement: String {
    case kInstanceMethod = "source.lang.swift.decl.function.method.instance"
    case kClassMethod = "source.lang.swift.decl.function.method.class"
    case kStaticMethod = "source.lang.swift.decl.function.method.static"
}




class RaportParser {
    
    struct Keys {
        static let substructure = "key.substructure"
        static let kind = "key.kind"
        static let inheritedTypes = "key.inheritedtypes"
        static let name = "key.name"
        static let filePath = "key.filepath"
        static let type = "key.typename"
    }
    
    // This function parses the SourceKitten report file
    
    func parseRaport(path: String) -> [Component] {
        guard let raport = File(path: path),
            let jsonDictionary = raport.contents.toJSON() else {

                fatalError("The path or file is not valid")
        }

        let raportJSON = JSON(jsonDictionary)

        return parse(raport: raportJSON)

    }
    
    // This parses a all the swift files from a directory and its subdirectories
    
    func parseSwiftFilesFromDirectory(directory: String) -> [Component] {
        let url = URL(fileURLWithPath: Constants.directoryPath, isDirectory: true)
        
        var itemsToBeParsed = [JSON]()
        
        let fileManager = FileManager.default
        let enumerator: FileManager.DirectoryEnumerator = fileManager.enumerator(atPath: url.path)!
        
        var numberOfSwiftFiles = 0
        
//        // Go through all elements with a .swift extension
//        while let element = enumerator.nextObject() as? String {
//            if element.hasSuffix(".swift") {
//                numberOfSwiftFiles += 1
        
                // Calculate Swift docs for that file
                if let doc = SwiftDocs(file: File(path: Constants.directoryPath + "/" + "Game.swift")!, arguments: [""]) {
                    let data = doc.description.data(using: .utf8)!

                    // Convert it to a JSON dictionary if possible
                    do {
                        if let jsonDict = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? [String:Any] {
                            let json = JSON(jsonDict)
                            // Add the item to parsed items
                            itemsToBeParsed.append(json)
                        }
                        
                    } catch {
                        // Do noting
                    }
                }
//            }
//        }
        
        let raportJSON = JSON(itemsToBeParsed)
        let components = parse(raport: raportJSON)
        
        print("Number of .swift files: \(numberOfSwiftFiles)")
        print("Number of parsed components: \(components.count)")
        
        return components
    }
    
    // MARK: Private methods
    
    private func parse(raport: JSON) -> [Component] {
        var components = [Component]()
        
        // The raport contains an array of files
        if let files = raport.arrayObject as? [[String: Any]] {
            
            // For every .swift file from the raport parse it
            for file in files {
                components += parse(file: file)
            }
        }
        
        return components
    }
    
    private func parse(file: [String: Any]) -> [Component] {
        
        // The file is composed from a dictionary [filePath: valuesDict]
        guard let path = file.keys.first,
            let valuesDict = file[path] as? [String: Any],
            let substructures = valuesDict[Keys.substructure] as? [[String: Any]] else {

            return [Component]()
        }
        
        return parse(substructures: substructures, atPath: path)
    }
    
    private func parse(substructures: [[String: Any]], atPath: String) -> [Component] {
        var components = [Component]()
        
        for substructure in substructures {
            if let component = parse(substructure: substructure, atPath: atPath) {
                
                components.append(component)
            }
        }
        
        return components
    }
    
    private func parse(substructure: [String: Any], atPath: String) -> Component? {
        let substructureJSON = JSON(substructure)
        
        guard let name = substructureJSON[Keys.name].string,
            let kindStr = substructureJSON[Keys.kind].string,
            let declaration = ElementDeclaration(rawValue: kindStr) else {
                
                return nil
        }
        
        var variables = [Variable]()
        var methods = [Method]()
        
        if let substructures = substructureJSON[Keys.substructure].arrayObject as? [[String:Any]] {
            variables = parseVariables(substructures)
            methods = parseMethods(substructures)
        }
        
        let inheritedTypes = parseInheritedTypes(substructure)
        var type = substructureJSON[Keys.type].string
        
        if type == nil {
            type = inheritedTypes.first
        }
        
//        guard let definedType = type else {
//            return nil
//        }
        var definedType = name
        if let t = type  {
            definedType = t
        }
        
        
        let component = Component(name: name,
                                  kind: declaration,
                                  path: atPath,
                                  inheritedTypes: inheritedTypes,
                                  type: sanitizeType(definedType),
                                  methods: methods,
                                  variables: variables)
        
        return component
    }
    
    // MARK: Inherited types parsing
    
    private func parseInheritedTypes(_ elements: [String: Any]) -> [String] {
        guard let inheritedTypes = elements[Keys.inheritedTypes] as? [[String: Any]] else {
            
            return [String]()
        }
        
        
        var returnValues = [String]()
        
        for element in inheritedTypes {
            if let value = parseInheritedType(element) {
                
                returnValues.append(value)
            }
        }
        
        return returnValues
    }
    
    private func parseInheritedType(_ element: [String: Any]) -> String? {
        let json = JSON(element)
        
        return json[Keys.name].string
    }
    
    // MARK: Variable parsing
    
    private func parseVariables(_ elements: [[String: Any]]) -> [Variable] {
        var returnValues = [Variable]()
        
        for element in elements {
            if let variable = parseVariable(element: element) {
                
                returnValues.append(variable)
            }
        }
        
        return returnValues
    }
    
    private func parseVariable(element: [String: Any]) -> Variable? {
        let variableJSON = JSON(element)
        
        guard let name = variableJSON[Keys.name].string,
            let type = variableJSON[Keys.type].string,
            let kindStr = variableJSON[Keys.kind].string,
            let variableKind = ComponentsVariableElement(rawValue: kindStr) else {
                
                return nil
        }

        return Variable(name: name, type: sanitizeType(type), kind: variableKind)
    }
    
    // MARK: Methods parsing
    
    private func parseMethods(_ elements: [[String: Any]]) -> [Method] {
        var returnValues = [Method]()
        
        for element in elements {
            if let method = parseMethod(element: element) {

                returnValues.append(method)
            }
        }
        
        return returnValues
    }
    
    private func parseMethod(element: [String: Any]) -> Method? {
        let methodJSON = JSON(element)

        guard let name = methodJSON[Keys.name].string,
            let type = methodJSON[Keys.type].string,
            let kindStr = methodJSON[Keys.kind].string,
            let methodKind = ComponentsMethodElement(rawValue: kindStr) else {

                return nil
        }
        
        let parameterTypes = parseMethodParameterTypes(type)
        
        return Method(name: name, type: type, kind: methodKind, parameterTypes: parameterTypes)
    }
    
    private func parseMethodParameterTypes(_ types: String) -> [String] {
        let parameters = types.removeCharacters(from: "(),").replacingOccurrences(of: "->", with: "").condenseWhitespace().components(separatedBy: " ")
        var sanitizedParameters = parameters.compactMap({sanitizeType($0)})
        
        // Remove the first value as this is the class itself
        sanitizedParameters.removeFirst()
        
        sanitizedParameters = cleanUpSanitizedParameters(parameters: sanitizedParameters)
        
        return sanitizedParameters
    }
    
    // MARK: Sanitizers
    
    private func cleanUpSanitizedParameters(parameters: [String]) -> [String] {
        var returnValues = [String]()
        
        for value in parameters {
            if value.removeSpacesAndWhitespaces().count == 0 {
                continue
            }
            
            if value.contains("<") {
                // We have multiple types
                let values = parseMultipleTypesFrom(type: value)
                
                returnValues += values
                
                continue
            }
            
            if value == "@escaping" {
                continue
            }
            
            returnValues.append(value)
        }
        
        return returnValues
    }
    
    private func parseMultipleTypesFrom(type: String) -> [String] {
        let types = type.removeCharacters(from: ">").replacingOccurrences(of: "<", with: " ").condenseWhitespace().split(separator: " ")
        
        let sanitizedValues = types.map({sanitizeType(String($0))})
        
        return sanitizedValues
    }
}
