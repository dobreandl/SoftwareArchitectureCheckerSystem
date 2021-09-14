//
//  CCDComputer.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 24/08/2019.
//  Copyright © 2019 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation


class CCDComputer {
    
    func computeCCD(module: Module, allModules: [Module]) -> Int {
        var ccdValue = 0
        
        for comp in module.components {
            //            if comp.name == "ShapeUtil" {
            let val = getAllComps(component: comp, module: module, allModules: allModules).count
//            print("val \(comp.name): \(val)")
            
            ccdValue += val
            //            }
        }
        
        
        return ccdValue
    }
    
    func getAllComps(component: Component, module: Module, allModules: [Module]) -> Set<Component> {
        var comps = getFirstLevelComponents(comp: component, module: module, allModules: allModules)
        
        for (_,comp) in comps.enumerated() {
            comps = comps.union(getFirstLevelComponents(comp: comp, module: module, allModules: allModules))
        }
        
        return comps
    }
    
    func getFirstLevelComponents(comp: Component, module: Module, allModules: [Module]) -> Set<Component> {
        let methodsComps = componentsFor(methods: comp.methods, allModules: allModules)
        let variableComps = componentsFor(variables: comp.variables, allModules: allModules)
        let inheritedComps = componentsForInheritedTypes(comp: comp, allModules: allModules)
        
        var items = methodsComps.union(variableComps).union(inheritedComps)
        
        if items.count == 0 {
            // Add dummy item
            let randomString = UUID().uuidString
            items.insert(Component(name: randomString, kind: .kClass, path: "", inheritedTypes: [], type: randomString, methods: [], variables: []))
        }
        
        return items
    }
    
    func componentsFor(variables: [Variable], allModules: [Module]) -> Set<Component> {
        var comps = Set<Component>()
        let variableTypes = variables.map{$0.type}
        
        for module in allModules {
            for c in module.components {
                if variableTypes.contains(c.type) {
                    comps.insert(c)
                }
            }
        }
        
        
        return comps
    }
    
    func componentsForInheritedTypes(comp: Component, allModules:[Module]) -> Set<Component> {
        var comps = Set<Component>()
        let types = comp.inheritedTypes
        
        for module in allModules {
            for c in module.components {
                if types.contains(c.type) {
                    comps.insert(c)
                }
            }
        }
        
        
        return comps
    }
    
    func componentsFor(methods: [Method], allModules: [Module]) -> Set<Component> {
        var comps = Set<Component>()
        var variableTypes = [String]()
        
        for m in methods {
            variableTypes.append(contentsOf: m.parameterTypes)
        }
        
        for module in allModules {
            for c in module.components {
                if variableTypes.contains(c.type) {
                    comps.insert(c)
                }
            }
        }
        
        return comps
    }
    
}
