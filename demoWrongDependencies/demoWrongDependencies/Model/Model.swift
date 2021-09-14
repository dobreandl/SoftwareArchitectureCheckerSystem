//
//  Model.swift
//  demoWrongDependencies
//
//  Created by Dragos Dobrean on 14/03/2020.
//  Copyright © 2020 Dragos Dobrean. All rights reserved.
//

import Foundation


class Model {
    
    let name: String
    let price: Float
    
    init(name: String, price: Float) {
        self.price = price
        self.name = name
    }
    
}
