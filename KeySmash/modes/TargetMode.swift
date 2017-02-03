//
//  TargetMode.swift
//  KeySmash
//
//  Created by Oleksa 'trimm' Korin on 2/3/17.
//  Copyright © 2017 Piikea Street. All rights reserved.
//

import Foundation

class TargetMode: Mode {
    let strings: [String]
    
    var targetIndex = 0
    var targetKey: String { return String(self.strings[self.targetIndex]) }

    var startPhrase: String? { return nil }
    var taskPhrase: String? { return nil }
    var successPhrase: String? { return nil }
    var failPhrase: String? { return nil }
    
    init(_ strings: [String]) {
        self.strings = strings
    }
    
    func startPhrases() -> [String?] {
        return [self.startPhrase, self.taskPhrase]
    }
    
    func responsePhrases(for key: String) -> [String?] {
        return [
            self.keyPhrase(key),
            self.isCorrect(key) ? self.successPhrase : self.failPhrase
        ]
    }
    
    func isCorrect(_ key: String) -> Bool {
        return key == self.targetKey
    }
    
    func keyPhrase(_ key: String) -> String? {
        return key
    }
    
    func setNextKey() {
        
    }
    
    override func start() {
        self.say(phrases: self.startPhrases())
    }
    
    override func respond(to key: String) {
        let phrases = self.responsePhrases(for: key)
        if self.isCorrect(key) {
            self.setNextKey()
        }
        
        self.say(phrases: phrases + [self.taskPhrase])
    }
}
