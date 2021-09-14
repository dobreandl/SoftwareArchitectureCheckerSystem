//
//  main.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 11/08/2018.
//  Copyright © 2018 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation
import SourceKittenFramework

struct Constants {
    static let reportsPath = "/Users/dragos/Documents/Doctorat/Doctorat-GIT/Code/SAC-commandLine/SAC-commandLine/Resources/" // TODO: Replace this with your path
    static let firefox = reportsPath + "firefox.txt"
    static let wikipedia = reportsPath + "wikipedia.txt"
    static let trust = reportsPath + "trust.txt"
    
    static let directoryPath = "" // TODO: Replace this with your path
    
    static let apple = reportsPath + "apple-object-scanning.txt"
}


func computeArhitectureMetrics() {
    let codebase = Apple.init()
    let path = Constants.apple
    
    let display = Display()
    
    let analyser = ArchitectureAnalyser()
    let raportParser = RaportParser()
    let acdccd = ACDCCDComputer()
    
    let components = raportParser.parseRaport(path: path)
    let modules = acdccd.modulesFrom2(layers: codebase.hybrid, components: components)
    
    //* architecture
    
    let dependencies = analyser.analyseModules(modules: modules)
    display.displayDependencies(dependencies)
    
    
    // * layers acddc
    acdccd.computeFor(modules: modules, components: components)
}


func matrixBuilder() {
    let matrix = Matrix()
    matrix.buildHybridMatrixMacs(codebaseLayers: Firefox.init().macsCoordinator, path: Constants.firefox, codebase: "Firefox")
    matrix.buildHybridMatrix(codebaseLayers: Firefox.init().macsCoordinator, path: Constants.firefox, codebase: "Firefox-Hyde")
    
    
    matrix.displayHybridComponentsSplitMacs(codebaseLayers: Firefox.init().benchmark, clustering: [0,0,0,0,0,0,0,0,1,0,1,0,1,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,2,2,2,0,2,1,0,1,2,1,1,0,0,2,0,1,0,1,1,0,1,1,1,0,0,0,1,2,0,2,0,1,2,0,1,1,2,1,0,1,0,0,1,0,0,1,0,1,0,1,1,0,1,1,1,0,0,2,2,0,2,0,0,0,0,2,0,2,1,0,0,2,0,0,0,0,2,1,0,1,0,1,2,2,2,0,1,0,1,0,2,1,2,1,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,2,1,2,0,0,0,1,0,1,0,2,1,0,1,0,1,0,1,1,0,0,1,0,1,0,0,0,0,0,0,0,0,0,1,2,1,1,0,1,0,1,0,2,0,0,1,0,1,2,1,0,2,1,0,1,0,0,0,2,0,1,0,0,0,0,0,0,0,1,0,0,1,1,0,1,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0,1,0,0,1,0,1,1,1,0,1,0,1,1,0,0,0,1,1,1,1,1,0,1,0,1,1,1,1,0,1,1,0], path: Constants.firefox)
}


func analysePrecisionRecallAccuracy() {
    let analyser = Analyser()
    
    let benchmark = Firefox.init().benchmark
    let macsCoord = Firefox.init().macsCoordinator

    let newSet = AnalyserSet(model: macsCoord.model, view: macsCoord.view, controller: macsCoord.controller)
    let groundTruth = AnalyserSet(model: benchmark.model, view: benchmark.view, controller: benchmark.controller)

    analyser.runAnalysis(manual: groundTruth, output: newSet)
}


func analyseMetrics() {
    // ACDC
    let acdccd = ACDCCDComputer()
    acdccd.computeForCodebase(codebase: Firefox.init(), path: Constants.firefox)

    // Homogenity
    let display = Display()
    let codebase = Firefox()
    display.displayClustersForAnalyisis(benchmark: codebase.benchmark, analysed: codebase.macsSimple)
    
    
    // Layers
    let analyser = ArchitectureAnalyser()
    let raportParser = RaportParser()

    let path = Constants.firefox

    let components = raportParser.parseRaport(path: path)
    let modules = acdccd.modulesFrom2(layers: codebase.macsCoordinator, components: components)

    let dependencies = analyser.analyseModules(modules: modules)
    display.displayDependencies(dependencies)
}

analyseMetrics()
















