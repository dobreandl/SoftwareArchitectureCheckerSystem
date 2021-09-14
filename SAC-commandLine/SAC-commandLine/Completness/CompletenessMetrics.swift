//
//  CompletenessMetrics.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 05/03/2020.
//  Copyright © 2020 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation

class CompletenessMetrics {
    
    private struct Constants {
        static let model = 0
        static let view = 1
        static let controller = 2
    }
    
    
    func computeLabels(codebase: MVCCodebase) {
        let allElementsBenchmark = Set(codebase.benchmark.model + codebase.benchmark.view + codebase.benchmark.controller)
        let allElementsMacsSimple = Set(codebase.macsSimple.model + codebase.macsSimple.view + codebase.macsSimple.controller)
        let allElementsMacsCoordinator = Set(codebase.macsCoordinator.model + codebase.macsCoordinator.view + codebase.macsCoordinator.controller)
        let allElementsCarlSimple = Set(codebase.carlSimple.model + codebase.carlSimple.view + codebase.carlSimple.controller)
        
        let allElementsHybrid = Set(codebase.hybrid.model + codebase.hybrid.view + codebase.hybrid.controller)
        
        let allElements = Array(allElementsBenchmark.intersection(allElementsMacsSimple).intersection(allElementsMacsCoordinator).intersection(allElementsCarlSimple).intersection(allElementsHybrid))
        
        print(codebase.benchmark.controller)
        print(codebase.macsSimple.controller)
        
        var s1 = Set(codebase.benchmark.controller)
        s1.subtract(Set(codebase.macsSimple.controller))
        
        print(s1)

        let labelsBenchmark = labelElements(allElements: allElements, layer: codebase.benchmark)
        let macsSimple = labelElements(allElements: allElements, layer: codebase.macsSimple)
        let macsCoordinator = labelElements(allElements: allElements, layer: codebase.macsCoordinator)
        let carlSimple = labelElements(allElements: allElements, layer: codebase.carlSimple)
        let hybrid = labelElements(allElements: allElements, layer: codebase.carlSimple)
        
        print("Elements \(allElements.count)")
        
        print("\n\n ******* Labels benchmark ******** \n\n")
        print(labelsBenchmark)
        
        print("\n\n ******* Labels macs simple ******** \n\n")
        print(macsSimple)
        
        print("\n\n ******* Labels macs coordinator ******** \n\n")
        print(macsCoordinator)
        
        print("\n\n ******* Labels carl simple ******** \n\n")
        print(carlSimple)
        
        print("\n\n ******* Labels HYBRID ******** \n\n")
        print(hybrid)
    }
    
    // MARK: Private methods
    
    private func labelElements(allElements: [String], layer: Layers) -> [Int] {
        var items = [Int]()
        
        for element in allElements {
            if layer.model.contains(element) {
                
                items.append(Constants.model)
                
            } else if layer.view.contains(element) {
                items.append(Constants.view)
                
            } else if layer.controller.contains(element) {
                items.append(Constants.controller)
            }
        }
        
        return items
    }
}
