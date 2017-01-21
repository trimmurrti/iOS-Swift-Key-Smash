import Foundation
import UIKit
import AVFoundation

class SayPressedKey : Mode {

    let synthesizer = AVSpeechSynthesizer()

    func start()  {
        say("Press any Key")
    }
    
    func respondTo(_ key: String) {
        switch (key as NSString) // UIKeyConstants are NSStrings, beta3 needs same type
        {
            case UIKeyInputEscape as String:      say("escape")
            case UIKeyInputLeftArrow as String:   say("left")
            case UIKeyInputRightArrow as String:  say("right")
            case UIKeyInputUpArrow as String:     say("up")
            case UIKeyInputDownArrow as String:   say("down")
            case NSString(string:" "):  say("space")
            default:                    say(key)
        }
    }
    
    func say(_ word: String) {
        let utterance = AVSpeechUtterance(string: word.lowercased())
        synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
        synthesizer.speak(utterance)
    }
}
