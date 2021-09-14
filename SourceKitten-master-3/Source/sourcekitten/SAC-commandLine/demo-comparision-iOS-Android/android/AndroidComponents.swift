//
//  AndroidComponents.swift
//  sourcekitten
//
//  Created by Dragos Dobrean on 01/02/2021.
//  Copyright © 2021 SourceKitten. All rights reserved.
//

import Foundation

class AndroidComponents {
    
    static func getComponents() -> [Component] {
        return buildViewComponents() + buildModelComponents() + buildControllerComponents()
    }

    static func buildControllerComponents() -> [Component] {
        let m1 = Method(name: "onCreate(savedInstanceState: Bundle?)", type: "MainActivity:onCreate(savedInstanceState: Bundle?)", kind: .kInstanceMethod, parameterTypes: ["Bundle"])
        
        let m2 = Method(name: "setFragment(fragment: Fragment, tag: String)", type: "MainActivity:setFragment(fragment: Fragment, tag: String)", kind: .kInstanceMethod, parameterTypes: ["Fragment", "Tag"])
        
        let m3 = Method(name: "displayFragment(fragment: Fragment, tag: String)", type: "MainActivity:displayFragment(fragment: Fragment, tag: String)", kind: .kInstanceMethod, parameterTypes: ["Fragment", "Tag"])
        
        let m4 = Method(name: "handleDisplayDetails(handle: String)", type: "MainActivity:handleDisplayDetails(handle: String)", kind: .kInstanceMethod, parameterTypes: ["String"])
        
        
        let mainActivity = Component(name: "MainActivity", kind: .kClass, path: "/Users/dragos/Documents/Code/appssemble/android-demo/app/src/main/java/controller/MainActivity.kt", inheritedTypes: ["AppCompatActivity", "HandleInputListener"], type: "MainActivity", methods: [m1, m2, m3, m4], variables: [])
        

        let m5 = Method(name: "onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View?", type: "HandleInputFragment:onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View?", kind: .kInstanceMethod, parameterTypes: ["LayoutInflater", "ViewGroup", "Bundle", "View"])
        
        let m6 = Method(name: "onAttach(context: Context)", type: "HandleInputFragment:onAttach(context: Context)", kind: .kInstanceMethod, parameterTypes: ["Context"])
        
        let m7 = Method(name: "onDetach()", type: "HandleInputFragment:onDetach()", kind: .kInstanceMethod, parameterTypes: [])
        
        let m8 = Method(name: "handleButtonPressed(text: String?)", type: "HandleInputFragment:handleButtonPressed(text: String?)", kind: .kInstanceMethod, parameterTypes: ["String"])
        
        let v1 = Variable(name: "listener", type: "HandleInputListener", kind: .kInstanceVariable)
        
        let inputHandler = Component(name: "HandleInputFragment", kind: .kClass, path: "/Users/dragos/Documents/Code/appssemble/android-demo/app/src/main/java/controller/fragments/HandleInputFragment.kt", inheritedTypes: ["Fragment"], type: "HandleInputFragment", methods: [m5, m6, m7, m8], variables: [v1])
        
        
        let handleInputListener = Component(name: "HandleInputListener", kind: .kProtocol, path: "/Users/dragos/Documents/Code/appssemble/android-demo/app/src/main/java/controller/fragments/interfaces/HandleInputListener.kt", inheritedTypes: [], type: "HandleInputListener", methods: [Method(name: "handleDisplayDetails(handle: String)", type: "HandleInputListener:handleDisplayDetails(handle: String)", kind: .kClassMethod, parameterTypes: [])], variables: [])
        
        
        let m9 = Method(name: "onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View?", type: "TwitterDetailsFragment:onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View?", kind: .kInstanceMethod, parameterTypes: ["LayoutInflater", "ViewGroup", "Bundle", "View"])
        
        let v2 = Variable(name: "handle", type: "String", kind: .kInstanceVariable)
        
        let v3 = Variable(name: "service", type: "TwitterService", kind: .kInstanceVariable)
        
        let twitterDetails = Component(name: "TwitterDetailsFragment", kind: .kClass, path: "/Users/dragos/Documents/Code/appssemble/android-demo/app/src/main/java/controller/fragments/TwitterDetailsFragment.kt", inheritedTypes: ["Fragment"], type: "TwitterDetailsFragment", methods: [m9], variables: [v2, v3])
        
        return [mainActivity, inputHandler, handleInputListener, twitterDetails]
    }
    
    
    static func buildViewComponents() -> [Component] {
        let m1 = Method(name: "setProfile(profile: TwitterProfile)", type: "TwitterDetailsView:setProfile(profile: TwitterProfile)", kind: .kInstanceMethod, parameterTypes: ["TwitterProfile"])
        
        let m2 = Method(name: "constructor(context: Context)", type: "TwitterDetailsView:constructor(context: Context)", kind: .kInstanceMethod, parameterTypes: ["Context"])
        
        let TwitterDetailsView = Component(name: "TwitterDetailsView", kind: .kClass, path: "/Users/dragos/Documents/Code/appssemble/android-demo/app/src/main/java/view/TwitterDetailsView.kt", inheritedTypes: ["LinearLayout"], type: "TwitterDetailsView", methods: [m1, m2], variables: [])
        
        
        let m3 = Method(name: "constructor(context: Context)", type: "TwitterErrorView:constructor(context: Context)", kind: .kInstanceMethod, parameterTypes: ["Context"])
        
        let TwitterErrorView = Component(name: "TwitterErrorView", kind: .kClass, path: "/Users/dragos/Documents/Code/appssemble/android-demo/app/src/main/java/view/TwitterErrorView.kt", inheritedTypes: ["LinearLayout"], type: "TwitterErrorView", methods: [m3], variables: [])
        
        
        return [TwitterDetailsView, TwitterErrorView]
    }
    
    
    static func buildModelComponents() -> [Component] {
        let v1 = Variable(name: "name", type: "String", kind: .kInstanceVariable)
        let v2 = Variable(name: "lastTweet", type: "String", kind: .kInstanceVariable)
        
        let TwitterProfile = Component(name: "TwitterProfile", kind: .kClass, path: "/Users/dragos/Documents/Code/appssemble/android-demo/app/src/main/java/model/TwitterProfile.kt", inheritedTypes: [], type: "TwitterProfile", methods: [], variables: [v1, v2])
        
        
        let m1 = Method(name: "onSuccess(profile: TwitterProfile)", type: "TwitterResultHandler:onSuccess(profile: TwitterProfile)", kind: .kInstanceMethod, parameterTypes: ["TwitterProfile"])
        
        let m2 = Method(name: "onFailure()", type: "TwitterResultHandler:onFailure()", kind: .kInstanceMethod, parameterTypes: [])
        
        let TwitterResultHandler = Component(name: "TwitterResultHandler", kind: .kProtocol, path: "/Users/dragos/Documents/Code/appssemble/android-demo/app/src/main/java/model/TwitterResultHandler.kt", inheritedTypes: [], type: "TwitterResultHandler", methods: [m1, m2], variables: [])
        
        
        let m3 = Method(name: "getProfile(context: Context, handle: String, responseHandler: TwitterResultHandler)", type: "TwitterService:getProfile(context: Context, handle: String, responseHandler: TwitterResultHandler)", kind: .kInstanceMethod, parameterTypes: ["Context", "String", "TwitterResultHandler"])
        
        let TwitterService = Component(name: "TwitterService", kind: .kClass, path: "/Users/dragos/Documents/Code/appssemble/android-demo/app/src/main/java/model/TwitterService.kt", inheritedTypes: [], type: "TwitterService", methods: [m3], variables: [])
        
        
        return [TwitterProfile, TwitterResultHandler, TwitterService]
    }
    
}
