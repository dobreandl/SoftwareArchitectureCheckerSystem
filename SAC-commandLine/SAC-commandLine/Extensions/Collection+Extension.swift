//
//  Collection+Extension.swift
//  SAC-commandLine
//
//  Created by Dragos Dobrean on 18/08/2018.
//  Copyright © 2018 APPSSEMBLE-SOFT. All rights reserved.
//

import Foundation

extension Collection where Element: StringProtocol {
    
    func longestCommonPrefix() -> String {
        guard let first = self.first.map({ String($0) }) else { return "" }
        
        return dropFirst().reduce(first, { $0.commonPrefix(with: $1) })
    }
    
    func longestCommonSuffix() -> String {
        return String(self.lazy.map({ String($0.reversed()) }).longestCommonPrefix().reversed())
    }
}
