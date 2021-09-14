//
//  Module.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 19/08/2018.
//  Copyright © 2018 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation

struct Module {
    let name: String
    let components: [Component]
    
    var usedOutsideTypes: Set<String> {
        get {
            var outsideTypes = Set<String>()

            for component in components {
                outsideTypes = outsideTypes.union(component.allUsedTypes())
            }
            
            components.forEach { (component) in
                if outsideTypes.contains(component.type) {
                    outsideTypes.remove(component.type)
                }
            }
            
            return outsideTypes
        }
    }
    
    var usedOutsideClassesAndStructsTypes: Set<String> {
        get {
            var outsideTypes = Set<String>()

            for component in components {
                if component.kind == .kStruct || component.kind == .kClass {
                    outsideTypes = outsideTypes.union(component.allUsedTypes())
                }
            }

            components.forEach { (component) in
                if outsideTypes.contains(component.type) {
                    outsideTypes.remove(component.type)
                }
            }

            return outsideTypes
        }
    }
    
    
    var usedInsideClassesAndStructsTypes: Set<String> {
        get {
            var outsideTypes = Set<String>()
            
            for component in components {
                if component.kind == .kStruct || component.kind == .kClass {
                    outsideTypes = outsideTypes.union(component.allUsedTypes())
                }
            }
            
            components.forEach { (component) in
                if !outsideTypes.contains(component.type) {
                    outsideTypes.remove(component.type)
                }
            }
            
            return outsideTypes
        }
    }
    
    
    var usedOutsideTypesArray: [String] {
        var set = Set<String>()
        
        for component in components {
            set = set.union(component.allUsedTypes())
        }
        
        components.forEach { (component) in
            if set.contains(component.type) {
                set.remove(component.type)
            }
        }
        
        var outsideTypes = [String]()
        
        for component in components {
            outsideTypes.append(contentsOf: component.allUsedTypesArray())
        }
        
        outsideTypes = outsideTypes.filter({set.contains($0)})
        
        return outsideTypes
    }
    
    var containedTypes: Set<String> {
        get {
            var containedTypes = Set<String>()
        
            components.forEach { (component) in
                containedTypes.insert(component.type)
            }
            
            return containedTypes
        }
    }
}
