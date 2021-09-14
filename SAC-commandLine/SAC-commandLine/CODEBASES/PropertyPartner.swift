//
//  PropertyPartner.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 18/02/2020.
//  Copyright © 2020 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation


fileprivate struct Codebases {
    static let baseModel = "AppConstants,AppDelegate,AppLaunchChecker,Array,AuthenticationParser,AuthenticationService,BaseFlowDelegate,BaseFlowManager,BaseViewControllerFlowDelegate,BioIDHelper,Credentials,Decimal,DigitValidator,EmailValidator,FlowManagerProtocol,HTTPCookie,HTTPCookieStorage,KeychainHelper,LandingFlowManagerDelegate,LoginError,LoginFlowDelegate,MainFlowManagerProtocol,MenuFlowManagerProtocol,NSLayoutConstraint,OrientationHelper,PIN,PPError,RegistrationMapper,RegistrationService,Session,SessionManager,SessionService,SettingsHelper,SignUpFlowDelegate,StoryboardHelper,String,UIColor,UIDevice,UIFont,URLRequest,User,UserDefaultsHelper,UserMapper,UserRegistrationDetails,UserService,Validator,WebViewFlowChangePageProtocol".split(separator: ",").map({String($0)})
    
    static let baseView = "ActivityIndicator,Checkbox,ClearableField,CodeInputField,CodeInputFieldDelegate,HiddenTextField,HiddenTextFieldDelegate,LandingPagePageIndicatorView,LandingPagePageIndicatorViewDelegate,LandingPageScrollItemView,LoadingScreenView,NavbarView,PasswordTextFieldDelegate,PPPasswordTextField,PPSecureTextField,PPTextField,SignUpSwitch,SignUpSwitchDelegate,Spinner,UITextField,UIView,WKWebView".split(separator: ",").map({String($0)})
    
    static let baseController = "AlertContainerViewController,AppNavigationManager,BaseLoginViewController,BaseNavigationController,BaseViewController,LandingFlowManager,LandingInfoViewController,LandingInfoViewControllerFlowDelegate,LandingViewController,LandingViewControllerFlowDelegate,LoggedOutDelegate,LoggedOutViewControler,LoginControllerResultDelegate,LoginCredentialsDelegate,LoginCredentialsViewController,LoginFlowManager,LoginMFACodeEntryViewController,LoginPinEntryViewController,LoginPinSetupViewController,LoginWithBioViewController,MainFlowManager,MainViewController,MenuFlowManager,MenuSplitViewController,MenuViewController,MenuViewControllerFlowDelegate,MFACodeEntryDelegate,MFAProblemsDelegate,MFAProblemsViewController,PinEntryDelegate,PinSetupDelegate,SaveWithBioDelegate,SaveWithBioViewController,SignUpControllerDelegate,SignUpFlowManager,SignUpViewController,SplashFlowManager,StartingViewController,UIAlertController,UIViewController,WebViewFlowManager".split(separator: ",").map({String($0)})
    
    
    
    static let macsSimpleModel = "AppConstants,AppDelegate,AppLaunchChecker,AppNavigationManager,Array,AuthenticationParser,AuthenticationService,BaseFlowDelegate,BaseFlowManager,BaseViewControllerFlowDelegate,BioIDHelper,ClearableField,CodeInputFieldDelegate,Credentials,Decimal,DigitValidator,EmailValidator,FlowManagerProtocol,HiddenTextFieldDelegate,HTTPCookie,HTTPCookieStorage,KeychainHelper,LandingFlowManager,LandingFlowManagerDelegate,LandingInfoViewControllerFlowDelegate,LandingPagePageIndicatorViewDelegate,LandingViewControllerFlowDelegate,LoggedOutDelegate,LoginControllerResultDelegate,LoginCredentialsDelegate,LoginError,LoginFlowDelegate,LoginFlowManager,MainFlowManager,MainFlowManagerProtocol,MenuFlowManager,MenuFlowManagerProtocol,MenuViewControllerFlowDelegate,MFACodeEntryDelegate,MFAProblemsDelegate,NSLayoutConstraint,OrientationHelper,PasswordTextFieldDelegate,PIN,PinEntryDelegate,PinSetupDelegate,PPError,RegistrationMapper,RegistrationService,SaveWithBioDelegate,Session,SessionManager,SessionService,SettingsHelper,SignUpControllerDelegate,SignUpFlowDelegate,SignUpFlowManager,SignUpSwitchDelegate,SplashFlowManager,StoryboardHelper,String,UIAlertController,UIColor,UIDevice,UIFont,URLRequest,User,UserDefaultsHelper,UserMapper,UserRegistrationDetails,UserService,Validator,WebViewFlowChangePageProtocol,WebViewFlowManager,WKWebView".split(separator: ",").map({String($0)})
    
    
    
    static let macsSimpleView = "ActivityIndicator,Checkbox,CodeInputField,HiddenTextField,LandingPagePageIndicatorView,LandingPageScrollItemView,LoadingScreenView,NavbarView,PPPasswordTextField,PPSecureTextField,PPTextField,SignUpSwitch,Spinner".split(separator: ",").map({String($0)})
    
    
    
    static let macsSimpleController = "AlertContainerViewController,BaseLoginViewController,BaseNavigationController,BaseViewController,LandingInfoViewController,LandingViewController,LoggedOutViewControler,LoginCredentialsViewController,LoginMFACodeEntryViewController,LoginPinEntryViewController,LoginPinSetupViewController,LoginWithBioViewController,MainViewController,MenuSplitViewController,MenuViewController,MFAProblemsViewController,SaveWithBioViewController,SignUpViewController,StartingViewController".split(separator: ",").map({String($0)})
    
    
    
    
    static let macsCoordinatorModel = "AppConstants,AppLaunchChecker,Array,AuthenticationParser,AuthenticationService,BioIDHelper,ClearableField,CodeInputFieldDelegate,Credentials,Decimal,DigitValidator,EmailValidator,HiddenTextFieldDelegate,HTTPCookie,HTTPCookieStorage,KeychainHelper,LandingPagePageIndicatorViewDelegate,LoginError,NSLayoutConstraint,OrientationHelper,PasswordTextFieldDelegate,PIN,PPError,RegistrationMapper,RegistrationService,Session,SessionManager,SessionService,SettingsHelper,SignUpSwitchDelegate,SplashFlowManager,String,UIAlertController,UIColor,UIDevice,UIFont,URLRequest,User,UserDefaultsHelper,UserMapper,UserRegistrationDetails,UserService,Validator,WebViewFlowChangePageProtocol,WKWebView".split(separator: ",").map({String($0)})
    
    
    static let macsCoordinatorView = "ActivityIndicator,Checkbox,CodeInputField,HiddenTextField,LandingPagePageIndicatorView,LandingPageScrollItemView,LoadingScreenView,NavbarView,PPPasswordTextField,PPSecureTextField,PPTextField,SignUpSwitch,Spinner".split(separator: ",").map({String($0)})
    
    
    static let macsCoordinatorController = "AlertContainerViewController,AppDelegate,AppNavigationManager,BaseFlowDelegate,BaseFlowManager,BaseLoginViewController,BaseNavigationController,BaseViewController,BaseViewControllerFlowDelegate,FlowManagerProtocol,LandingFlowManager,LandingFlowManagerDelegate,LandingInfoViewController,LandingInfoViewControllerFlowDelegate,LandingViewController,LandingViewControllerFlowDelegate,LoggedOutDelegate,LoggedOutViewControler,LoginControllerResultDelegate,LoginCredentialsDelegate,LoginCredentialsViewController,LoginFlowDelegate,LoginFlowManager,LoginMFACodeEntryViewController,LoginPinEntryViewController,LoginPinSetupViewController,LoginWithBioViewController,MainFlowManager,MainFlowManagerProtocol,MainViewController,MenuFlowManager,MenuFlowManagerProtocol,MenuSplitViewController,MenuViewController,MenuViewControllerFlowDelegate,MFACodeEntryDelegate,MFAProblemsDelegate,MFAProblemsViewController,PinEntryDelegate,PinSetupDelegate,SaveWithBioDelegate,SaveWithBioViewController,SignUpControllerDelegate,SignUpFlowDelegate,SignUpFlowManager,SignUpViewController,StartingViewController,StoryboardHelper,WebViewFlowManager".split(separator: ",").map({String($0)})
    
    
    
    static let carlSimpleModel = "AppConstants,AppDelegate,LoginError,PPError,AppNavigationManager,LoginFlowDelegate,LoginFlowManager,SignUpFlowDelegate,SignUpFlowManager,FlowManagerProtocol,BaseFlowDelegate,BaseFlowManager,LandingFlowManagerDelegate,LandingFlowManager,MainFlowManagerProtocol,MainFlowManager,WebViewFlowChangePageProtocol,WebViewFlowManager,MenuFlowManagerProtocol,MenuFlowManager,SplashFlowManager,AppLaunchChecker,BioIDHelper,Decimal,HTTPCookie,HTTPCookieStorage,KeychainHelper,NSLayoutConstraint,OrientationHelper,SessionManager,SettingsHelper,StoryboardHelper,String,UIColor,UIDevice,UIFont,UIView,URLRequest,UserDefaultsHelper,DigitValidator,EmailValidator,Validator,Array,WKWebView,Credentials,PIN,Session,User,UserRegistrationDetails,AuthenticationParser,AuthenticationService,RegistrationMapper,UserMapper,RegistrationService,SessionService,UserService,LoggedOutDelegate,LoggedOutViewControler,LoginCredentialsDelegate,MFACodeEntryDelegate,PinEntryDelegate,PinSetupDelegate,MFAProblemsDelegate,SaveWithBioDelegate,ClearableField,UITextField,PPPasswordTextField,PasswordTextFieldDelegate,CodeInputFieldDelegate,CodeInputField,HiddenTextFieldDelegate,LandingPagePageIndicatorViewDelegate,SignUpSwitchDelegate".split(separator: ",").map({String($0)})
    
    
    
    static let carlSimpleView = "ActivityIndicator,Checkbox,LoadingScreenView,NavbarView,PPPasswordTextField,PPSecureTextField,PPTextField,Spinner,CodeInputField,HiddenTextField,LandingPagePageIndicatorView,LandingPageScrollItemView,SignUpSwitch".split(separator: ",").map({String($0)})
    
    
    
    static let carlSimpleController = "BaseViewControllerFlowDelegate,AlertContainerViewController,UIAlertController,UIViewController,BaseNavigationController,BaseViewController,MenuSplitViewController,LoginControllerResultDelegate,BaseLoginViewController,LandingInfoViewControllerFlowDelegate,LandingInfoViewController,LandingViewControllerFlowDelegate,LandingViewController,LoginCredentialsViewController,LoginMFACodeEntryViewController,LoginPinEntryViewController,LoginPinSetupViewController,LoginWithBioViewController,MFAProblemsViewController,SaveWithBioViewController,SignUpControllerDelegate,SignUpViewController,StartingViewController,MainViewController,MenuViewControllerFlowDelegate,MenuViewController".split(separator: ",").map({String($0)})
    
    
    
    static let hybridController = "AlertContainerViewController,AppDelegate,AppNavigationManager,BaseFlowDelegate,BaseFlowManager,BaseLoginViewController,BaseNavigationController,BaseViewController,BaseViewControllerFlowDelegate,FlowManagerProtocol,LandingFlowManager,LandingFlowManagerDelegate,LandingInfoViewController,LandingInfoViewControllerFlowDelegate,LandingViewController,LandingViewControllerFlowDelegate,LoggedOutDelegate,LoggedOutViewControler,LoginControllerResultDelegate,LoginCredentialsDelegate,LoginCredentialsViewController,LoginFlowDelegate,LoginFlowManager,LoginMFACodeEntryViewController,LoginPinEntryViewController,LoginPinSetupViewController,LoginWithBioViewController,MainFlowManager,MainFlowManagerProtocol,MainViewController,MenuFlowManager,MenuFlowManagerProtocol,MenuSplitViewController,MenuViewController,MenuViewControllerFlowDelegate,MFACodeEntryDelegate,MFAProblemsDelegate,MFAProblemsViewController,PinEntryDelegate,PinSetupDelegate,SaveWithBioDelegate,SaveWithBioViewController,SignUpControllerDelegate,SignUpFlowDelegate,SignUpFlowManager,SignUpViewController,StartingViewController,StoryboardHelper,WebViewFlowManager".split(separator: ",").map({String($0)})
    
    
    static let hybridModel = "AppConstants,AppLaunchChecker,Array,AuthenticationParser,AuthenticationService,BioIDHelper,ClearableField,CodeInputFieldDelegate,Credentials,Decimal,DigitValidator,EmailValidator,HiddenTextFieldDelegate,HTTPCookie,HTTPCookieStorage,KeychainHelper,LandingPagePageIndicatorViewDelegate,LoginError,NSLayoutConstraint,OrientationHelper,PasswordTextFieldDelegate,PIN,PPError,RegistrationMapper,RegistrationService,Session,SessionManager,SessionService,SettingsHelper,SignUpSwitchDelegate,SplashFlowManager,String,UIAlertController,UIColor,UIDevice,UIFont,URLRequest,User,UserDefaultsHelper,UserMapper,UserRegistrationDetails,UserService,Validator,WebViewFlowChangePageProtocol,WKWebView".split(separator: ",").map({String($0)})
    
}


class PropertyPartner: MVCCodebase {
    var benchmark: Layers
    var macsSimple: Layers
    var macsCoordinator: Layers
    var carlSimple: Layers
    var hybrid: Layers
    
    
    init() {
        benchmark = Layers(model: Codebases.baseModel, view: Codebases.baseView, controller: Codebases.baseController)
        macsSimple = Layers(model: Codebases.macsSimpleModel, view: Codebases.macsSimpleView, controller: Codebases.macsSimpleController)
        macsCoordinator = Layers(model: Codebases.macsCoordinatorModel, view: Codebases.macsCoordinatorView, controller: Codebases.macsCoordinatorController)
        carlSimple = Layers(model: Codebases.carlSimpleModel, view: Codebases.carlSimpleView, controller: Codebases.carlSimpleController)
        
        hybrid = Layers(model: Codebases.hybridModel, view: Codebases.macsCoordinatorView, controller: Codebases.hybridController)
    }
}
