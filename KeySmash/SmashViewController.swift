import UIKit
import Foundation
import AVFoundation
import IDPCastable

class SmashViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var textField: UITextField!

    let modes: [Modeable] = [SayPressedKey(), HuntForKey(), OrderedAlphabet(), Counting()]
    var currentModeIndex = 0
    var currentMode: Modeable { return self.modes[self.currentModeIndex] }
    let keyCommandCache = externalKeyboardKeys(#selector(SmashViewController.sayKey(_:)))

    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.becomeFirstResponder()    // focus on textField brings up the keyboard
        self.textField.delegate = self
        
        self.currentMode.start()
    }
    
    override var keyCommands: [UIKeyCommand]? {
        get { return self.keyCommandCache }
    }
    
    func sayKey(_ command:UIKeyCommand) {
        if (cast(command.input) == UIKeyInputRightArrow) {
            self.nextMode()
        } else {
            self.currentMode.respond(to: command.input)
        }
    }
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String)
        -> Bool
    {
        self.currentMode.respond(to: string)
        
        return false; // don't actually change the textfield
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.currentMode.respond(to: "enter")
        
        return false //ignore enter
    }
    
    func nextMode() {
        self.currentModeIndex += 1
        if (self.currentModeIndex > self.modes.count - 1) {
            self.currentModeIndex = 0
        }
        
        self.currentMode.start()
    }
}

