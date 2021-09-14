//
//  old.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 15/02/2020.
//  Copyright © 2020 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation
//import SourceKittenFramework

class Old {
    
    func run() {
        
        let raportParser = RaportParser()
        let display = Display()
        
        let typeDetector = TypeInferer()
        let pathGrouper = PathGrouper()
        let mvc = MVCAnalyser()
        let analyser = ArchitectureAnalyser()
        
        let components4 = raportParser.parseRaport(path: Constants.apple)
        
        //for component in components {
        //    print("\(component.name)")
        //}
        
        print("__________________________***************_______________")
        
        let modules4 = mvc.splitMVCClasses(components: components4)
        //
        //for module in modules {
        //    print("__________\(module.name)___________")
        //
        //    var comps = module.components
        //
        //    let codebaseDefinedElement = NativeTypes.componentsFromNativeTypes(types: NativeTypes.controllers + NativeTypes.viewControllers + NativeTypes.views)
        //
        //    for el in codebaseDefinedElement {
        //        if let index = comps.index(where: {$0 == el}) {
        //            comps.remove(at: index)
        //        }
        //    }
        //
        //    for component in comps {
        //        print("\(component.name)")
        //    }
        //}
        //
        
        
        let dependencies4 = analyser.analyseModules(modules:  modules4)
        //
        //analyser.percentages(modules: modules)
        //
        ////let modules2 = pathGrouper.groupByPaths(component: components)
        //
        display.displayModules(modules4)
        ////
        display.displayDependencies(dependencies4)
        
        print("________")
        
//        //exit(0)
//        //
//        ////let elements = typeDetector.detectType(components: components)
//        //
//        ////print(elements)
//        //
//        ////display.displayComponentsByTypes(elements: elements)
//        //
//        ////modelDetector.detect(components: components)
//        //
//        ////display.printComponents(components: components)
//        ////
//        ////let vcs = viewControllerDetector.detect(components: components)
//        //////
//        ////vcs.forEach { (component) in
//        ////    print(component.name)
//        ////}
//        //
//        //
//        //
//        //
//        ////let codebaseComponents = raportParser.parseSwiftFilesFromDirectory(directory: Constants.directoryPath)
//        ////display.printComponents(components: codebaseComponents)
//        //
//
//
//
//
//        // doi
//
//
//        let ccd = CCDComputer()
//        
//        //CCDExample().ccdTest()
//        
//        let paths = [Constants.firefox] //, Constants.wikipedia, Constants.trust, Constants.justSnap,
//        //Constants.fazan, Constants.pp, Constants.wholechild, Constants.apple]
//        
//        for path in paths {
//        
//            print("\n\n PATH \(path) \n\n")
//        
//            let components = raportParser.parseRaport(path: path)
//        
//            let modules = mvc.splitMVCClasses(components: components)
//        
//            var totalCCD = 0
//            var avgCCD = 0
//            for module in modules {
//                print("__________\(module.name)___________")
//        
//                var comps = module.components
//        
//                let codebaseDefinedElement = NativeTypes.componentsFromNativeTypes(types: NativeTypes.controllers + NativeTypes.viewControllers + NativeTypes.views)
//        
//                for el in codebaseDefinedElement {
//                    if let index = comps.index(where: {$0 == el}) {
//                        comps.remove(at: index)
//                    }
//                }
//        
//                let ccdValue = ccd.computeCCD(module: module, allModules: modules)
//                let acdValue = ccdValue/comps.count
//                print("CCD: \(ccdValue)")
//                print("ACD: \(acdValue)")
//        
//        
//                totalCCD += ccdValue
//                avgCCD += acdValue
//            }
//        
//            let comps = modules.map{$0.components.count}.reduce(0, +)
//            print("Comps \(comps), component count \(components.count)")
//        
//            print("TOTAL CCD: \(totalCCD)")
//            print("TOTAL AVG: \(Double(Double(totalCCD) / Double(comps)))")
//        
//        }
//
//
//
//
//        // PATRU
//
//
//        //let analyser = ArchitectureAnalyser()
//
//        let components2 = raportParser.parseRaport(path: Constants.apple)
//
//
//        print("__________________________***************_______________")
//
//
//        let model3 = "BoundingBox,BoundingBoxSide,DetectedBoundingBox,DetectedObject,DetectedPointCloud,ObjectOrigin,ObjectOriginAxis,PointCloud,ScannedObject,ScannedPointCloud,Tile,Wireframe,AppDelegate,Scan,TestRun,ThresholdPanGestureRecognizer,ThresholdPinchGestureRecognizer,ThresholdRotationGestureRecognizer,ARCamera.TrackingState,UIColor,PlaneDrag,simd_quatf,float4x4,float4,SCNMaterial,Ray,ARSCNView,SCNNode,CGPoint,ARReferenceObject,Message".split(separator: ",").map({String($0)})
//
//
//        let view3 = "FlashlightButton,MessageLabel,RoundedButton".split(separator: ",").map({String($0)})
//
//
//        let controller3 = "ShareScanViewController,ViewController".split(separator: ",").map({String($0)})
//
//
//
//
//        let modules2 = ComponentsHelper().splitComponentsCodebase(components: components2, model: Array(model3), view: Array(view3), controller: Array(controller3))
//
//
//        display.displayModules(modules2)
//
//        let dependencies2 = analyser.analyseModules(modules:  modules2)
//        //
//        //analyser.percentages(modules: modules2)
//        //
//        ////let modules2 = pathGrouper.groupByPaths(component: components)
//        //
//        ////display.displayModules(modules)
//        ////
//        display.displayDependencies(dependencies2)
//
//        exit(0)
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//        // TREI
//
//        func write(matrix: [[Int]]) {
//            let file = "/Users/dragos/Documents/Doctorat/Code/SAC-commandLine/wiki2.txt"
//            if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
//
//                //writing
//                do {
//
//                    var txt = ""
//
//                    for line in matrix {
//                        let val = line.map{"\($0)"}.joined(separator: ",")
//                        txt += "\n" + val
//                    }
//
//                    try txt.write(to: URL(fileURLWithPath: file), atomically: false, encoding: .utf8)
//                }
//                catch {/* error handling here */}
//
//                //reading
//
//            }
//        }
//
//        func printMatrixComponent(components:[Component], others: [Component]) {
//
//            var matrix = [[Int]]()
//
//            for (index,component) in components.enumerated() {
//                var values = [Int]()
//
//                for component2 in others {
//                    values.append(component.numberOfElementsOfType(type: component2.type) + String.levenshtein(aStr: component.name, bStr: component2.name))
//                    //            if (component.numberOfElementsOfType(type: component2.type) > 0) {
//                    //                                    values.append(1)
//                    //                                } else {
//                    //                                    values.append(0)
//                    //                                }
//
//                    //            values.append(String.levenshtein(aStr: component.name, bStr: component2.name))
//                }
//
//
//                values.append(component.name.contains("View") ? 500 : 0)
//                values.append(component.name.contains("Controller") ? 1000 : 0)
//                values.append(component.isComponentController(otherComponents: components) ? 2000 : 0)
//                values.append(component.isComponentView(otherComponents: components) ? 750 : 0)
//
//                //        groups[vals[index]]?.append(component.name)
//
//                matrix.append(values)
//            }
//
//            //    print(matrix)
//            write(matrix: matrix)
//
//
//            return
//
//            //
//            //    for key in groups.keys {
//            //        print("\(key) _________\n\n")
//            //        for val in groups[key]! {
//            //            print("      \(val)")
//            //        }
//            //    }
//        }
//
//        func combine(components:[Component]) {
//
//            var groups = [0 : [String](),
//                          1 : [String](),
//                          2 : [String](),
//                          3 : [String](),
//                          4 : [String](),
//                          5 : [String]()]
//
//            let vals = [1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
//                ,0,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
//                ,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
//                ,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1
//                ,1,1,1,1,1,1,0,1,0,0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0
//                ,1,0,1,0,1,0,1,0,2,1,0,1,0,1,0,1,0,1,0,1,0,1,0,0,0,1,0,1,0,1,0,1,0,1,0,1,0
//                ,0,1,1,1,0,1,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,1,1,0,1,0,1,1,1,0,1
//                ,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0
//                ,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,2,2,2,2,2,2,2,2,2,2,1,2,2,2,2
//                ,2,1,2,2,1,2,1,2,2,2,2,2,2,2,1,2,2,1,2,2,2,2,2,2,2,2,2,1,1,2,2,2,2,2,2,2,2
//                ,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,2,1,2,2,1,2,2,1,2,1,2,1,2,2,2,2,2,1,1,2,2
//                ,2,2,2,2,2,2,2,2,1,2,2,1,2,1,2,2,1,2,1,2,2,1,1,1,1]
//
//            for (index,component) in components.enumerated() {
//
//                print(component.name)
//
//                groups[vals[index]]?.append(component.name)
//            }
//
//
//            for key in groups.keys {
//                print("\(key) _________\n\n")
//
//                var str = ""
//                for val in groups[key]! {
//                    //            print("      \(val)")
//                    str += "\(val),"
//                }
//
//                print(str)
//            }
//        }
//
//        func removeElements(current: [Component], desired: String) -> [Component] {
//            var newComps = [Component]()
//
//            let desiredList = desired.components(separatedBy: ",")
//
//            for comp in current {
//                if desiredList.contains(comp.name) {
//                    newComps.append(comp)
//                }
//            }
//
//            return newComps
//        }
//
//        let components = raportParser.parseRaport(path: Constants.wholechild)
//
//
//        var newComponents = [Component]()
//        //newComponents = components
//
//        for component in components {
//            if component.kind == .kClass || component.kind == .kStruct {
//                newComponents.append(component.addMethodsFromExtensions(allComponents: components))
//            }
//
//            if component.kind == .kProtocol {
//                newComponents.append(component)
//            }
//        }
//
//
//
//        print("comps: \n\n\n\n\n")
//        for comp in newComponents {
//            print(comp.name)
//        }
//
//
//        //let modules = mvc.splitMVCClasses(components: components)
//
//        //let model = modules.first(where: {$0.name == "Model"})
//
//        //printMatrixComponent(components: newComponents, others: newComponents)
//        //combine(components: newComponents)
//
//        //exit(0)
//
//        //let matrix = [[1,2,3], [3,2,2]]
//        //write(matrix: matrix)
//
//        let analyser2 = Analyser()
//
//        let model2 = "AlertHelper,APIBaseResponseMapper,Category,CategoryMapper,Child,ChildLastTestData,ChildRequestParametersMapper,ChildResponseMapper,ChildService,Date,Dictionary,Error,ErrorCodeHelper,FileManager,HTMLContent,HTTPCookieStorage,InputValidator,Int,KeychainHelper,LocalNotifications,LocalNotificationScheduler,LocalNotificationsFileHandler,LocalNotificationsHandler,MiscRequestParametersMappers,MiscResponseMapper,MyValueFormatter,NSLayoutConstraint,Question,QuestionMapper,Quiz,QuizRequestMapper,QuizResponseMapper,QuizResult,QuizResultCategory,QuizResultCategoryMapper,QuizResultMapper,QuizService,ResultChartDelegate,ServiceHelper,ServiceHelperConstants,SessionManager,StoryboardHelper,String,TimeInterval,UIAlertController,UIApplication,UIColor,UIDevice,UIFont,UIImage,User,UserDefaultsManagement,UserRequestParametersMapper,UserResponseMapper,UserService,UtilsService"
//
//        let view2 = "ActivityIndicator,BabyTableViewCell,BabyTableViewCellProtocol,CommonButton,LandingPagePageIndicatorView,LandingPagePageIndicatorViewDelegate,LandingPageScrollItemView,ResultsChart,UIImageView,UITableView,UIView,WCButton,WCCheckmarkButton,WCGradientButton,WCQuestionCell,WCQuestionCellDelegate,WCQuizHeaderView,WCTextField,WholeChildImagePicker,WKWebView"
//
//
//        let ctr2 = "AfterSplashViewController,AfterSplashViewControllerFlowDelegate,AlertContainerViewController,AppDelegate,AppNavigationManager,AuthenticationChooseCategoryFlowDelegate,AuthenticationChooseCategoryViewController,AuthenticationFlowManager,AuthenticationFlowManagerDelegate,AuthenticationForgotPasswordFlowDelegate,AuthenticationForgotPasswordViewController,AuthenticationInitialFlowDelegate,AuthenticationInitialViewController,AuthenticationRegisterViewController,AuthenticationRegistrationFlowDelegate,AuthenticationSignInFlowDelegate,AuthenticationSignInViewController,BabiesListFlowProtocol,BabiesListViewController,BabyFlowDelegate,BabyFlowManager,BabyViewController,BaseFlowDelegate,BaseFlowManager,BaseViewControllerFlowDelegate,FlowManagerProtocol,ImagePickerHelper,ImagePickerProtocol,IntroFlowManager,IntroFlowManagerDelegate,IntroViewController,IntroViewControllerFlowDelegate,ppNavigationManager,ProfileFlowManager,ProfileViewController,ProfileViewFlowDelegate,QuizFlowManager,QuizFlowManagerDelegate,QuizViewControllerFlowDelegate,ResultsFlowManager,ResultsFlowManagerDelegate,ResultsViewFlowDelegate,ResultViewController,UIViewController,WCNavigationController,WCQuizViewController,WCViewController,WebViewController,WebViewControllerFlowDelagate"
//
//
//        let groundTruth = AnalyserSet(model: model2.components(separatedBy: ","), view: view2.components(separatedBy: ","), controller: ctr2.components(separatedBy: ","))
//
//
//        let scores = [0.8342013498397158,0.8376202930241022,0.7672330553672327,0.8351276684550748,0.791169591456328,0.7737380139347354,0.663358225412486,0.7760021737104226,0.7914539472717463,0.46450125880459503,0.46428328038201877,0.8466867190953732,0.823236268968098,0.8451396463958087,0.849655822635632,0.37281375578267734,0.41526431334096087,0.4629096100149488,0.4425957524667846,0.8300956244064144,0.8539393237831534,0.7963321086490576,0.7928054945677494,0.47125176963241816,0.4698285113337857,0.8306338583840601,0.8501837929852331,0.8512599913232352,0.7926486651278204,0.7912081742324909,0.7897929116540714,0.788275965075867,0.7785835788058266,0.8398456733970168,0.7873346311288157,0.7969012767452966,0.7942963588018924,0.7904497604807571,0.7924040613158989,0.7935893167458244,0.469406991214594,0.75446091857135,0.46902845769016716,0.471666458761187,0.8495972859921831,0.7956259762172534,0.46092509174073537,0.7799222278813712,0.7874310022413525,0.8506714077999188,0.8516902016312773,0.8555065833355933,0.8473068151641795,0.7706650648722292,0.8353546735234462,0.8425120579649792,0.7902667589945201,0.8472836352418448,0.8316209202462044,0.8523138487994837,0.8543399636569953,0.8327749737873097,0.470298334727611,0.8532756278869408,0.7869550115234405,0.5181808043454882,0.7868971288821492,0.7912053006649271,0.8504769478183177,0.8456834588152397,0.7470610052065502,0.7927673304434283,0.7912938985754187,0.4690420729494628,0.7914976229640367,0.4691804766432889,0.46564436594575404,0.46564436594575404,0.7642323561298949,0.8246286913758459,0.7939794103720101,0.7803009358950508,0.7821263460368721,0.7899171232227958,0.8482205953837393,0.8406901949923762,0.24298736721244804,0.24516102570848822,0.7960475866559021,0.8003026984686025,0.791629786103357,0.790985762860814,0.789625624407445,0.797380687282626,0.8544785800167932,0.8269457812361825,0.770025813592114,0.6935308738387004,0.7983868678102146,0.8542590488758787,0.8543420538659172,0.8530880162291541,0.8548970181807874,0.5518952716773764,0.7799590610361666,0.7911066529850405,0.7980528977673118,0.7985992169903853,0.5100516540399752,0.5181630896878258,0.7681847183828264,0.8282709947677814,0.7721091742711229,0.8424304929558143,0.7923384309297894,0.45852496965501865,0.7702376821800574,0.8296608119208742,0.8512140955343018,0.7880914322675682,0.8284409535355337,0.5153113405854768,0.8471373006034338,0.5130104886431316,0.5167663846350192,0.46755156044672974,0.7931292050339,0.8330959608596981,0.8407898941225884,0.7873353476229706,0.8500541013885382,0.7585047934989652,0.5126832048785289,0.5117098450786983,0.44941467914989036,0.46729531776008704,0.7553488827583915,0.8463431590762533,0.849236199209518,0.7503755184288637,0.8297044992770682,0.824313476727295,0.8409363231765198,0.8095827536227685,0.8212586129940157,0.8536750057028404,0.8166674300264999,0.8540848890200099,0.8477659594560661,0.796602510261036,0.8263268433094035,0.7951973254911713,0.7938956453332211,0.4727780971528588,0.7578408828349906,0.7640897883731331,0.8383057068985428,0.8012975424480124,0.7965552484099366,0.7946853196435024,0.7944710871011302,0.513305495305205,0.8231841637375796,0.7771521588559676,0.7881307738390356,0.7801435973366381,0.833793612659243,0.7548472983034643,0.7929445272999514,0.7902809559837503,0.777768747022041,0.46975696984016885,0.8490574868054259,0.4721526556209933,0.47076594749634815,0.7891489530768658,0.7998409867764472,0.47132443505898036,0.8141645987308129,0.8415946498193548,0.7955651413365895,0.8026515974947269,0.7828028083518245,0.8507294941174072,0.7968812612014778,0.7932988029593784,0.7941212932650425,0.7934099360595783,0.7722750253026855,0.45802314147527023,0.800323733708226,0.46030141272757313,0.7975655434888469,0.7952126594927802,0.8534245356002889,0.8018361513036506,0.6945168132703091,0.7549234252783608,0.8539819755682132,0.7957326526116457,0.7968497144143649,0.833679456212459,0.7938429269667856,0.797605364540874,0.7839783052654353,0.7957896597880373,0.7962614869111055,0.7913885630692303,0.7876208119596364,0.44858585581298505,0.8506523979477504,0.8511709639135655,0.8362155623037469,0.7942642707212103,0.7606438116649764,0.7898950161003111,0.45830554245942007,0.4574522262346793,0.7927720509182427,0.47737980351036335,0.08473247204945339,0.8199100820480767,0.8478675943896675,0.8510453192318057,0.7396937160224937,0.7875653763801803,0.8467661686785398,0.7909938998066043,0.469521494733961,0.7836113808064197,0.7691117615299702,0.8437575198849343,0.8126703980873059,0.8049001407777278,0.8490908733888404,0.7212269228718129,0.784571787301885,0.8432300547900649,0.8473045237987846,0.7829177847812474,0.8418100181787819,0.7773613874249315,0.8385853440314187,0.7397194114926113,0.7879912282462763,0.7798885615305773,0.8423978575430993,0.8436346659291276,0.7845680753334945,0.7945149440015141,0.7975395281147418,0.45652976825327185]
//
//        //let scoresPerComp = analyser2.constructScores(scores: scores, comp: newComponents.map({$0.name}))
//        //let out2 = analyser2.runClusterAnalysis(groundTruth: groundTruth, scores: scoresPerComp)
//        //
//        //print("\n\n\n")
//        //print("Model = \(out2.model)")
//        //print("View = \(out2.view)")
//        //print("Controller = \(out2.controller)")
//
//
//
//
//
//
//
//        //exit(0)
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//        // 4444
//        //let analyserM = Analyser()
//        //
//        //let model = "AlertHelper,APIBaseResponseMapper,Category,CategoryMapper,Child,ChildLastTestData,ChildRequestParametersMapper,ChildResponseMapper,ChildService,Date,Dictionary,Error,ErrorCodeHelper,FileManager,HTMLContent,HTTPCookieStorage,InputValidator,Int,KeychainHelper,LocalNotifications,LocalNotificationScheduler,LocalNotificationsFileHandler,LocalNotificationsHandler,MiscRequestParametersMappers,MiscResponseMapper,MyValueFormatter,NSLayoutConstraint,Question,QuestionMapper,Quiz,QuizRequestMapper,QuizResponseMapper,QuizResult,QuizResultCategory,QuizResultCategoryMapper,QuizResultMapper,QuizService,ResultChartDelegate,ServiceHelper,ServiceHelperConstants,SessionManager,StoryboardHelper,String,TimeInterval,UIAlertController,UIApplication,UIColor,UIDevice,UIFont,UIImage,User,UserDefaultsManagement,UserRequestParametersMapper,UserResponseMapper,UserService,UtilsService"
//        //
//        //let view = "ActivityIndicator,BabyTableViewCell,BabyTableViewCellProtocol,CommonButton,LandingPagePageIndicatorView,LandingPagePageIndicatorViewDelegate,LandingPageScrollItemView,ResultsChart,UIImageView,UITableView,UIView,WCButton,WCCheckmarkButton,WCGradientButton,WCQuestionCell,WCQuestionCellDelegate,WCQuizHeaderView,WCTextField,WholeChildImagePicker,WKWebView"
//        //
//        //
//        //let ctr = "AfterSplashViewController,AfterSplashViewControllerFlowDelegate,AlertContainerViewController,AppDelegate,AppNavigationManager,AuthenticationChooseCategoryFlowDelegate,AuthenticationChooseCategoryViewController,AuthenticationFlowManager,AuthenticationFlowManagerDelegate,AuthenticationForgotPasswordFlowDelegate,AuthenticationForgotPasswordViewController,AuthenticationInitialFlowDelegate,AuthenticationInitialViewController,AuthenticationRegisterViewController,AuthenticationRegistrationFlowDelegate,AuthenticationSignInFlowDelegate,AuthenticationSignInViewController,BabiesListFlowProtocol,BabiesListViewController,BabyFlowDelegate,BabyFlowManager,BabyViewController,BaseFlowDelegate,BaseFlowManager,BaseViewControllerFlowDelegate,FlowManagerProtocol,ImagePickerHelper,ImagePickerProtocol,IntroFlowManager,IntroFlowManagerDelegate,IntroViewController,IntroViewControllerFlowDelegate,ppNavigationManager,ProfileFlowManager,ProfileViewController,ProfileViewFlowDelegate,QuizFlowManager,QuizFlowManagerDelegate,QuizViewControllerFlowDelegate,ResultsFlowManager,ResultsFlowManagerDelegate,ResultsViewFlowDelegate,ResultViewController,UIViewController,WCNavigationController,WCQuizViewController,WCViewController,WebViewController,WebViewControllerFlowDelagate"
//        //
//        //
//        //let manual = AnalyserSet(model: model.components(separatedBy: ","), view: view.components(separatedBy: ","), controller: ctr.components(separatedBy: ","))
//        //
//        //
//        //
//        //let omodel = "AppDelegate,FileManager,HTTPCookieStorage,Int,NSLayoutConstraint,String,TimeInterval,UIApplication,UIColor,UIDevice,UIFont,UIImage,UIImageView,UITableView,UIView,WKWebView,AppNavigationManager,AuthenticationFlowManagerDelegate,AuthenticationFlowManager,BabyFlowManager,FlowManagerProtocol,BaseFlowDelegate,BaseFlowManager,IntroFlowManagerDelegate,IntroFlowManager,ProfileFlowManager,QuizFlowManagerDelegate,QuizFlowManager,ResultsFlowManagerDelegate,ResultsFlowManager,AlertHelper,Date,Dictionary,ErrorCodeHelper,ImagePickerProtocol,ImagePickerHelper,InputValidator,KeychainHelper,LocalNotificationScheduler,LocalNotifications,LocalNotificationsFileHandler,LocalNotificationsHandler,StoryboardHelper,UserDefaultsManagement,SessionManager,Category,CategoryMapper,Child,ChildLastTestData,ChildRequestParametersMapper,ChildResponseMapper,HTMLContent,MiscRequestParametersMappers,MiscResponseMapper,Question,QuestionMapper,QuizRequestMapper,QuizResponseMapper,QuizResultCategoryMapper,QuizResultMapper,Quiz,QuizResult,QuizResultCategory,UserRequestParametersMapper,UserResponseMapper,User,APIBaseResponseMapper,ChildService,QuizService,Error,ServiceHelperConstants,ServiceHelper,UserService,UtilsService,ActivityIndicator,BabyTableViewCellProtocol,BabyTableViewCell,ResultChartDelegate,MyValueFormatter,ResultsChart,CommonButton,LandingPagePageIndicatorViewDelegate,LandingPagePageIndicatorView,LandingPageScrollItemView,WCButton,WCCheckmarkButton,WCGradientButton,WCQuestionCellDelegate,WCQuestionCell,WCQuizHeaderView,WCTextField,AuthenticationChooseCategoryFlowDelegate,AuthenticationForgotPasswordFlowDelegate,AuthenticationInitialFlowDelegate,AuthenticationRegistrationFlowDelegate,AuthenticationSignInFlowDelegate,BabiesListFlowProtocol,BabyFlowDelegate,ProfileViewFlowDelegate,ResultsViewFlowDelegate"
//        //
//        //let oview = "WCNavigationController,WholeChildImagePicker"
//        //
//        //let octr = "WCViewController,AlertContainerViewController,UIAlertController,UIViewController,BaseViewControllerFlowDelegate,AuthenticationChooseCategoryViewController,AuthenticationForgotPasswordViewController,AuthenticationInitialViewController,AuthenticationRegisterViewController,AuthenticationSignInViewController,BabiesListViewController,BabyViewController,AfterSplashViewControllerFlowDelegate,AfterSplashViewController,IntroViewControllerFlowDelegate,IntroViewController,WebViewControllerFlowDelagate,WebViewController,ProfileViewController,QuizViewControllerFlowDelegate,WCQuizViewController,ResultViewController"
//        //
//        //let out = AnalyserSet(model: omodel.components(separatedBy: ","), view: oview.components(separatedBy: ","), controller: octr.components(separatedBy: ","))
//        //
//        //
//        //analyserM.runAnalysis(manual: manual, output: out)
        
        
    }
}






