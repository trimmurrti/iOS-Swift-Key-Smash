//
//  OrderedMode.swift
//  KeySmash
//
//  Created by trimm on 1/21/17.
//  Copyright © 2017 Piikea Street. All rights reserved.
//

import Foundation

class OrderedMode: Mode {
    let strings: [String]
    
    init(_ strings: [String]) {
        self.strings = strings
    }
    
    var targetIndex = -1
    
    var targetKey: String { return self.strings[self.targetIndex] }
    
    var startPhrase: String? { return nil }
    
    override func start()  {
        self.startPhrase.dispatch { self.synthesizer.say($0) }
        
        self.nextKey()
    }
    
    override func respond(to key:String) {
        let targetKey = self.targetKey
        let isTargetKey = key == targetKey
        
        if (isTargetKey) {
            self.nextKey()
        }
        
        let phrase = "No.  Try again.  Press the " + (isTargetKey ? "\(targetKey) " : "") + "key"
        self.synthesizer.say(phrase, immediately: true)
    }
    
    func nextKey () {
        var index = self.targetIndex
        index += 1
        
        let count = self.strings.count
        let isModeFinished = count <= index
        
        self.targetIndex = index % count
        
        let phrases = [
            isModeFinished ? "Great Job! You counted to 9. Let's do it again!" : "",
            "Press \(index)"
        ]
        
        phrases.forEach { self.synthesizer.say($0) }
    }
}
