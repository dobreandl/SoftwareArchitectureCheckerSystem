//
//  ViewModelCompatibility.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 18/08/2018.
//  Copyright © 2018 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation

class ViewModelCompatibility: Compatibility {
    
    private let entityCompatibility = EntityCompatibility()
    
    func compatibilityDegree(component: Component, otherComponents: [Component]) -> CompatibilityDegree {
        // Has view and entities properties
        if componentHasViewProperties(component: component, otherComponents: otherComponents) &&
            componentHasViewProperties(component: component, otherComponents: otherComponents) {
            
            return .certain
        }
        
        // Has view properties
        if componentHasViewProperties(component: component, otherComponents: otherComponents) {
            return .high
        }
        
        return .none
    }
    
    // MARK: Private methods
    
    private func componentHasViewProperties(component: Component, otherComponents: [Component]) -> Bool {
        let propertiesTypes = component.variables.map({$0.type})
        
        let propertiesComponents = otherComponents.filter({propertiesTypes.contains($0.type)})
        
        for component in propertiesComponents {
            if component.isComponentView(otherComponents: otherComponents) {
                
                return true
            }
        }
        
        return false
    }
    
    private func componentHasEntityProperties(component: Component, otherComponents: [Component]) -> Bool {
        let propertiesTypes = component.variables.map({$0.type})
        
        let propertiesComponents = otherComponents.filter({propertiesTypes.contains($0.type)})
        
        for component in propertiesComponents {
            if entityCompatibility.compatibilityDegree(component: component, otherComponents: otherComponents).rawValue >= CompatibilityDegree.medium.rawValue {
                
                return true
            }
        }
        
        return false
    }
}
