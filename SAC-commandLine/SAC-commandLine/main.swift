//
//  main.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 11/08/2018.
//  Copyright © 2018 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation
//import SourceKittenFramework

struct Constants {
    static let reportsPath = "/Users/dragos/Documents/Doctorat/Doctorat-GIT/Code/SAC-commandLine/SAC-commandLine/Resources/"
    static let addLee = reportsPath + "addLeeReport.txt"
    static let fazan = reportsPath + "fazanMVC.txt"
    static let firefox = reportsPath + "firefox.txt"
    static let justSnap = reportsPath + "justSnap.txt"
    static let wikipedia = reportsPath + "wikipedia.txt"
    static let trust = reportsPath + "trust.txt"
    
    static let apple = reportsPath + "apple-object-scanning.txt"
    static let pp = reportsPath + "pp.txt"
    static let wholechild = reportsPath + "wholechild.txt"
    static let demo = reportsPath + "demo.txt"
    
    static let filePath = "/Users/dragos/Documents/Doctorat/Doctorat-GIT/Code/fazan/Fazan-MVC/Fazan/Fazan/UserManagement.swift"
    static let directoryPath = "/Users/dragos/Documents/Doctorat/Doctorat-GIT/Code/fazan/Fazan-MVC/Fazan/Fazan"
}

//let carl = CARL()

//carl.compareCARLWithMacs()

//let old = Old()
//old.run()

let cm = CompletenessMetrics()
cm.computeLabels(codebase: Wikipedia.init())

//let acdccd = ACDCCDComputer()
//acdccd.computeForCodebase(codebase: Firefox.init(), path: Constants.firefox)

// Analysis

//let modulseBuilder = ModuleBuilder()
//let modules = modulseBuilder.computeModulesCodebase(layers: JustSnap.init().carlSimple, path: Constants.justSnap)
//
//let display = Display()
//let analyser = ArchitectureAnalyser()
//let dependencies = analyser.analyseModules(modules:  modules)
//display.displayDependencies(dependencies)


// Matrix
//let matrix = Matrix()
//
//matrix.buildHybridMatrixMacs(codebaseLayers: PropertyPartner.init().macsCoordinator, path: Constants.pp, codebase: "MATRIX222--pp--")
//matrix.displayHybridComponentsSplitMacs(codebaseLayers: PropertyPartner.init().macsCoordinator, clustering: [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
//    ,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
//    ,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], path: Constants.pp)


//var layer = PropertyPartner.init().macsCoordinator
//
//let model = "AppConstants,AppLaunchChecker,Array,AuthenticationParser,AuthenticationService,BioIDHelper,ClearableField,CodeInputFieldDelegate,Credentials,Decimal,DigitValidator,EmailValidator,HiddenTextFieldDelegate,HTTPCookie,HTTPCookieStorage,KeychainHelper,LandingPagePageIndicatorViewDelegate,LoginError,NSLayoutConstraint,OrientationHelper,PasswordTextFieldDelegate,PIN,PPError,RegistrationMapper,RegistrationService,Session,SessionManager,SessionService,SettingsHelper,SignUpSwitchDelegate,SplashFlowManager,String,UIAlertController,UIColor,UIDevice,UIFont,URLRequest,User,UserDefaultsHelper,UserMapper,UserRegistrationDetails,UserService,Validator,WebViewFlowChangePageProtocol,WKWebView".split(separator: ",").map({String($0)})
//
//let controllerNew = "AlertContainerViewController,AppDelegate,AppNavigationManager,BaseFlowDelegate,BaseFlowManager,BaseLoginViewController,BaseNavigationController,BaseViewController,BaseViewControllerFlowDelegate,FlowManagerProtocol,LandingFlowManager,LandingFlowManagerDelegate,LandingInfoViewController,LandingInfoViewControllerFlowDelegate,LandingViewController,LandingViewControllerFlowDelegate,LoggedOutDelegate,LoggedOutViewControler,LoginControllerResultDelegate,LoginCredentialsDelegate,LoginCredentialsViewController,LoginFlowDelegate,LoginFlowManager,LoginMFACodeEntryViewController,LoginPinEntryViewController,LoginPinSetupViewController,LoginWithBioViewController,MainFlowManager,MainFlowManagerProtocol,MainViewController,MenuFlowManager,MenuFlowManagerProtocol,MenuSplitViewController,MenuViewController,MenuViewControllerFlowDelegate,MFACodeEntryDelegate,MFAProblemsDelegate,MFAProblemsViewController,PinEntryDelegate,PinSetupDelegate,SaveWithBioDelegate,SaveWithBioViewController,SignUpControllerDelegate,SignUpFlowDelegate,SignUpFlowManager,SignUpViewController,StartingViewController,StoryboardHelper,WebViewFlowManager".split(separator: ",").map({String($0)})


