//
//  Fazan.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 18/02/2020.
//  Copyright © 2020 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation

fileprivate struct Codebases {
    static let baseModel = "FirebaseService,FirebaseServiceHighscoreProtocol,FirebaseServiceProtocol,FontAwesome,Game,GameEndedMessage,GameEndedMessageMapper,GameMessage,GameMessageMapper,GameProtocol,Highscore,MapperBase,ReachabilityConstants,ReachabilityService,UsedWordTableViewProtocol,User,UserDefaultsManager,UserManagement,UserMapper,WordValidator".split(separator: ",").map({String($0)})
    
    static let baseView = "HighscoreCell,PlayersCell,PlayersView,UsedWordTableViewCell".split(separator: ",").map({String($0)})
    
    static let baseController = "AppDelegate,DebugViewController,GameLoserViewController,GameViewController,GameWinnerViewController,HighscoresViewController,StartViewController,ThreePhaseVC,TwoPhaseVC,UsedWordsViewController,UsersViewController,WordDefinitionViewController".split(separator: ",").map({String($0)})
    
    
    
    static let macsSimpleModel = "AppDelegate,Date,FirebaseService,FirebaseServiceHighscoreProtocol,FirebaseServiceProtocol,FontAwesome,Game,GameEndedMessage,GameEndedMessageMapper,GameMessage,GameMessageMapper,GameProtocol,Highscore,MapperBase,ReachabilityConstants,ReachabilityService,String,UIColor,UsedWordTableViewProtocol,User,UserDefaultsManager,UserManagement,UserMapper,WordValidator".split(separator: ",").map({String($0)})
    
    
    
    static let macsSimpleView = "HighscoreCell,PlayersCell,PlayersView,UsedWordTableViewCell".split(separator: ",").map({String($0)})
    
    
    
    static let macsSimpleController = "DebugViewController,GameLoserViewController,GameViewController,GameWinnerViewController,HighscoresViewController,StartViewController,ThreePhaseVC,TwoPhaseVC,UsedWordsViewController,UsersViewController,WordDefinitionViewController".split(separator: ",").map({String($0)})
    
    
    
    
    static let macsCoordinatorModel = "AppDelegate,Date,FirebaseService,FirebaseServiceHighscoreProtocol,FirebaseServiceProtocol,FontAwesome,Game,GameEndedMessage,GameEndedMessageMapper,GameMessage,GameMessageMapper,GameProtocol,Highscore,MapperBase,ReachabilityConstants,ReachabilityService,String,UIColor,UsedWordTableViewProtocol,User,UserDefaultsManager,UserManagement,UserMapper,WordValidator".split(separator: ",").map({String($0)})
    
    
    static let macsCoordinatorView = "HighscoreCell,PlayersCell,PlayersView,UsedWordTableViewCell".split(separator: ",").map({String($0)})
    
    
    static let macsCoordinatorController = "DebugViewController,GameLoserViewController,GameViewController,GameWinnerViewController,HighscoresViewController,StartViewController,ThreePhaseVC,TwoPhaseVC,UsedWordsViewController,UsersViewController,WordDefinitionViewController".split(separator: ",").map({String($0)})
    
    
    
    static let carlSimpleModel = "AppDelegate,Date,FirebaseServiceProtocol,FirebaseServiceHighscoreProtocol,FirebaseService,FontAwesome,GameProtocol,Game,GameEndedMessage,GameEndedMessageMapper,GameMessage,GameMessageMapper,Highscore,MapperBase,ReachabilityConstants,ReachabilityService,String,TwoPhaseVC,ThreePhaseVC,UIButton,UIColor,UITableView,UIView,UsedWordTableViewProtocol,User,UserDefaultsManager,UserManagement,UserMapper,WordValidator".split(separator: ",").map({String($0)})
    
    
    
    static let carlSimpleView = "HighscoreCell,PlayersCell,PlayersView,UsedWordTableViewCell".split(separator: ",").map({String($0)})
    
    
    
    static let carlSimpleController = "DebugViewController,GameLoserViewController,GameViewController,GameWinnerViewController,HighscoresViewController,StartViewController,UIViewController,UsedWordsViewController,UsersViewController,WordDefinitionViewController".split(separator: ",").map({String($0)})
    
    
    static let hybridController = "DebugViewController,GameLoserViewController,GameViewController,GameWinnerViewController,HighscoresViewController,StartViewController,ThreePhaseVC,TwoPhaseVC,UsedWordsViewController,UsersViewController,WordDefinitionViewController".split(separator: ",").map({String($0)})
    
    
    static let hybridModel = "AppDelegate,Date,FirebaseService,FirebaseServiceHighscoreProtocol,FirebaseServiceProtocol,FontAwesome,Game,GameEndedMessage,GameEndedMessageMapper,GameMessage,GameMessageMapper,GameProtocol,Highscore,MapperBase,ReachabilityConstants,ReachabilityService,String,UIColor,UsedWordTableViewProtocol,User,UserDefaultsManager,UserManagement,UserMapper,WordValidator".split(separator: ",").map({String($0)})
    
}


class Fazan: MVCCodebase {
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
