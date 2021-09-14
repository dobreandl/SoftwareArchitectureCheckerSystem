//
//  CodebaseProtocol.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 15/02/2020.
//  Copyright © 2020 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation

struct Layers {
    let model: [String]
    let view: [String]
    let controller: [String]
}

protocol MVCCodebase {
    var benchmark: Layers {get}
    var macsSimple: Layers {get}
    var macsCoordinator: Layers {get}
    var carlSimple: Layers {get}
    var hybrid: Layers {get}
}
