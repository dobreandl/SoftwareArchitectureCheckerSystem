//
//  View.swift
//  demoWrongDependencies
//
//  Created by Dragos Dobrean on 14/03/2020.
//  Copyright © 2020 Dragos Dobrean. All rights reserved.
//

import UIKit

class WrongView: UIView {
    
    private var priceLabel: UILabel!
    
    // MARK: Overwritten
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        priceLabel = UILabel(frame: bounds)
        addSubview(priceLabel)
        
        priceLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Public methods
    
    // WRONG DEPENDENCY, THE VIEW SHOULD NOT HAVE ANY KNOWLEDGE REGARDING THE MODEL
    func configure(model: Model) {
        priceLabel.text = "\(model.price)"
    }
}
