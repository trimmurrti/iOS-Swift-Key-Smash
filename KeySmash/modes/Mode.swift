//
//  Mode.swift
//  KeySmash
//
//  Created by trimm on 1/21/17.
//  Copyright © 2017 Piikea Street. All rights reserved.
//

import Foundation

class Mode {
    let synthesizer = Synthesizer()
    
    func start() {
        
    }
    
    func respond(to key: String) {
        
    }
    
    func say(_ phrases: [String?], immediately: Bool = true) {
        let strings = phrases.flatMap { $0 }
        
        self.say(strings, immediately: immediately)
    }
    
    func say(_ phrases: [String], immediately: Bool = true) {
        self.synthesizer.say(phrases, immediately: immediately)
    }
    
    func say(_ phrase: String, immediately: Bool = true) {
        self.synthesizer.say(phrase, immediately: immediately)
    }
}
