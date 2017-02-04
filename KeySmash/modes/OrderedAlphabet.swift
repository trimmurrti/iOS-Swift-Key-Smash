import Foundation

class OrderedAlphabet: OrderedMode {
    init() {
        super.init(KeyboardCharacters.letters)
    }
    
    override var startPhrase: String? {
        return "Can you type your a b c's?"
    }
    
    override var successPhrase: String? {
        return "Great Job! You typed the a b c's. Let's do it again!"
    }
    
    override var taskPhrase: String? {
        return "Type \(self.targetKey)."
    }
}
