import Foundation
import UIKit
import AVFoundation

class SayPressedKey: Mode {
    override func start()  {
        self.say("Press any Key")
    }
    
    let keys = [
        UIKeyInputEscape: KeyNames.escape,
        UIKeyInputLeftArrow: KeyNames.left,
        UIKeyInputRightArrow: KeyNames.right,
        UIKeyInputUpArrow: KeyNames.up,
        UIKeyInputDownArrow: KeyNames.down,
        UIKeyInputSpace: KeyNames.space
    ]
    
    override func respond(to key: String) {
        self.say(self.keys[key] ?? key)
    }
}
