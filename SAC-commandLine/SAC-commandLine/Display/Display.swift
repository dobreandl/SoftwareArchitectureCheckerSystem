//
//  Display.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 11/08/2018.
//  Copyright © 2018 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation

class Display {
    
    func printComponents(components: [Component]) {
        print("\n\n_____Classes______\n\n")
        printComponents(components: components, kind: .kClass)
        print("\n\n_____Extensions______\n\n")
        printComponents(components: components, kind: .kExtension)
        print("\n\n_____Structs______\n\n")
        printComponents(components: components, kind: .kStruct)
        print("\n\n_____Protocols______\n\n")
        printComponents(components: components, kind: .kProtocol)
    }
    
    
    func displayComponentsByTypes(elements: [ClassType:[Component]]) {
        for (key,value) in elements {
            print("\n\n_____\(key.rawValue)______\n\n")
           
                value.forEach({ (component) in
                    printComponent(component, kind: component.kind)
                })
        }
    }
    
    func displayComponentsByGroups(elements: [String:[Component]]) {
        for (key,value) in elements {
            print("\n\n*****\(key)******")
            value.forEach({ (component) in
                if component.kind == .kClass || component.kind == .kStruct {
                    print("     \(component.name)")
                }
            })
        }
    }
    
    func displayDependencies(_ dependencies: [String: (set: Set<String>, totalCount: Int, totalUsedTypesInModule1: Int)]) {
        for (key, value) in dependencies {
            print("\n   *\(key) -> Total: \(value.totalCount) Different items \(value.set.count)*  Total in first module - \(value.totalUsedTypesInModule1) percentage: \(percentage(total: value.totalUsedTypesInModule1, current: value.totalCount))  \n")
            
//            for item in value.set {
//                print("     -\(item)")
//            }
        }
    }
    
    func displayModules(_ modules: [Module]) {
        for module in modules {
            print("\n\n*****\(module.name)******")
            
            module.components.forEach({ (component) in
                if component.kind == .kClass || component.kind == .kStruct {
                    print("     \(component.name)")
                }
            })
            
            print("_____Outside types_____")
            
            module.usedOutsideTypes.forEach { (type) in
                print("         ->\(type)")
            }
        }
    }
    
    // MARK: Private methods
    
    private func printComponents(components: [Component], kind: ElementDeclaration) {
        let classes = components.filter({$0.kind == kind})
        
        for element in classes {
            printComponent(element, kind: kind)
        }
    }
    
    private func printComponent(_ element: Component, kind: ElementDeclaration) {
        print("\n\n__________________________\n")
        print("**\(kind.rawValue)**")
        print("Name: \(element.name)")
        print("Type: \(element.type)")
        print("Inherits from \(element.inheritedTypes)")

        if element.variables.count > 0 {
            displayVariables(element.variables)
        }

        if element.methods.count > 0 {
            displayMethods(element.methods)
        }
    }
    
    private func displayMethods(_ methods: [Method]) {
        print("\nMethods:")
        for method in methods {
            displayMethod(method)
        }
    }
    
    private func displayMethod(_ method: Method) {
        print("     \(method.name) -> params: \(method.parameterTypes)")
    }
    
    private func displayVariables(_ variables: [Variable]) {
        print("\nVariables:")
        for variable in variables {
            displayVariable(variable)
        }
    }
    
    private func displayVariable(_ variable: Variable) {
        print("* \(variable.name): \(variable.type)")
    }
}
