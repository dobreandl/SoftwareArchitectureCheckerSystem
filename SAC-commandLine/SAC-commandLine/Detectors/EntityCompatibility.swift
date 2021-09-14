//
//  EntityCompatibility.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 18/08/2018.
//  Copyright © 2018 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation

class EntityCompatibility: Compatibility {
    
    private struct Constants {
        static let initMethodPrefix = "init("
    }
    
    func compatibilityDegree(component: Component, otherComponents: [Component]) -> CompatibilityDegree {
        if (component.kind == .kExtension) || (component.kind == .kProtocol) {
            return .none
        }
        
        // Struct with only properties
        if componentIsStructWithOnlyProperties(component: component, others: otherComponents) {
            return .certain
        }
        
        // Class with only properties and inits
        if componentIsClassWithOnlyInitAndProperties(component: component, others: otherComponents) {
            return .certain
        }
        
        // Class with only properties
        if componentIsClassWithOnlyProperties(component: component, others: otherComponents) {
            return .low
        }
        
        // TODO: Add other metrics
        
        return .none
    }
    
    // MARK: Private methods
    
    // Struct with only properties
    private func componentIsStructWithOnlyProperties(component: Component, others: [Component]) -> Bool {
        if component.kind == .kStruct && component.methods.count == 0 && validVariables(component: component, otherComponents: others) {
            
            return true
        }
        
        return false
    }
    
    // Class with only properties
    // This does not work as it detecsts other types as well
    private func componentIsClassWithOnlyProperties(component: Component, others: [Component]) -> Bool {
        if component.kind == .kClass && component.methods.count == 0 && validVariables(component: component, otherComponents: others) {
            
            return true
        }
        
        return false
    }
    
    // Class with initialisers
    private func componentIsClassWithOnlyInitAndProperties(component: Component, others: [Component]) -> Bool {
        guard  component.kind == .kClass, validVariables(component: component, otherComponents: others) else {
            
            return false
        }
        
        var numberOfInits = 0
        
        for method in component.methods {
            if method.name.hasPrefix(Constants.initMethodPrefix) {
                numberOfInits += 1
            }
        }
        
        return (numberOfInits == component.methods.count) && (numberOfInits > 0)
    }
    
    private func validVariables(component: Component, otherComponents: [Component]) -> Bool {
        guard component.variables.count != 0 else {
            return false
        }
        
        // Check that variables are inherited only from other models
        let variableTypes = component.variables.map({$0.type})
        let variableComponents = otherComponents.filter({variableTypes.contains($0.type) && !($0 == component) })
        
        for variable in variableComponents {
            let userDefinedType = otherComponents.contains(variable)
            let kindClassOrStruct = ((variable.kind == .kClass) || (variable.kind == .kStruct))
            
            if compatibilityDegree(component: variable, otherComponents: otherComponents).rawValue < CompatibilityDegree.medium.rawValue && (userDefinedType && kindClassOrStruct) {
               
                return false
            }
        }
        
        return true
    }
}
