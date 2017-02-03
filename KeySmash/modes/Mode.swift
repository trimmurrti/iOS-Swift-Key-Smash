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
        self.synthesizer.say(phrases, immediately: immediately)
    }
    
    func say(phrase: String, immediately: Bool = true) {
        self.synthesizer.say(phrase, immediately: immediately)
    }
}
