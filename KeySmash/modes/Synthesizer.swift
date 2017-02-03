//
//  Synthesizer.swift
//  KeySmash
//
//  Created by Oleksa 'trimm' Korin on 2/2/17.
//  Copyright © 2017 Piikea Street. All rights reserved.
//

import AVFoundation

class Synthesizer {
    let synthesizer = AVSpeechSynthesizer()
    
    func say(_ phrase: String, immediately: Bool = true) {
        self.say([phrase], immediately: immediately)
    }
    
    func say(_ phrases: [String], immediately: Bool = true) {
        let synthesizer = self.synthesizer
        if immediately {
            synthesizer.stopSpeaking(at: .immediate)
        }
        
        phrases.map { AVSpeechUtterance(string: $0) }
            .forEach { synthesizer.speak($0) }
    }
}
