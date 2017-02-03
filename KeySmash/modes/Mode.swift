//
//  Mode.swift
//  KeySmash
//
//  Created by trimm on 1/21/17.
//  Copyright © 2017 Piikea Street. All rights reserved.
//

import Foundation

class Mode: Modeable {
    let synthesizer = Synthesizer()
    
    func start() {
        
    }
    
    func respond(to key: String) {
        
    }
    
    func say(phrases: [String?], immediately: Bool = true) {
        let strings = phrases.flatMap { $0 }
        
        self.say(phrases: strings, immediately: immediately)
    }
    
    func say(phrases: [String], immediately: Bool = true) {
        let count = phrases.count
        if count > 0 {
            self.say(phrase: phrases[0], immediately: immediately)
            if count > 1 {
                phrases[1..<count].forEach {
                    self.say(phrase: $0, immediately: false)
                }
            }
        }
    }
    
    func say(phrase: String, immediately: Bool = true) {
        self.synthesizer.say(phrase, immediately: immediately)
    }
}