//let model2 = Set(layer.model)
//let detected = Set(model + controllerNew)
//
//let diff = Array(model2.symmetricDifference(detected))
//
////var newLayers = Layers(model: diff + model, view: layer.view, controller: layer.controller + controllerNew)
//
//
//
//var newLayers = Layers(model: model, view: layer.view, controller: controllerNew)
//
//
//let analyser = Analyser()
//
//let newSet = AnalyserSet(model: newLayers.model, view: newLayers.view, controller: newLayers.controller)
//
//let codebase = PropertyPartner.init().benchmark
//let groundTruth = AnalyserSet(model: codebase.model, view: codebase.view, controller: codebase.controller)
//
//analyser.runAnalysis(manual: groundTruth, output: newSet)



func approach1() {
    let matrix = Matrix()
    matrix.buildHybridMatrix(codebaseLayers: PropertyPartner.init().macsCoordinator, path: Constants.fazan, codebase: "Fazan-approach1")
    
    matrix.displayHybridComponentsSplit(codebaseLayers: Fazan.init().macsCoordinator, clustering: [0,0,0,0,1,0,1,0,1,0,1,0,0,0,0,0,0], path: Constants.fazan)
    
    
    var layer = Fazan.init().macsCoordinator
    
    let model = "GameEndedMessage,GameMessage,Highscore,ReachabilityConstants".split(separator: ",").map({String($0)})
    
    let controllerNew = "AppDelegate,FirebaseService,FontAwesome,Game,GameEndedMessageMapper,GameMessageMapper,MapperBase,ReachabilityService,User,UserDefaultsManager,UserManagement,UserMapper,WordValidator".split(separator: ",").map({String($0)})
    
    
    let model2 = Set(layer.model)
    let detected = Set(model + controllerNew)
    
    let diff = Array(model2.symmetricDifference(detected))
    
    var newLayers = Layers(model: diff + model, view: layer.view, controller: layer.controller + controllerNew)
    
    
    
//    var newLayers = Layers(model: model, view: layer.view, controller: controllerNew)
    
    
    let analyser = Analyser()
    
    let newSet = AnalyserSet(model: newLayers.model, view: newLayers.view, controller: newLayers.controller)
    
    let codebase = Fazan.init().benchmark
    let groundTruth = AnalyserSet(model: codebase.model, view: codebase.view, controller: codebase.controller)
    
    analyser.runAnalysis(manual: groundTruth, output: newSet)
}


func approach2() {
//        let matrix = Matrix()
//        matrix.buildHybridMatrixMacs(codebaseLayers: Fazan.init().macsCoordinator, path: Constants.fazan, codebase: "Fazan-approach2")
    
//    matrix.displayHybridComponentsSplitMacs(codebaseLayers: Fazan.init().macsCoordinator, clustering: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1], path: Constants.fazan)
    
    
    var layer = Fazan.init().macsCoordinator

    let model = "AppDelegate,Date,FirebaseService,FirebaseServiceHighscoreProtocol,FirebaseServiceProtocol,FontAwesome,Game,GameEndedMessage,GameEndedMessageMapper,GameMessage,GameMessageMapper,GameProtocol,Highscore,MapperBase,ReachabilityConstants,ReachabilityService,String,UIColor,UsedWordTableViewProtocol,User,UserDefaultsManager,UserManagement,UserMapper,WordValidator".split(separator: ",").map({String($0)})

    let controllerNew = "DebugViewController,GameLoserViewController,GameViewController,GameWinnerViewController,HighscoresViewController,StartViewController,ThreePhaseVC,TwoPhaseVC,UsedWordsViewController,UsersViewController,WordDefinitionViewController".split(separator: ",").map({String($0)})


    let model2 = Set(layer.model)
    let detected = Set(model + controllerNew)

    let diff = Array(model2.symmetricDifference(detected))

    var newLayers = Layers(model: model, view: layer.view, controller: controllerNew)



    //    var newLayers = Layers(model: model, view: layer.view, controller: controllerNew)


    let analyser = Analyser()

    let newSet = AnalyserSet(model: newLayers.model, view: newLayers.view, controller: newLayers.controller)

    let codebase = Fazan.init().benchmark
    let groundTruth = AnalyserSet(model: codebase.model, view: codebase.view, controller: codebase.controller)

    analyser.runAnalysis(manual: groundTruth, output: newSet)
}


//approach1()
//approach2()

















