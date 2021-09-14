//
//  CCDexample.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 24/08/2019.
//  Copyright © 2019 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation


class CCDExample {
    
    let computer = CCDComputer()
    
    func ccdTest() {
        let m = constructGraph()
        print(computer.computeCCD(module: m, allModules: [m]))
    }
    
    
    func constructGraph() -> Module {
        
        let node = Component(name: "Node", kind: .kClass, path: "", inheritedTypes: [], type: "Node", methods: [], variables: variablesFromComp([]))
        
        let shape = Component(name: "Shape", kind: .kClass, path: "", inheritedTypes: [], type: "Shape", methods: [], variables: variablesFromComp([]))
        
        let point = Component(name: "Point", kind: .kClass, path: "", inheritedTypes: ["Shape"], type: "Point", methods: [], variables: variablesFromComp([]))
        
        let edge = Component(name: "Edge", kind: .kClass, path: "", inheritedTypes: ["Shape"], type: "Edge", methods: [], variables: variablesFromComp([point, point]))
        
        let circle = Component(name: "Circle", kind: .kClass, path: "", inheritedTypes: ["Shape"], type: "Circle", methods: [], variables: variablesFromComp([point]))
        
        let vertex = Component(name: "Vertex", kind: .kClass, path: "", inheritedTypes: ["Point", "Node"], type: "Vertex", methods: [], variables: variablesFromComp([]))
        
        let square = Component(name: "Square", kind: .kClass, path: "", inheritedTypes: ["Shape"], type: "Square", methods: [], variables: variablesFromComp([vertex, vertex, vertex, vertex]))
        
        let triangle = Component(name: "Triangle", kind: .kClass, path: "", inheritedTypes: ["Shape"], type: "Triangle", methods: [], variables:variablesFromComp([vertex, vertex, vertex]))
        
        let polygon = Component(name: "Polygon", kind: .kClass, path: "", inheritedTypes: ["Shape"], type: "Polygon", methods: [], variables:variablesFromComp([vertex, vertex, vertex]))
        
        
        let shapeUtil = Component(name: "ShapeUtil", kind: .kClass, path: "", inheritedTypes: [],
                                  type: "ShapeUtil", methods: [],
                                  variables: variablesFromComp([vertex, polygon, triangle, square, edge, circle, point]))
        let shapeEditor = Component(name: "ShapeEditor", kind: .kClass, path: "", inheritedTypes: [], type: "ShapeEditor", methods: [], variables: variablesFromComp([shapeUtil, shape]))
        
        
        let m = Module(name: "test", components: [shape, shapeEditor, shapeUtil, polygon, triangle, square, vertex, circle, edge, point, node])
        
        return m
        
    }
    
    private func variablesFromComp(_ comps: [Component]) -> [Variable] {
        var variables = [Variable]()
        
        for i in 0..<comps.count {
            let comp = comps[i]
            let v = Variable(name: "\(i)", type: comp.type, kind: .kClassVariable)
            
            variables.append(v)
        }
        
        return variables
    }
}
