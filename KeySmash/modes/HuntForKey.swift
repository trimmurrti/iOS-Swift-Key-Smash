import Foundation
import AVFoundation

class HuntForKey: Modeable {
    let synthesizer = AVSpeechSynthesizer()

    let letters = "abcdefghijklmnopqrstuvwxyz".characterStrings()
    var targetKey = ""
    
    func start()  {
        self.randomizeKey()
    }
    
    func respond(to key:String)  {
        if(key == self.targetKey) {
            self.immediatelySay("Great job! You pressed the letter \(targetKey)")
            
            self.randomizeKey()
        } else {
            self.immediatelySay("No.  Try again.  Press the \(targetKey) key")
        }
    }
    
    func randomizeKey() {
        let randomLetterIndex = Int(arc4random()) % self.letters.count
        self.targetKey = self.letters[randomLetterIndex]
        
        self.say("Press the \(self.targetKey) key")
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
