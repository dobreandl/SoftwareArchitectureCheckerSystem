//
//  ACDCCDComputer.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 18/04/2020.
//  Copyright © 2020 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation

class ModuleBuilder {
    
    let raportParser = RaportParser()
    
    func computeModulesCodebase(layers: Layers, path: String) -> [Module] {
        let components = raportParser.parseRaport(path: path)
        let modules = modulesFrom(layers: layers, components: components)
        
        return modules
    }
    
    private func modulesFrom(layers: Layers, components: [Component]) -> [Module] {
        let model = Module(name: "model", components: componentsFrom(items: layers.model, allComponents: components))
        let view = Module(name: "view", components: componentsFrom(items: layers.view , allComponents: components))
        let ctrl = Module(name: "controller", components: componentsFrom(items: layers.controller, allComponents: components))
        
        return [model, view, ctrl]
    }
    
    private func componentsFrom(items: [String], allComponents: [Component]) -> [Component] {
        var comp = [Component]()
        
        for item in items {
            if let component = allComponents.first(where: {$0.name == item}) {
                comp.append(component)
            }
        }
        
        return comp
    }
}

class ACDCCDComputer {
    
    let ccd = CCDComputer()
    let raportParser = RaportParser()

    
    func computeForCodebase(codebase: MVCCodebase, path: String) {
        let components = raportParser.parseRaport(path: path)
        let modules = modulesFrom(layers: codebase.macsCoordinator, components: components)
        
        var totalCCD = 0
        for module in modules {
            let ccdValue = ccd.computeCCD(module: module, allModules: modules)
            let acdValue = ccdValue / module.components.count
            
            print("\(module.name)")
            print("CCD: \(ccdValue)")
            print("ACD: \(acdValue)")
            
            totalCCD += ccdValue
        }
        
        let comps = modules.map{$0.components.count}.reduce(0, +)
        print("Comps \(comps), component count \(components.count)")
        
        print("TOTAL CCD: \(totalCCD)")
        print("TOTAL AVG: \(Double(Double(totalCCD) / Double(comps)))")
    }
    
    private func modulesFrom(layers: Layers, components: [Component]) -> [Module] {
        let model = Module(name: "model", components: componentsFrom(items: layers.model, allComponents: components))
        let view = Module(name: "view", components: componentsFrom(items: layers.view + NativeTypes.views, allComponents: components))
        let ctrl = Module(name: "controller", components: componentsFrom(items: layers.controller + NativeTypes.controllers, allComponents: components))
        
       return [model, view, ctrl]
    }
    
    private func componentsFrom(items: [String], allComponents: [Component]) -> [Component] {
        var comp = [Component]()
        
        for item in items {
            if let component = allComponents.first(where: {$0.name == item}) {
                comp.append(component)
            }
        }
        
        return comp
    }
}
