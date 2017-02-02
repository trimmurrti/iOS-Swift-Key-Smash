import UIKit

let UIKeyInputSpace  = " "

struct KeyNames {
    static let escape   = "escape"
    static let left     = "left"
    static let right    = "right"
    static let up       = "up"
    static let down     = "down"
    static let space    = "space"
    static let enter    = "enter"
}

struct KeyboardCharacters {
    // order matters.  ! needs priority over shift-1, @ over shift-2, etc
    static let prioritySpecial    = "!@#$%^&*()~`_+{}|:\"<>?".characterStrings()
    static let letters            = String.letters()
    static let capitalLetters     = String.capitalLetters()
    static let numbers            = String.digits()
    static let special            = "-=[]\\;',./ ".characterStrings()
    static let all                = KeyboardCharacters.allCharacters()
    
    private static func allCharacters() -> [String] {
        return self.prioritySpecial
            + self.letters
            + self.capitalLetters
            + self.numbers
            + self.special
    }
}

func keyboardKeyCommands(with callback: Selector) -> [UIKeyCommand] {
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
        (KeyboardCharacters.all, flags),
        (keys, []),
    ]
    
    return pairs.reduce([UIKeyCommand]()) { result, pair in
        result + pair.flags.flatMap { flag in
            pair.keys.map { UIKeyCommand(input: $0, modifierFlags: flag, action: callback) }
        }

    }
}

