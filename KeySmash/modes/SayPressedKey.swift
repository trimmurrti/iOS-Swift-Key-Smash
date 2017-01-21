import Foundation
import UIKit
import AVFoundation

class SayPressedKey: Modeable {
    let synthesizer = AVSpeechSynthesizer()

    func start()  {
        self.say("Press any Key")
    }
    
    func respond(to key: String) {
        let keys = [
            UIKeyInputEscape: "escape",
            UIKeyInputLeftArrow: "left",
            UIKeyInputRightArrow: "right",
            UIKeyInputUpArrow: "up",
            UIKeyInputDownArrow: "down",
            " ": "space"
        ]
    
        self.say(keys[key] ?? key)
    }
    
    func say(_ word: String) {
        let utterance = AVSpeechUtterance(string: word.lowercased())
        self.synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
        self.synthesizer.speak(utterance)
    }
}
