//
//  ArchitectureAnalyser.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 19/08/2018.
//  Copyright © 2018 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation

func percentage(total: Int, current: Int) -> Int {
    if total == 0 {
        return 0
    }
    
    return (current * 100) / total
}

class ArchitectureAnalyser {
    
    func analyseModules(modules: [Module]) -> [String: (set: Set<String>, totalCount: Int, totalUsedTypesInModule1: Int)] {
        var dependencies = [String: (set: Set<String>, totalCount: Int, totalUsedTypesInModule1: Int)]()
        
        let allComponents = modules.map({$0.components}).flatMap({$0})
        
        var totalDependencies = 0
        
        for module in modules {
            
            for otherModule in modules {
                let dependentItems = module.dependentTypesFromModule(module: otherModule, allComponents: allComponents)
                
                if dependentItems.count > 0 {
                    // The module 1 depends on 2
                    totalDependencies = 0
                    
                    for component in module.components {
                        for item in dependentItems {
                            let val = component.numberOfElementsOfType(type: item)
                            
                            if val > 0 {
//                                print("Component: \(component.name) - item: \(item) = \(val)")
                            }
                        
                            totalDependencies += val
                        }
                    }
                    
                    let totalUsedTypes = module.usedOutsideTypesArray
                    
                    dependencies["\(module.name) depends on \(otherModule.name)"] = (set: dependentItems, totalCount: totalDependencies, totalUsedTypesInModule1: totalUsedTypes.count)
                } else {
//                    print("test")
                }
            }
            
            let internalItems = module.dependentInsideTypesFromModule(module: module, allComponents: allComponents)
            
            print("Module: \(module.name) external dependencies \( module.usedOutsideTypesArray.count) internal dependencies \(internalItems.count)")
        }
        
        return dependencies
    }
    
    func percentages(modules: [Module]) {
        let allComponents = modules.map({$0.components}).flatMap({$0})
        
        print("Total components: \(allComponents.count)")
        
        for module in modules {
            print("Module \(module.name) has: \(module.components.count) components \(percentage(total: allComponents.count, current: module.components.count))% of total.")
        }
    }
    
    
    
}
