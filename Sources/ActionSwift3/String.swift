//
//  String.swift
//  ActionSwift
//
//  Created by Craig Grummitt on 22/09/2015.
//  Copyright © 2015 Interactive Coconut. All rights reserved.
//

import Foundation

/**
Add subscripts to String
*/
extension String {
    subscript(i: Int) -> Character {
        self[self.index(self.startIndex, offsetBy: i)]   //advance(self.startIndex, i)
    }
    subscript(i: Int) -> String {
        String(self[i] as Character)
    }
    subscript(r: Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound - r.lowerBound)
            return String(self[startIndex..<endIndex])
        }
    }
    subscript(r: CountableClosedRange<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound - r.lowerBound)
            return String(self[startIndex..<endIndex])
        }
    }

    func lastCharacter() -> String {
        self[self.length() - 1]
    }

    var floatValue: Float {
        (self as NSString).floatValue
    }

    func length() -> Int {
        self.count
    }

    func getFirstWord() -> String {
        self.components(separatedBy: " ")[0]
    }

    //resolve path extension
    var pathExtension: String? {
        NSString(string: self).pathExtension
    }
    var stringByDeletingPathExtension: String {
        NSString(string: self).deletingPathExtension
    }
}
