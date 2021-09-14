//
//  CorrectView.swift
//  demoWrongDependencies
//
//  Created by Dragos Dobrean on 15/03/2020.
//  Copyright © 2020 Dragos Dobrean. All rights reserved.
//

import UIKit

class CorrectView: UIView {
    
    private var priceLabel: UILabel!
    
    // MARK: Overwritten
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.red
        
        priceLabel = UILabel(frame: bounds)
        addSubview(priceLabel)
        
        priceLabel.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Public methods

    func update(price: String) {
        priceLabel.text = price
    }
}
