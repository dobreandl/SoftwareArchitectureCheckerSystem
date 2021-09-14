//
//  NativeTypes.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 18/08/2018.
//  Copyright © 2018 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation


struct NativeTypes {
    // View controllers
    static let viewControllers = ["UIViewController",
                                  "UITableViewController",
                                  "UICollectionViewController",
                                  "UISplitViewController",
                                  "UIPageViewController",
                                  "UISearchContainerViewController",
                                  "UIDocumentBrowserViewController",
                                  "UIDocumentPickerViewController",
                                  "UIReferenceLibraryViewController",
                                  "UIActivityViewController",
                                  "UICollectionViewController",
                                  "UITableViewController"]
    
    // Controllers
    static let controllers = ["UIContentContainer",
                              "UINavigationController",
                              "UITabBarController",
                              "UISearchController",
                              "UIImagePickerController",
                              "UIVideoEditorController",
                              "UIDocumentInteractionController",
                              "UICloudSharingController",
                              "UIPrinterPickerController",
                              "UIPresentationController",
                              "UIRefreshControl"]
    
    // Views
    static let views = ["UIView",
                        "UIStackView",
                        "UIScrollView",
                        "UIActivityIndicatorView",
                        "UIImageView",
                        "UIPickerView",
                        "UIProgressView",
                        "UIWebView",
                        "UIControl",
                        "UIButton",
                        "UIDatePicker",
                        "UIPageControl",
                        "UISegmentedControl",
                        "UISlider",
                        "UIStepper",
                        "UISwitch",
                        "UILabel",
                        "UITextField",
                        "UITextView",
                        "UIVisualEffect",
                        "UIVisualEffectView",
                        "UIVibrancyEffect",
                        "UIBlurEffect",
                        "UIBarItem",
                        "UIBarButtonItem",
                        "UIBarButtonItemGroup",
                        "UINavigationBar",
                        "UISearchBar",
                        "UIToolbar",
                        "UITabBar",
                        "UITabBarItem",
                        "UIBarPositioning",
                        "UIAppearance",
                        "UIWindow",
                        "UITableView",
                        "UITableViewCell",
                        "UITableViewHeaderFooterView",
                        "UICollectionView",
                        "UICollectionReusableView",
                        "UICollectionViewCell"]
    
    
    static func componentsFromNativeTypes(types: [String]) -> [Component] {
        var components = [Component]()
        
        for type in types {
            let component = Component(name: type, kind: .kClass, path: ".", inheritedTypes: [String](), type: type, methods: [Method](), variables: [Variable]())
            
            components.append(component)
        }
        
        return components
    }
}

