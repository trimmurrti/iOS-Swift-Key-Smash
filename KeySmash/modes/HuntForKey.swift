import Foundation
import AVFoundation

class HuntForKey: TargetMode {
    init() {
        super.init(KeyboardCharacters.letters)
    }
    
    override func start()  {
        self.setNextKey()
        
        super.start()
    }
    
    override var successPhrase: String? {
        return "Great job! You pressed the letter \(self.targetKey)."
    }
    
    override func setNextKey() {
        self.targetIndex = Int(exactly: arc4random_uniform(UInt32(exactly: self.strings.count) ?? 0)) ?? 0
    }
}
