//
//  TargetMode.swift
//  KeySmash
//
//  Created by Oleksa 'trimm' Korin on 2/3/17.
//  Copyright © 2017 Piikea Street. All rights reserved.
//

class OrderedMode: Mode {
    let strings: [String]
    
    var targetIndex = 0
    var targetKey: String { return self.strings[self.targetIndex] }

    var startPhrase: String? { return nil }
    var taskPhrase: String? { return "Press the \(self.targetKey) key." }
    var successPhrase: String? { return nil }
    var failPhrase: String? { return "No. Try again." }
    
    init(_ strings: [String]) {
        self.strings = strings
    }
    
    func startPhrases() -> [String?] {
        return [self.startPhrase, self.taskPhrase]
    }
    
    func responsePhrases(for key: String) -> [String?] {
        return [
            self.keyPhrase(key),
            self.isCorrect(key) ? nil : self.failPhrase,
            self.isSuccess(key) ? self.successPhrase : nil
        ]
    }
    
    func isCorrect(_ key: String) -> Bool {
        return key == self.targetKey
    }
    
    func isSuccess(_ key: String) -> Bool {
        return self.isCorrect(key) && (self.targetIndex + 1) == self.strings.count
    }
    
    func keyPhrase(_ key: String) -> String? {
        return key
    }
    
    func setNextKey() {
        self.targetIndex = (self.targetIndex + 1) % self.strings.count
    }
    
    override func start() {
        self.say(self.startPhrases())
    }
    
    override func respond(to key: String) {
        let phrases = self.responsePhrases(for: key)
        if self.isCorrect(key) {
            self.setNextKey()
        }
        
        self.say(phrases + [self.taskPhrase])
    }
}
