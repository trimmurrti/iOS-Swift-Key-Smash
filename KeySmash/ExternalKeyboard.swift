import Foundation
import UIKit

typealias KeyCommands = [UIKeyCommand]

func externalKeyboardKeys(_ callback:Selector) -> KeyCommands {
    let noModifiers = UIKeyModifierFlags(rawValue: 0)
    
    func mapper(keys: [String], modifiers: [UIKeyModifierFlags]) -> KeyCommands {
        return modifiers.flatMap { m in keys.map {
            UIKeyCommand(input: $0, modifierFlags: m, action: callback) }
        }
    }

    // order matters.  ! needs priority over shift-1, @ over shift-2, etc
    let characters = "!@#$%^&*()~`_+{}|:\"<>?abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-=[]\\;',./ "
        .characterStrings()
    
    let modifiers = [
        noModifiers,
        .alphaShift,
        .shift,
        [.alphaShift, .shift],
        .command,
        .control,
        .alternate,
        [.command, .control],
        [.command, .alternate],
        [.command, .control, .alternate],
        [.control, .alternate]
    ]

    let keys = [UIKeyInputEscape, UIKeyInputUpArrow, UIKeyInputDownArrow, UIKeyInputLeftArrow, UIKeyInputRightArrow]
    
    return [(keys, [noModifiers]), (characters, modifiers)].reduce(KeyCommands()) {
        $0 + mapper(keys: $1.0, modifiers: $1.1)
    }
}

