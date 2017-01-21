//
//  Mode.swift
//  KeySmash
//
//  Created by trimm on 1/21/17.
//  Copyright © 2017 Piikea Street. All rights reserved.
//

import Foundation
import AVFoundation

class Mode: Modeable {
    let synthesizer = AVSpeechSynthesizer()
    
    func say(_ word: String, immediately: Bool = true) {
        let synthesizer = self.synthesizer
        if immediately {
            synthesizer.stopSpeaking(at: .immediate)
        }
        
        let utterance = AVSpeechUtterance(string: word.lowercased())
        synthesizer.speak(utterance)
    }
    
    func start() {
        
    }
    
    func respond(to key:String) {
        
    }
}
