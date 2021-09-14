//
//  Matrix.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 04/08/2020.
//  Copyright © 2020 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation

class Matrix {
    
    private let modelBuilder = ModuleBuilder()
    
    // MARK: Public methods
    
    func buildHybridMatrixMacs(codebaseLayers: Layers, path: String, codebase: String) {
        let modules = modelBuilder.computeModulesCodebase(layers: codebaseLayers, path: path)
        
        guard let model = modules.first(where: {$0.name == "model"}),
            let controller = modules.first(where: {$0.name == "controller"}),
            let view = modules.first(where: {$0.name == "view"}) else {
                return
        }
        
        let allComponents = modules.flatMap({$0.components})
        
        buildMatrixMacsComponent22(codebase: codebase, modelComponents: model.components,
                             controllerComponents: controller.components,
                             viewComponents: view.components)
    }
    
    
    func buildHybridMatrixCARLPlus(codebaseLayers: Layers, path: String, codebase: String) {
        let modules = modelBuilder.computeModulesCodebase(layers: codebaseLayers, path: path)
        
        guard let model = modules.first(where: {$0.name == "model"}),
            let controller = modules.first(where: {$0.name == "controller"}),
            let view = modules.first(where: {$0.name == "view"}) else {
                return
        }
        
        let allComponents = modules.flatMap({$0.components})
        
        buildMatrixCARLPlus(codebase: codebase, modelComponents: model.components,
                             controllerComponents: controller.components,
                             viewComponents: view.components)
    }
    
    
    func buildHybridMatrixHydePlus(codebaseLayers: Layers, path: String, codebase: String) {
        let modules = modelBuilder.computeModulesCodebase(layers: codebaseLayers, path: path)
        
        guard let model = modules.first(where: {$0.name == "model"}),
            let controller = modules.first(where: {$0.name == "controller"}),
            let view = modules.first(where: {$0.name == "view"}) else {
                return
        }
        
        let allComponents = modules.flatMap({$0.components})
        
        buildMatrixMacsComponentHydePlus(codebase: codebase, modelComponents: model.components,
                             controllerComponents: controller.components,
                             viewComponents: view.components)
    }
    
    
    func buildHybridMatrix(codebaseLayers: Layers, path: String, codebase: String) {
        let modules = modelBuilder.computeModulesCodebase(layers: codebaseLayers, path: path)
        
        guard let model = modules.first(where: {$0.name == "model"}),
            let controller = modules.first(where: {$0.name == "controller"}),
            let view = modules.first(where: {$0.name == "view"}) else {
                return
        }
        
        let allComponents = modules.flatMap({$0.components})
        
        let modelToBeParsed = preParse(components: model.components, all: allComponents)
        
        buildMatrixComponent(codebase: codebase, components: modelToBeParsed,
                             controllerComponents: controller.components,
                             viewComponents: view.components)
    }
    
    
    func displayHybridComponentsSplit(codebaseLayers: Layers, clustering: [Int], path: String) {
        let modules = modelBuilder.computeModulesCodebase(layers: codebaseLayers, path: path)
        
        guard let model = modules.first(where: {$0.name == "model"}) else {
                return
        }
        
        let allComponents = modules.flatMap({$0.components})
        
        let modelToBeParsed = preParse(components: model.components, all: allComponents)
        
        printComponents(clustering: clustering, components: modelToBeParsed)
    }
    
    
    func displayHybridComponentsSplitMacs(codebaseLayers: Layers, clustering: [Int], path: String) {
        let modules = modelBuilder.computeModulesCodebase(layers: codebaseLayers, path: path)
        
        guard let model = modules.first(where: {$0.name == "model"}),
        let controller = modules.first(where: {$0.name == "controller"}) else {
            return
        }
        
        let allComponents = modules.flatMap({$0.components})
        
        printComponents(clustering: clustering, components: allComponents)
    }
    
    // MARK: Private methods
    
    
    private func preParse(components: [Component], all: [Component]) -> [Component] {
        var newComponents = [Component]()

        for component in components {
            if component.kind == .kClass || component.kind == .kStruct {
                newComponents.append(component.addMethodsFromExtensions(allComponents: all))
            }
        }

        var resultComponents = [Component]()
        for component in newComponents {
            resultComponents.append(component.addMethodsAndVariablesFromParents(allComponents: all))
        }

        return resultComponents
    }
    
