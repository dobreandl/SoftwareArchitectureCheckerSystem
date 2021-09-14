//
//  ClustersComparision.swift
//  sourcekitten
//
//  Created by Dragos Dobrean on 09.03.2021.
//  Copyright © 2021 SourceKitten. All rights reserved.
//

import Foundation


class ClustersComparision {
    
    func showStats(codebase: MVCCodebase) {
        
        let benchmark = codebase.benchmark
        let allBenchmark = benchmark.model + benchmark.view + benchmark.controller
        
        print("Number of components \(allBenchmark.count)")
        
        let macsSimple = fixLayer(layer: codebase.macsSimple, allComponents: allBenchmark)
        let macsCoord = fixLayer(layer: codebase.macsCoordinator, allComponents: allBenchmark)
        let carl = fixLayer(layer: codebase.carlSimple, allComponents: allBenchmark)
        let hybrid = fixLayer(layer: codebase.hybrid, allComponents: allBenchmark)
        
        
        let allMacs = macsSimple.model + macsSimple.view + macsSimple.controller
        let allMacsCoord = macsCoord.model + macsCoord.view + macsCoord.controller
        let allCarl = carl.model + carl.view + carl.controller
        let allHybrid = hybrid.model + hybrid.view + hybrid.controller
        
        let setMacs = Set<String>(allMacs)
        let setCoord = Set<String>(allMacsCoord)
        let setCarl = Set<String>(allCarl)
        let setHybrid = Set<String>(allHybrid)
        
        let common = Set<String>(allBenchmark).intersection(setMacs).intersection(setCoord).intersection(setCarl).intersection(setHybrid)
        let components = Array<String>(common).sorted()
        
        let ground = fixLayer(layer: codebase.benchmark, allComponents: components)
    
        print("Common : \(common.count)")
        print("Ground count \(Set<String>(ground.model + ground.view + ground.controller).count)")

        showComparision(comps: Array<String>(common), macsSimple: macsSimple,
                        macsCoord: macsCoord, carl: carl, hybrid: hybrid, ground: ground)
    }
    
    private func showComparision(comps: [String], macsSimple: Layers, macsCoord: Layers, carl: Layers, hybrid: Layers, ground: Layers) {
        
        let sorted = comps.sorted()
        
        for comp in sorted {
            print("\(comp)")
        }
        
        showFor(name: "Ground", comps: sorted, layer: ground)
        
        showFor(name: "macsSimple", comps: sorted, layer: macsSimple)
        
        showFor(name: "macsCoord", comps: sorted, layer: macsCoord)
        
        showFor(name: "carl", comps: sorted, layer: carl)
        
        showFor(name: "hyde", comps: sorted, layer: hybrid)
    }
    
    private func showFor(name: String, comps: [String], layer: Layers) {
        print("\n\n__________\(name)__________\n\n")
        for comp in comps {
            
            if layer.model.contains(comp) {
                print("Model")
            }
            
            if layer.view.contains(comp) {
                print("View")
            }
            
            if layer.controller.contains(comp) {
                print("Controller")
            }
        }
    }
    
    private func compareLayers(macsSimple: Layers, macsCoord: Layers, carl: Layers, hybrid: Layers, ground: Layers) {
        compareLayers(name: "macsSimple vc macsCoord", l1: macsSimple, l2: macsCoord)
        compareLayers(name: "macsSimple vc carl", l1: macsSimple, l2: carl)
        compareLayers(name: "macsSimple vc hyde", l1: macsSimple, l2: hybrid)
        compareLayers(name: "macsSimple vc ground", l1: macsSimple, l2: ground)
        
        
        compareLayers(name: "macsCoord vc macsSimple", l1: macsCoord, l2: macsSimple)
        compareLayers(name: "macsCoord vc carl", l1: macsCoord, l2: carl)
        compareLayers(name: "macsCoord vc hyde", l1: macsCoord, l2: hybrid)
        compareLayers(name: "macsCoord vc ground", l1: macsCoord, l2: ground)
        
        compareLayers(name: "carl vc macsSimple", l1: carl, l2: macsSimple)
        compareLayers(name: "carl vc macsCoord", l1: carl, l2: macsCoord)
        compareLayers(name: "carl vc hyde", l1: carl, l2: hybrid)
        compareLayers(name: "carl vc ground", l1: carl, l2: ground)
        
        compareLayers(name: "hyde vc macsSimple", l1: hybrid, l2: macsSimple)
        compareLayers(name: "hyde vc macsCoord", l1: hybrid, l2: macsCoord)
        compareLayers(name: "hyde vc carl", l1: hybrid, l2: carl)
        compareLayers(name: "hyde vc ground", l1: hybrid, l2: ground)
        
        
        compareLayers(name: "ground vc macsSimple", l1: ground, l2: macsSimple)
        compareLayers(name: "ground vc macsCoord", l1: ground, l2: macsCoord)
        compareLayers(name: "ground vc carl", l1: ground, l2: carl)
        compareLayers(name: "ground vc hydee", l1: ground, l2: hybrid)
    }
    
    
    // MARK: Private methods
    
    
    private func compareLayers(name: String, l1: Layers, l2: Layers) {
        print("\n\n__________\(name)__________\n\n")
        
        print("Model")
        compareComponents(c1: l1.model, c2: l2.model)
        
        print("View")
        compareComponents(c1: l1.view, c2: l2.view)
        
        print("Controller")
        compareComponents(c1: l1.controller, c2: l2.controller)
    }
    
    private func compareComponents(c1: [String], c2: [String]) {
        let s1 = Set<String>(c1)
        let s2 = Set<String>(c2)
        
        let same = s1.intersection(s2)
        let diff = s1.count - same.count
        print("\(same.count)    idential components")
        print("\(percentageCalc(val: same.count, from: s1.count)) %")
        
        print("\(diff)    different components")
        print("\(percentageCalc(val: diff, from: s1.count)) %")
        
        print("\n")
    }
    
    private func percentageCalc(val: Int, from: Int) -> Double {
        let val = Double(val) * 100.0 / Double(from)
        
        return Double(round(1000 * val) / 1000)
    }
    
    private func fixLayer(layer: Layers, allComponents: [String]) -> Layers {
        let model = filterOutDuplicates(toFilter: layer.model, components: allComponents, otherLayers: layer.view + layer.controller)
        let view = filterOutDuplicates(toFilter: layer.view, components: allComponents, otherLayers: model + layer.controller)
        let controller = filterOutDuplicates(toFilter: layer.controller, components: allComponents, otherLayers: model + view)
        
        return Layers(model: model, view: view, controller: controller)
    }
    
    private func filterOutDuplicates(toFilter: [String], components: [String], otherLayers: [String]) -> [String] {
        let toFilterSet = Set<String>(toFilter)
        let compSet = Set<String>(components)
        
        let inters = toFilterSet.intersection(compSet)
        let otherLayers = Set<String>(otherLayers)
        
        let diff = inters.filter({!otherLayers.contains($0)})
        
        
        return Array<String>(diff)
    }
    
}
