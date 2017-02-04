import Foundation
import AVFoundation

class Counting: OrderedMode {
    init() {
        super.init((1...9).map { String($0) })
    }
    
    override var startPhrase: String? {
        return "Can you count from 1 to 9?"
    }
    
    override var successPhrase: String? {
        return "Great Job! You counted to 9. Let's do it again!"
    }
    
    override var taskPhrase: String? {
        return "Press \(self.targetKey)."
    }
}
