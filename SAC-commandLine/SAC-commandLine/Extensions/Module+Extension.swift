//
//  Module+Extension.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 19/08/2018.
//  Copyright © 2018 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation

extension Module {
    
    func dependentTypesFromModule(module: Module, allComponents: [Component]) -> Set<String> {
        var intersection =  self.usedOutsideClassesAndStructsTypes.intersection(module.containedTypes)
        
        let allComponentsNames = allComponents.filter({$0.kind == .kStruct || $0.kind == .kClass}).map({$0.name})
        let itemsToBeRemoved = intersection.filter({!allComponentsNames.contains($0)})
        
        for item in itemsToBeRemoved {
            intersection.remove(item)
        }
        
        return intersection
    }
    
    
    
    func dependentInsideTypesFromModule(module: Module, allComponents: [Component]) -> Set<String> {
        var intersection =  self.usedInsideClassesAndStructsTypes.intersection(module.containedTypes)
        
        let allComponentsNames = allComponents.filter({$0.kind == .kStruct || $0.kind == .kClass}).map({$0.name})
        let itemsToBeRemoved = intersection.filter({!allComponentsNames.contains($0)})
        
        for item in itemsToBeRemoved {
            intersection.remove(item)
        }
        
        
        let itemsToBeRemoved2 = intersection.filter({!components.map({$0.name}).contains($0)})
        
        for item in itemsToBeRemoved2 {
            intersection.remove(item)
        }
        
        return intersection
    }
}
