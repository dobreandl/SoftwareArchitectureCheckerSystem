//
//  Compatibility.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 18/08/2018.
//  Copyright © 2018 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation

enum CompatibilityDegree: Double {
    case certain = 1.0
    case high = 0.75
    case medium = 0.5
    case low = 0.25
    case none = 0
}

let CompatibilityStep: Double = 0.25

protocol Compatibility {
    func compatibilityDegree(component: Component, otherComponents: [Component]) -> CompatibilityDegree
}
