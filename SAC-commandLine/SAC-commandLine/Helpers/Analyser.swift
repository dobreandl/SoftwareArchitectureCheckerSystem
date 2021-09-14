//
//  Analyser.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 07/09/2019.
//  Copyright © 2019 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation


struct AnalyserSet {
    let model: [String]
    let view: [String]
    let controller: [String]
}

struct CompScore {
    let comp: String
    let score: Double
}


class Analyser {
    
    func constructScores(scores: [Double], comp: [String]) -> [CompScore] {
        var compScores = [CompScore]()
        
        for index in 0..<scores.count {
            let score = CompScore(comp: comp[index], score: scores[index])
            
           compScores.append(score)
        }
     
        return compScores
    }
    
    func runClusterAnalysis(groundTruth: AnalyserSet, scores:[CompScore]) -> (model: Double, view: Double, controller: Double) {
        
        let modelScore = calculateScore(comps: groundTruth.model, scores: scores)
        let viewScore = calculateScore(comps: groundTruth.view, scores: scores)
        let ctrlScore = calculateScore(comps: groundTruth.controller, scores: scores)
        
        return (model: modelScore, view: viewScore, controller: ctrlScore)
    }
    
    private func calculateScore(comps: [String], scores: [CompScore]) -> Double {
        var scoreFinal = 0.0
        var items = 0
        
        for item in comps {
            if let score = scores.first(where: {$0.comp == item}) {
                scoreFinal += score.score
                items += 1
            }
        }
        
        if scoreFinal == 0 {
            return scoreFinal
        }
        
        return scoreFinal / Double(items)
    }
    
    
    func runAnalysis(manual: AnalyserSet, output: AnalyserSet) {
        let newOutput = removeExtraItems(manual: manual, output: output)
        
        print("\n*** MODEL ***\n\n")
        compute(manual: manual.model, output: newOutput.model)
        
        print("\n*** VIEW ***\n\n")
        compute(manual: manual.view, output: newOutput.view)
        
        print("\n*** CONTROLLER ***\n\n")
        compute(manual: manual.controller, output: newOutput.controller)
    }
    
    
    func runAnalysis2(manual: AnalyserSet, output: AnalyserSet) {
        let newOutput = removeExtraItems(manual: manual, output: output)
        
        print("\n*** MODEL ***\n\n")
        compute(manual: manual.model, output: newOutput.model)
        
        print("\n*** VIEW ***\n\n")
        compute(manual: manual.view, output: newOutput.view)
        
        print("\n*** CONTROLLER ***\n\n")
        compute(manual: manual.controller, output: newOutput.controller)
    }
    
    // MARK: Private methods
    
    private func removeExtraItems(manual: AnalyserSet, output: AnalyserSet) -> AnalyserSet {
        let newModel = output.model.filter({manual.model.contains($0) || manual.view.contains($0) || manual.controller.contains($0)})
        let newView = output.view.filter({manual.model.contains($0) || manual.view.contains($0) || manual.controller.contains($0)})
        let newCtr = output.controller.filter({manual.model.contains($0) || manual.view.contains($0) || manual.controller.contains($0)})
        
        return AnalyserSet(model: newModel, view: newView, controller: newCtr)
    }
    
    private func compute(manual: [String], output: [String]) {
        print("Manual - #elemn: \(manual.count)")
        print("Output - #elemn: \(output.count)\n")
        
        let manualSet = Set(manual)
        let outputSet = Set(output)
        
        let intersection = manualSet.intersection(outputSet)
        print("Matched elements: \(intersection.count)\n")
        
        let manualExtra = manualSet.subtracting(intersection)
        let outputExtra = outputSet.subtracting(intersection)
        
//        print("Unmatched elements manual: \(manualExtra.count)")
//        for el in manualExtra {
//            print("     \(el)")
//        }
//        
//        print("Unmatched elements output: \(outputExtra.count)")
//        for el in outputExtra {
//            print("     \(el)")
//        }
    }
}