    private func printComponents(clustering: [Int], components:[Component]) {
        
        var groups = [0 : [String](),
                      1 : [String](),
                      2 : [String](),
                      3 : [String](),
                      4 : [String](),
                      5 : [String](),
                      6 : [String]()]
        
        for (index,component) in components.enumerated() {
            if index < clustering.count {
                groups[clustering[index]]?.append(component.name)
            }
        }
        
        
        for key in groups.keys {
            print("\(key) _________\n\n")
            
            var str = ""
            for val in groups[key]! {
                str += "\(val),"
            }
            
            print(str)
        }
    }
    
    private func buildMatrixComponent(codebase: String, components:[Component], controllerComponents: [Component], viewComponents: [Component]) {
        let others = Array(components)
        
        var matrix = [[Int]]()
        
        let controllerViewAndModelTypes = components.map({$0.type}) + controllerComponents.map({$0.type}) + viewComponents.map({$0.type})
        let controllerTypes = viewComponents.map({$0.type}) + NativeTypes.viewControllers + NativeTypes.controllers
        
        for (index,component) in components.enumerated() {
            var values = [Int]()
            
            for component2 in others {
                // Distance between the names
                 values.append(String.levenshtein(aStr: component.name, bStr: component2.name))
                
                // If the component inherits from another model component
                if component.inheritedTypes.contains(component2.type) {
                    values.append(1000)
                } else {
                    values.append(0)
                }
            }
            
            // Check if is using any Codebase defined item, you can add native types as well
            if component.isUsingOneOfTheTypes(types: controllerViewAndModelTypes) {
                values.append(100)

            } else {
                values.append(0)
            }
            
            // Check if using Controller items
            if component.isUsingOneOfTheTypes(types: controllerTypes) {
                values.append(500)
                
            } else {
                values.append(0)
            }
            
            // If class 1, if struct -1
            
            if component.kind == .kClass {
                values.append(1000)
            } else if component.kind == .kStruct {
                values.append(0)
            } else {
                values.append(0)
            }
            
            matrix.append(values)
        }
        
        print(matrix)
        write(codebase: codebase, matrix: matrix)

        return
    }
    
    
    private func buildMatrixMacsComponent(codebase: String, modelComponents:[Component], controllerComponents: [Component], viewComponents: [Component]) {
        var matrix = [[Int]]()
        
        let modelAndController = modelComponents + controllerComponents + viewComponents
        
        let controllerTypes = controllerComponents.map({$0.type}) + NativeTypes.viewControllers + NativeTypes.controllers
        
        for (index,component) in modelAndController.enumerated() {
             var values = [Int]()
            
            
            // If it was controller or not
            if controllerComponents.contains(component) {
                values.append(500)
                
            } else {
                values.append(0)
            }
            
            for component2 in modelAndController {
                // Distance between the names
                values.append(String.levenshtein(aStr: component.name, bStr: component2.name))

                let ownMethods = component.methods
                let ownProperties = component.variables
                
                let otherMethods = component.methods
                let otherProperties = component.variables
                
                var commonMethods = 0
                var commonProperties = 0
                
                for method in ownMethods {
                    if let index = otherMethods.first(where: {$0 == method}) {
                        commonMethods += 1
                    }
                }
                
                for prop in ownProperties {
                    if let index = otherProperties.first(where: {$0 == prop}) {
                        commonProperties += 1
                    }
                }
                
                values.append(commonMethods)
                values.append(commonProperties)
                
            }
            
            // Check if is using any Codebase defined item, you can add native types as well
            if component.isUsingOneOfTheTypes(types: controllerTypes) {
                values.append(1)
                
            } else {
                values.append(0)
            }

             matrix.append(values)
        }

        print(matrix)
        write(codebase: codebase, matrix: matrix)
        
        return
    }

