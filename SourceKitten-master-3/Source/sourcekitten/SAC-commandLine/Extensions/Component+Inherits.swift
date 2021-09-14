//
//  Component+Inherits.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 18/08/2018.
//  Copyright © 2018 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation

extension Component {
    
    func isComponentViewController(otherComponents: [Component]) -> Bool {
        // Check if inherits from view controllers
        return inheritsFrom(types: NativeTypes.viewControllers, otherComponents: otherComponents)
    }
    
    func isComponentView(otherComponents: [Component]) -> Bool {

        // Check if inherits from view
        return inheritsFrom(types: NativeTypes.views + NativeTypes.androidViews, otherComponents: otherComponents)
    }
    
    func isComponentController(otherComponents: [Component]) -> Bool {
        // Check if inherits from controllers
        return inheritsFrom(types: NativeTypes.controllers + NativeTypes.androidControllers, otherComponents: otherComponents)
    }
    
    // First type coordinating controller means that the coordinating controller works directlly with VC/controllers
    func isComponentFirstTypeOfCoordinatingController(otherComponents:[Component], controllers: [Component]) -> Bool {
        // We are checking weather this component has properties, or works with controllers
        for variable in variables {
            let type = variable.type
            if let component = otherComponents.first(where: {$0.type == type}) {
                // If we have a component for that type, check if its a controller
                if controllers.contains(where: {$0.type == component.type}) {
        
                    return true
                }
            }
        }
        
        for method in methods {
            let types = method.parameterTypes
            for type in types {
                if let component = otherComponents.first(where: {$0.type == type}) {
                    // If we have a component for that type, check if its a controller
                    if controllers.contains(where: {$0.type == component.type}) {
                        
                        return true
                    }
                }
                
                // If it contains a native type
                if NativeTypes.viewControllers.contains(type) || NativeTypes.controllers.contains(type) {
                    
                    return true
                }
            }
        }
    
        return false
    }
    
    func isComponentSecondTypeOfCoordinatingController(otherComponents:[Component], coordinatingControllers: [Component]) -> Bool {
        // We are checking weather this component has properties, or works with coordinating controllers
        for variable in variables {
            let type = variable.type

            if let component = otherComponents.first(where: {$0.type == type}) {
                // If we have a component for that type, check if its a controller
                
                if coordinatingControllers.contains(where: {$0.type == component.type}) {

                    return true
                }
            }
        }
        
        for method in methods {
            let types = method.parameterTypes
            for type in types {
                if let component = otherComponents.first(where: {$0.type == type}) {
                    // If we have a component for that type, check if its a coordinating controllers
                    if coordinatingControllers.contains(where: {$0.type == component.type}) {
                        return true
                    }
                }
            }
        }
        
        return false
    }
    
    func inheritsFrom(type: String, otherComponents: [Component]) -> Bool {
        
        return inheritsFrom(types: [type], otherComponents: otherComponents)
    }
    
    // MARK: Private methods
    
    private func inheritsFrom(types: [String], otherComponents: [Component]) -> Bool {
        if self.kind != .kClass {
            return false
        }
        
        if types.contains(self.type) {
            return true
        }
        
        let typesSet = Set(types)
        let inheritedTypesSet = Set(inheritedTypes)
        
        if inheritedTypesSet.intersection(typesSet).count > 0 {
            return true
        }
        
        // Check all other components from which it inherits to see if they inherit from the given type
        let inheritedComponents = otherComponents.filter({self.inheritedTypes.contains($0.type)}).filter({$0 != self})
        
        for component in inheritedComponents {
            if component.inheritsFrom(types: types, otherComponents: otherComponents) {
                
                return true
            }
        }
        
        return false
    }
}
