import Foundation
import AVFoundation

class OrderedAlphabet: Modeable {
    let synthesizer = AVSpeechSynthesizer()
    
    let letters = "abcdefghijklmnopqrstuvwxyz".characterStrings()
    var letterIndex = -1

    var targetKey: String {
        return self.letters[self.letterIndex]
    }
    
    func start() {
        self.say("Can you type your a b c's?")
        self.nextKey()
    }
    
    func respond(to key:String) {
        if(key == self.targetKey) {
            self.immediatelySay("\(self.targetKey)")
            
            self.nextKey()
        } else {
            self.immediatelySay("No.  Try again.  Press the \(self.targetKey) key")
        }
    }
    
    func nextKey() {
        self.letterIndex += 1
        
        if (self.letterIndex > self.letters.count - 1) {
            self.letterIndex = 0;
            self.say("Great Job!  You typed the a b c's .   Let's do it again!")
        }
        
        self.say("Type \(self.targetKey)")
    }
    
    func say(_ word: String) {
        let utterance = AVSpeechUtterance(string: word.lowercased())
        self.synthesizer.speak(utterance)
    }
    
    func immediatelySay(_ word: String) {
        let utterance = AVSpeechUtterance(string: word.lowercased())
        self.synthesizer.stopSpeaking(at: .immediate)
        self.synthesizer.speak(utterance)
    }
}
