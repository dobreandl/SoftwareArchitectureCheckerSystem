//
//  MVCAnalyser.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 19/08/2018.
//  Copyright © 2018 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation

class MVCAnalyser {
    
    struct Constants {
        static let controller = "Controller"
        static let coordinator = "Coordinator"
        static let view = "View"
        static let model = "Model"
    }
    
    let typeInferer = TypeInferer()
    
    func splitMVCClasses(components: [Component]) -> [Module] {
        print("\n\nComponents \(components.count)")
        // Add methods from extensions
        var newComponents = [Component]()
        
        for component in components {
            newComponents.append(component.addMethodsFromExtensions(allComponents: components))
        }
        
        let vc = detectControllers(components: newComponents)
        
        for item in vc.components {
            if let index = newComponents.index(of: item) {
                newComponents.remove(at: index)
            }
        }
        
        
        let view = detectViews(components: newComponents)
        
        let comp = vc.components + view.components
        let remainingItems = newComponents.filter({!(comp.contains($0) || comp.map({$0.name}).contains($0.name))})
        
        let model = Module(name: Constants.model, components: remainingItems)
        
        let modules = [model, view, vc]
    
        return modules
    }
    
    // MARK: Private methods
    
    private func detectControllers(components: [Component]) -> Module {
        let viewControllers = typeInferer.detect(components: components) { (component, others) -> Bool in
            return component.isComponentViewController(otherComponents: others)
        }
        
        let controllers = typeInferer.detect(components: components) { (component, others) -> Bool in
            return component.isComponentController(otherComponents: others)
        }
        
        let coordinatingControllers = typeInferer.detect(components: components) { (component, others) -> Bool in
            return component.isComponentFirstTypeOfCoordinatingController(otherComponents: others, controllers: viewControllers + controllers)
        }

        var stop = false
        var identified = coordinatingControllers
        var count = 0
        var second = [Component]()

        while stop == false {
            var secondTypeControllers = typeInferer.detect(components: components) { (component, others) -> Bool in
                return component.isComponentSecondTypeOfCoordinatingController(otherComponents: others, coordinatingControllers: identified)
            }

            secondTypeControllers = secondTypeControllers.filter{!identified.contains($0)}

            second = secondTypeControllers

            identified += secondTypeControllers

            if secondTypeControllers.count == 0 {
                stop = true
            } else {
                count = secondTypeControllers.count
            }
        }
        
        
        var moduleComponents = viewControllers + controllers + identified
//
        
//        var moduleComponents = viewControllers + controllers  //+ identified
        
        let nativeType = NativeTypes.componentsFromNativeTypes(types: NativeTypes.controllers + NativeTypes.viewControllers)
        moduleComponents += nativeType
        
//       let moduleComponents = viewControllers + controllers + nativeType //+ identified
        
        
        let cordinatingModule = Module(name: "CoordinatingControllers", components: Array(identified))
        let ctrModule = Module(name: "CTR", components: Array(viewControllers + controllers))

        let dependentItems = ctrModule.dependentTypesFromModule(module: cordinatingModule, allComponents: components)

//        print(dependentItems)
        
        
        
        var totalDependencies = 0

        for component in ctrModule.components {
            for item in dependentItems {
                let val = component.numberOfElementsOfType(type: item)

                //                            if val > 0 {
                //                                print("Component: \(component.name) - item: \(item) = \(val)")
                //                            }

                totalDependencies += val
            }
        }
        
//        print("Controller depends on Coordinators \(dependentItems.count) different \(totalDependencies)")
        
        
        let modulesSet = Array(Set<Component>(moduleComponents))
        
        let module = Module(name: Constants.controller, components: modulesSet)
        
        return module
    }
    
    
    
    private func detectCoordinatingControllers(components: [Component]) -> Module {
        let viewControllers = typeInferer.detect(components: components) { (component, others) -> Bool in
            return component.isComponentViewController(otherComponents: others)
        }
        
        let controllers = typeInferer.detect(components: components) { (component, others) -> Bool in
            return component.isComponentController(otherComponents: others)
        }
        
        let coordinatingControllers = typeInferer.detect(components: components) { (component, others) -> Bool in
            return component.isComponentFirstTypeOfCoordinatingController(otherComponents: others, controllers: viewControllers + controllers)
        }
        
        var stop = false
        var identified = coordinatingControllers
        var count = 0
        var second = [Component]()
        
        while stop == false {
            var secondTypeControllers = typeInferer.detect(components: components) { (component, others) -> Bool in
                return component.isComponentSecondTypeOfCoordinatingController(otherComponents: others, coordinatingControllers: identified)
            }
            
            secondTypeControllers = secondTypeControllers.filter{!identified.contains($0)}
            
            second = secondTypeControllers
            
            identified += secondTypeControllers
            
            if secondTypeControllers.count == 0 {
                stop = true
            } else {
                count = secondTypeControllers.count
            }
        }
        
        
        var moduleComponents = identified
        
        let modulesSet = Array(Set<Component>(moduleComponents))
        
        let module = Module(name: Constants.coordinator, components: modulesSet)
        
        return module
    }
    
    
    
    private func detectViews(components: [Component]) -> Module {
        let views = typeInferer.detect(components: components) { (component, others) -> Bool in
            return component.isComponentView(otherComponents: others)
        }
        
        let nativeType = NativeTypes.componentsFromNativeTypes(types: NativeTypes.views)
        
        let module = Module(name: Constants.view, components: views + nativeType)
        
        return module
    }
}
