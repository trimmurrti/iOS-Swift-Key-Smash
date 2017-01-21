import Foundation
import UIKit
import AVFoundation

class SayPressedKey: Mode {
    override func start()  {
        self.say("Press any Key")
    }
    
    override func respond(to key: String) {
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
}
