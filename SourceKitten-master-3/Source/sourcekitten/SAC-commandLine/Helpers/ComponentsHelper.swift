//
//  ComponentsHelper.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 20/11/2019.
//  Copyright © 2019 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation


class ComponentsHelper {
    
    
    func splitComponentsCodebase(components:[Component], model: [String], view:[String], controller:[String]) -> [Module] {
        var models = [Component]()
        var views = [Component]()
        var controllers = [Component]()
        
        for component in components {
            let name = component.name
            
            if model.contains(name) {
                models.append(component)
                continue
            }
            
            if view.contains(name) {
                views.append(component)
                continue
            }
            
            if controller.contains(name) {
                controllers.append(component)
                continue
            }
        }
        
        let cts = NativeTypes.componentsFromNativeTypes(types: NativeTypes.controllers + NativeTypes.viewControllers)
        
        controllers = controllers + cts
        views = views + NativeTypes.componentsFromNativeTypes(types: NativeTypes.views)
        
        
        let m = Module(name: "Model", components: models)
        let v = Module(name: "View", components: views)
        let c = Module(name: "Controller", components: controllers)
        
        return [m,v,c]
    }
    
}
