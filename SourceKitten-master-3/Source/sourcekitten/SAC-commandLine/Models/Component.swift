//
//  Component.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 11/08/2018.
//  Copyright © 2018 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation

func sanitizeType(_ type: String) -> String {
    // Replace optional, explicit values with nothing as we don't care about those
    var returnValue = type.replacingOccurrences(of: "?", with: "")
    returnValue = returnValue.replacingOccurrences(of: "!", with: "")
    // Don't care about type
    returnValue = returnValue.replacingOccurrences(of: ".Type", with: "")
    returnValue = returnValue.replacingOccurrences(of: ".Protocol", with: "")
    returnValue = returnValue.replacingOccurrences(of: ":", with: "")
    returnValue = returnValue.replacingOccurrences(of: "->", with: "").removeCharacters(from: "[]<.->(),")
    
    return returnValue
}

struct Variable {
    let name: String
    let type: String
    let kind: ComponentsVariableElement
    
    // MARK: Equatable protocol
    
    static func == (lhs: Variable, rhs: Variable) -> Bool {
        return lhs.name == rhs.name &&
            lhs.type == rhs.type &&
            lhs.kind == rhs.kind
    }
}

struct Method: Equatable {
    let name: String
    let type: String
    let kind: ComponentsMethodElement
    let parameterTypes: [String]
    
    
    // MARK: Equatable protocol
    
    static func == (lhs: Method, rhs: Method) -> Bool {
        return lhs.name == rhs.name &&
            lhs.kind == rhs.kind &&
            lhs.type == rhs.type &&
            lhs.parameterTypes.sorted() == rhs.parameterTypes.sorted()
    }
}

struct Component: Equatable {
    let name: String
    let kind: ElementDeclaration
    let path: String
    let inheritedTypes: [String]
    let type: String
    let methods: [Method]
    let variables: [Variable]
    
    // MARK: Equatable protocol
    
    static func == (lhs: Component, rhs: Component) -> Bool {
        return lhs.name == rhs.name &&
            lhs.kind == rhs.kind &&
            lhs.path == rhs.path &&
            lhs.type == rhs.type &&
            lhs.methods.count == rhs.methods.count &&
            lhs.variables.count == rhs.variables.count &&
            lhs.inheritedTypes.sorted() == rhs.inheritedTypes.sorted()
    }
}

extension Component: Hashable {
    var hashValue: Int {
        return name.hashValue ^ type.hashValue ^ path.hashValue ^ variables.count.hashValue ^ methods.count.hashValue
    }
}
