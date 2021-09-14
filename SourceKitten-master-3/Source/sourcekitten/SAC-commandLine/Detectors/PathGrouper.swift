//
//  PathGrouper.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 18/08/2018.
//  Copyright © 2018 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation

class PathGrouper {
    
    func groupByPaths(components: [Component]) -> [Module] {
        let allPaths = components.map({$0.path})
        let commonPrefix = allPaths.longestCommonPrefix()

        var splitByPath = [String:[Component]]()

        for component in components {
            var subpath = component.path.replacingOccurrences(of: commonPrefix, with: "")
            subpath = subpath.replacingOccurrences(of: component.name, with: "")
            subpath = subpath.replacingOccurrences(of: ".swift", with: "")
            
            var items = splitByPath[subpath] ?? [Component]()
            items.append(component)
            
            splitByPath[subpath] = items
        }
        
        var modules = [Module]()
        
        for (key,value) in splitByPath {
            let module = Module(name: key, components: value)
            
            modules.append(module)
        }
        
        return modules
    }
    
}
