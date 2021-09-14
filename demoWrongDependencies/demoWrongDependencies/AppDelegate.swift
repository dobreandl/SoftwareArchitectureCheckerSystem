//
//  AppDelegate.swift
//  demoWrongDependencies
//
//  Created by Dragos Dobrean on 14/03/2020.
//  Copyright © 2020 Dragos Dobrean. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var rootVC: ViewController!
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let mainVC = storyboard.instantiateInitialViewController() as? ViewController {
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = mainVC
            
            rootVC = mainVC
            window?.makeKeyAndVisible()
        }
    }
}



