import Foundation
import AVFoundation

class Counting: Modeable {
    let synthesizer = AVSpeechSynthesizer()
    
    let numbers = (1...9).reduce("", { $0 + String($1) }).characterStrings()
    var numberIndex = -1
    
    var targetKey: String { return self.numbers[self.numberIndex] }
    
    func start()  {
        self.say("Can you count from 1 to 9?")
        self.nextKey()
    }
    
    func respond(to key:String) {
        if (key == self.targetKey) {
            self.immediatelySay("\(self.targetKey)")
            
            self.nextKey()
        } else {
            self.immediatelySay("No.  Try again.  Press the \(self.targetKey) key")
        }
    }
    
    func nextKey () {
        self.numberIndex += 1
        
        if (self.numberIndex > self.numbers.count - 1) {
            self.numberIndex = 0;
            self.say("Great Job!  You counted to 9.   Let's do it again!")
        }
        
        self.say("Press \(self.targetKey)")
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
