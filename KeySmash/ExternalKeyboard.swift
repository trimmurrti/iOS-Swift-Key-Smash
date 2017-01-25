import Foundation
import UIKit

func externalKeyboardKeys(_ callback: Selector) -> [UIKeyCommand] {
    // order matters.  ! needs priority over shift-1, @ over shift-2, etc
    let characters = "!@#$%^&*()~`_+{}|:\"<>?".characterStrings()
        + String.letters()
        + String.capitalLetters()
        + String.digits()
        + "-=[]\\;',./ ".characterStrings()
    
    let flags: [UIKeyModifierFlags] = [
        [],
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
    
    typealias Pair = (keys: [String], flags: [UIKeyModifierFlags])
    let pairs: [Pair] = [
        (keys, []),
        (characters, flags)
    ]
    
    return pairs.reduce([UIKeyCommand]()) { result, pair in
        result + pair.flags.flatMap { flag in
            pair.keys.map { UIKeyCommand(input: $0, modifierFlags: flag, action: callback) }
        }
    }
}