    private func buildMatrixCARLPlus(codebase: String, modelComponents:[Component], controllerComponents: [Component], viewComponents: [Component]) {
        let components = modelComponents + controllerComponents + viewComponents
        
        var matrix = [[Int]]()
        
        let viewTypes = NativeTypes.views
        let controllerTypes = NativeTypes.viewControllers + NativeTypes.controllers
        
        for (index,component) in components.enumerated() {
            var values = [Int]()
            
            for component2 in components {
                // Distance between the names
                 values.append(String.levenshtein(aStr: component.name, bStr: component2.name))
                
                let ownMethods = component.methods
                let ownProperties = component.variables
                
                let otherMethods = component.methods
                let otherProperties = component.variables
                
                var commonMethods = 0
                var commonProperties = 0
                
                for method in ownMethods {
                    if let index = otherMethods.first(where: {$0 == method}) {
                        commonMethods += 1
                    }
                }
                
                for prop in ownProperties {
                    if let index = otherProperties.first(where: {$0 == prop}) {
                        commonProperties += 1
                    }
                }
                
                values.append(commonMethods)
                values.append(commonProperties)
            }
            
            
            // View
            if component.isUsingOneOfTheTypes(types: viewTypes) {
                values.append(750)

            } else {
                values.append(0)
            }
            
            // Check if using Controller items
            if component.isUsingOneOfTheTypes(types: controllerTypes) {
                values.append(2000)
                
            } else {
                values.append(0)
            }
            
            matrix.append(values)
        }
        
        print(matrix)
        write(codebase: codebase, matrix: matrix)
        
        return
    }
    
    
    private func buildMatrixMacsComponent22(codebase: String, modelComponents:[Component], controllerComponents: [Component], viewComponents: [Component]) {
        var matrix = [[Int]]()
        
        let modelAndController = modelComponents + controllerComponents + viewComponents
        
        let controllerTypes = controllerComponents.map({$0.type}) + NativeTypes.viewControllers + NativeTypes.controllers
        let viewTypes = viewComponents.map({$0.type}) + NativeTypes.views
        
        for (index,component) in modelAndController.enumerated() {
             var values = [Int]()
            
            
            // If it was controller or not
            if controllerComponents.contains(component) || viewComponents.contains(component) {
                values.append(500)

            } else {
                values.append(0)
            }
            
            for component2 in modelAndController {
                // Distance between the names
                values.append(String.levenshtein(aStr: component.name, bStr: component2.name))
                
                let ownMethods = component.methods
                let ownProperties = component.variables
                
                let otherMethods = component.methods
                let otherProperties = component.variables
                
                var commonMethods = 0
                var commonProperties = 0
                
                for method in ownMethods {
                    if let index = otherMethods.first(where: {$0 == method}) {
                        commonMethods += 1
                    }
                }
                
                for prop in ownProperties {
                    if let index = otherProperties.first(where: {$0 == prop}) {
                        commonProperties += 1
                    }
                }
                
                values.append(commonMethods)
                values.append(commonProperties)
            }
       
             matrix.append(values)
        }

        write(codebase: codebase, matrix: matrix)
    
        return
    }
    
    private func buildMatrixMacsComponentHydePlus(codebase: String, modelComponents:[Component], controllerComponents: [Component], viewComponents: [Component]) {
        var matrix = [[Int]]()
        
        let modelAndController = modelComponents + controllerComponents // + viewComponents
        
        let controllerTypes = controllerComponents.map({$0.type}) + NativeTypes.viewControllers + NativeTypes.controllers
        let viewTypes = viewComponents.map({$0.type}) + NativeTypes.views
        
        for (index,component) in modelAndController.enumerated() {
             var values = [Int]()
            
            
            // If it was controller or not
            if controllerComponents.contains(component) {
                values.append(500)

            } else {
                values.append(0)
            }
            
            for component2 in modelAndController {
                // Distance between the names
                values.append(String.levenshtein(aStr: component.name, bStr: component2.name))
                
                let ownMethods = component.methods
                let ownProperties = component.variables
                
                let otherMethods = component.methods
                let otherProperties = component.variables
                
                var commonMethods = 0
                var commonProperties = 0
                
                for method in ownMethods {
                    if let index = otherMethods.first(where: {$0 == method}) {
                        commonMethods += 1
                    }
                }
                
                for prop in ownProperties {
                    if let index = otherProperties.first(where: {$0 == prop}) {
                        commonProperties += 1
                    }
                }
                
                values.append(commonMethods)
                values.append(commonProperties)
                
                let numberOfDependencies = component.numberOfElementsOfType(type: component2.name)
                values.append(numberOfDependencies)
            }

            // Check if is using any Codebase defined item, you can add native types as well
            if component.isUsingOneOfTheTypes(types: controllerTypes) {
                values.append(1)

            } else {
                values.append(0)
            }
            
            
            if component.name.contains("controller") {
                values.append(10000)
            } else {
                values.append(0)
            }
            
             matrix.append(values)
        }

        print(matrix)
        write(codebase: codebase, matrix: matrix)
            
        return
    }
    
    
    private func write(codebase: String, matrix: [[Int]]) {
        let file = "/Users/dragos/Documents/Doctorat/Doctorat-GIT/Code/SAC-commandLine/\(codebase).txt"
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            //writing
            do {
                
                var txt = ""
                
                for line in matrix {
                    let val = line.map{"\($0)"}.joined(separator: ",")
                    txt += "\n" + val
                }
                
                try txt.write(to: URL(fileURLWithPath: file), atomically: false, encoding: .utf8)
            }
            catch {/* error handling here */
                
                print("error writting the file")
            }
            
            //reading
        }
    }
    
    
}
