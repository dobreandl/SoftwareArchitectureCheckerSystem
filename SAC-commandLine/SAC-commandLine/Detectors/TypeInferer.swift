//
//  TypeDetector.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 18/08/2018.
//  Copyright © 2018 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation

enum ClassType: String {
    case controller
    case viewController
    case view
    case entity
    case service
    case viewModel
    case presenter
    case router
    case interactor
    case unknown
}

typealias ComponentValidationClosure = (_ component: Component, _ otherComponents: [Component]) -> Bool

class TypeInferer {
    
    private let entityComptibility = EntityCompatibility()
    private let viewModelCompatibility = ViewModelCompatibility()
    
    func detectType(components: [Component]) -> [ClassType:[Component]] {
        var returnValues = [ClassType:[Component]]()
        
        // Detect certain types
        let certainTypes = detectCertainTypes(components: components)
        returnValues = returnValues.merging(certainTypes) { $1 }
        
        // Remove certain components from all items
        let certainTypesComponents = certainTypes.values.flatMap({$0})
        let uncertainComponents = components.filter({!certainTypesComponents.contains($0)})
        
        // Detect uncertain types
        let uncertainTypes = detectUncertainTypes(components: uncertainComponents)
        returnValues = returnValues.merging(uncertainTypes) { $1 }
        
        // Unkown types
        let uncertainTypeComponents = uncertainTypes.values.flatMap({$0})
        let unknownComponents = uncertainComponents.filter({!uncertainTypeComponents.contains($0)})
    
        returnValues[.unknown] = unknownComponents
        
        return returnValues
    }
    
    func detect(components: [Component], componentValidationClosure: ComponentValidationClosure) -> [Component] {
        var detectedComponents = [Component]()
        
        for component in components {
            if componentValidationClosure(component, components) {
                
                detectedComponents.append(component)
            }
        }
        
        return detectedComponents
    }
    
    // MARK: Private methods
    
    // MARK: Certain types
    
    private func detectCertainTypes(components: [Component]) -> [ClassType:[Component]] {
        var returnValues = [ClassType:[Component]]()
        
        let viewControllers = detect(components: components) { (component, others) -> Bool in
            return component.isComponentViewController(otherComponents: others)
        }
        
        let views = detect(components: components) { (component, others) -> Bool in
            return component.isComponentView(otherComponents: components)
        }
        
        let controllers = detect(components: components) { (component, others) -> Bool in
            return component.isComponentController(otherComponents: components)
        }
        
        returnValues[.viewController] = viewControllers
        returnValues[.view] = views
        returnValues[.controller] = controllers
        
        return returnValues
    }

    // MARK: Uncertain types
    
    private func detectUncertainTypes(components:[Component]) -> [ClassType:[Component]] {
        var returnValues = [ClassType:[Component]]()
        
        let entities = detectEntities(components: components)
        returnValues[.entity] = entities
        
        let viewModels = detectViewModels(components: components)
        returnValues[.viewModel] = viewModels
        
        return returnValues
    }
    
    private func detectEntities(components: [Component]) -> [Component] {
        var returnValues = [Component]()
        
        for component in components {
            if entityComptibility.compatibilityDegree(component: component, otherComponents: components).rawValue >= CompatibilityDegree.medium.rawValue {
                
                returnValues.append(component)
            }
        }
        
        return returnValues
    }
    
    private func detectViewModels(components: [Component]) -> [Component] {
        var returnValues = [Component]()
        
        for component in components {
            if viewModelCompatibility.compatibilityDegree(component: component, otherComponents: components).rawValue >= CompatibilityDegree.medium.rawValue {
                
                returnValues.append(component)
            }
        }
        
        return returnValues
    }

}
