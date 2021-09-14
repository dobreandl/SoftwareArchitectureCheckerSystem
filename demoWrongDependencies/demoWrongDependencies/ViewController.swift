//
//  ViewController.swift
//  demoWrongDependencies
//
//  Created by Dragos Dobrean on 14/03/2020.
//  Copyright © 2020 Dragos Dobrean. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var models = [Model(name: "it-29", price: 12.3), Model(name: "or-22", price: 22.2)]
    private let stackView = UIStackView(frame: CGRect.zero)
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        setupStackView()
        showModelsWrong()
        showModelsCorrect()
    }
    
    // MARK: Private methods
    
    private func setupStackView() {
        stackView.frame = view.bounds
        view.addSubview(stackView)
        stackView.autoresizingMask = [.flexibleHeight, .flexibleHeight]
        stackView.distribution = .fillEqually
    }
    
    private func showModelsWrong() {
        for model in models {
            let view = WrongView(frame: stackView.frame)
            view.configure(model: model)
            
            stackView.addArrangedSubview(view)
        }
    }
    
    private func showModelsCorrect() {
        for model in models {
            let view = CorrectView(frame: stackView.frame)
            view.update(price: "\(model.price)")
            
            stackView.addArrangedSubview(view)
        }
    }
}

