//
//  Apple.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 18/02/2020.
//  Copyright © 2020 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation


fileprivate struct Codebases {
    static let baseModel = "ARCamera.TrackingState,ARReferenceObject,BoundingBox,BoundingBoxSide,CGPoint,DetectedBoundingBox,DetectedObject,DetectedPointCloud,Message,ObjectOrigin,ObjectOriginAxis,PlaneDrag,PointCloud,Ray,Scan,ScannedObject,ScannedPointCloud,SCNMaterial,SCNNode,TestRun,ThresholdPanGestureRecognizer,ThresholdPinchGestureRecognizer,ThresholdRotationGestureRecognizer,Tile,UIColor,Wireframe".split(separator: ",").map({String($0)})
    
    static let baseView = "ARSCNView,FlashlightButton,MessageLabel,RoundedButton".split(separator: ",").map({String($0)})
    
    static let baseController = "ShareScanViewController,ViewController,AppDelegate".split(separator: ",").map({String($0)})
    
    
    
    static let macsSimpleModel = "AppDelegate,ARCamera.TrackingState,ARReferenceObject,BoundingBox,BoundingBoxSide,CGPoint,DetectedBoundingBox,DetectedObject,DetectedPointCloud,float4,float4x4,Message,ObjectOrigin,ObjectOriginAxis,PlaneDrag,PointCloud,Ray,Scan,ScannedObject,ScannedPointCloud,SCNMaterial,SCNNode,simd_quatf,TestRun,ThresholdPanGestureRecognizer,ThresholdPinchGestureRecognizer,ThresholdRotationGestureRecognizer,Tile,UIColor,Wireframe".split(separator: ",").map({String($0)})
    
    
    
    static let macsSimpleView = "FlashlightButton,ARSCNView,MessageLabel,RoundedButton".split(separator: ",").map({String($0)})
    
    
    
    static let macsSimpleController = "ShareScanViewController,ViewController".split(separator: ",").map({String($0)})
    
    
    
    
    static let macsCoordinatorModel = "AppDelegate,ARCamera.TrackingState,ARReferenceObject,ARSCNView,BoundingBox,BoundingBoxSide,CGPoint,DetectedBoundingBox,DetectedObject,DetectedPointCloud,float4,float4x4,Message,ObjectOrigin,ObjectOriginAxis,PlaneDrag,PointCloud,Ray,Scan,ScannedObject,ScannedPointCloud,SCNMaterial,SCNNode,simd_quatf,TestRun,ThresholdPanGestureRecognizer,ThresholdPinchGestureRecognizer,ThresholdRotationGestureRecognizer,Tile,UIColor,Wireframe".split(separator: ",").map({String($0)})
    
    
    static let macsCoordinatorView = "FlashlightButton,MessageLabel,RoundedButton".split(separator: ",").map({String($0)})
    
    
    static let macsCoordinatorController = "ShareScanViewController,ViewController".split(separator: ",").map({String($0)})
    
    
    
    static let carlSimpleModel = "AppDelegate,BoundingBox,BoundingBoxSide,DetectedBoundingBox,DetectedObject,DetectedPointCloud,ObjectOrigin,ObjectOriginAxis,PointCloud,ScannedObject,ScannedPointCloud,Tile,Wireframe,AppDelegate,Scan,TestRun,ThresholdPanGestureRecognizer,ThresholdPinchGestureRecognizer,ThresholdRotationGestureRecognizer,ARCamera.TrackingState,UIColor,PlaneDrag,simd_quatf,float4x4,float4,SCNMaterial,Ray,SCNNode,CGPoint,ARReferenceObject,Message".split(separator: ",").map({String($0)})
    
    
    static let carlSimpleView = "ARSCNView,FlashlightButton,MessageLabel,RoundedButton".split(separator: ",").map({String($0)})
    
    
    
    static let carlSimpleController = "ShareScanViewController,ViewController".split(separator: ",").map({String($0)})
    
    
    static let hybridController = "BoundingBox,BoundingBoxSide,ObjectOrigin,Scan,ScannedObject,TestRun,ShareScanViewController,ViewController".split(separator: ",").map({String($0)})
    
    
    static let hybridModel = "AppDelegate,ARCamera.TrackingState,ARReferenceObject,ARSCNView,CGPoint,DetectedBoundingBox,DetectedObject,DetectedPointCloud,float4,float4x4,Message,ObjectOriginAxis,PlaneDrag,PointCloud,Ray,ScannedPointCloud,SCNMaterial,SCNNode,simd_quatf,ThresholdPanGestureRecognizer,ThresholdPinchGestureRecognizer,ThresholdRotationGestureRecognizer,Tile,UIColor,Wireframe".split(separator: ",").map({String($0)})
    
}


class Apple: MVCCodebase {
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
