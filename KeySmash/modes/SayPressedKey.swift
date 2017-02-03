import Foundation
import UIKit
import AVFoundation

class SayPressedKey: Mode {
    override func start()  {
        self.say("Press any Key")
    }
    
    override func respond(to key: String) {
        let keys = [
            UIKeyInputEscape: KeyNames.escape,
            UIKeyInputLeftArrow: KeyNames.left,
            UIKeyInputRightArrow: KeyNames.right,
            UIKeyInputUpArrow: KeyNames.up,
            UIKeyInputDownArrow: KeyNames.down,
            UIKeyInputSpace: KeyNames.space
        ]
    
        self.say(keys[key] ?? key)
    }
}
