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
    
    func say(_ word: String, immediately: Bool = true) {
        let synthesizer = self.synthesizer
        if immediately {
            synthesizer.stopSpeaking(at: .immediate)
        }
        
        let utterance = AVSpeechUtterance(string: word.lowercased())
        synthesizer.speak(utterance)
    }
}
