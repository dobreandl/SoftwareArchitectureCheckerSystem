//
//  Component+Helper.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 19/08/2018.
//  Copyright © 2018 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation

extension Component {
    
    func isUsingOneOfTheTypes(types: [String]) -> Bool {
        let allUsed = allUsedTypes()
        
        for t in types {
            if allUsed.contains(t) {
                return true
            }
        }
        
        return false
    }
    
    func allUsedTypes() -> Set<String> {
        var types = Set<String>()
        
        for variable in variables {
            types.insert(sanitizeType(variable.type))
        }
        
        for method in methods {
            method.parameterTypes.forEach { (methodParameter) in
                types.insert(sanitizeType(methodParameter))
            }
        }
        
        return types
    }
    
    
    func allUsedTypesArray() -> [String] {
        var types = [String]()
        
        for variable in variables {
            types.append(sanitizeType(variable.type))
        }
        
        for method in methods {
            method.parameterTypes.forEach { (methodParameter) in
                types.append(sanitizeType(methodParameter))
            }
        }
        
        return types
    }
    
    func numberOfElementsOfType(type: String) -> Int {
        var count = 0
        
        for variable in variables {
            let name = sanitizeType(variable.type)
            
            if name == type {
                count += 1
            }
        }
        
        for method in methods {
            method.parameterTypes.forEach { (methodParameter) in
                let name = sanitizeType(methodParameter)
                
                if name == type {
                    count += 1
                }
            }
        }
        
        return count
    }
    
    func numberOfUsedElements() -> Int {
        let parameters = methods.map({$0.parameterTypes.count}).reduce(0, +)
        
        return variables.count + parameters
    }
    
    func addMethodsFromExtensions(allComponents: [Component]) -> Component {
        if kind == .kExtension || kind == .kProtocol {
            return self
        }
        
        let currentComponentExtensions = allComponents.filter { (component) -> Bool in
            return component.isExtension() && component.type == self.type
        }
        
        var newMethods = [Method]()
        newMethods.append(contentsOf: methods)
        
        for item in currentComponentExtensions {
            newMethods.append(contentsOf: item.methods)
        }
        
        return Component(name: name, kind: kind, path: path, inheritedTypes: inheritedTypes, type: type, methods: newMethods, variables: variables)
    }
    
    
    func addMethodsAndVariablesFromParents(allComponents: [Component]) -> Component {
        if kind == .kExtension || kind == .kProtocol {
            return self
        }
        
        let newMethods = allMethodsIncludingSuper(other: allComponents)
        let newVariables = allParametersIncludingSuper(other: allComponents)
        
        return Component(name: name, kind: kind, path: path, inheritedTypes: inheritedTypes, type: type, methods: newMethods, variables: newVariables)
    }
    
    // MARK: Private methods
    
    private func isExtension() -> Bool {
        return kind == .kExtension
    }
    
    private func allMethodsIncludingSuper(other: [Component]) -> [Method] {
        var methods = self.methods
        
        for type in self.inheritedTypes {
            if type.count > 3 {
                
                if let component = other.first(where: {$0.type == type}), component.name != "MapAnnotation" {
                    methods += component.allMethodsIncludingSuper(other: other)
                }
            }
        }
        
        return methods
    }
    
    private func allParametersIncludingSuper(other: [Component]) -> [Variable] {
        var variables = self.variables
        
        for type in self.inheritedTypes {
            if let component = other.first(where: {$0.type == type}), component.name != "MapAnnotation" {
                variables += component.allParametersIncludingSuper(other: other)
            }
        }
        
        return variables
    }
}
