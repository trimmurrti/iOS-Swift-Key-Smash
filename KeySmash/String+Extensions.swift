//
//  String+Extensions.swift
//  KeySmash
//
//  Created by trimm on 1/21/17.
//  Copyright © 2017 Piikea Street. All rights reserved.
//

extension String {
    static func letters() -> [String] {
        return self.characterStrings(from: "a", through: "z")
    }
    
    static func capitalLetters() -> [String] {
        return self.letters().map { $0.uppercased() }
    }
    
    static func digits() -> [String] {
        return (0...9).map { String($0) }
    }
    
    /// Construct an array of character strings between lhs and rhs
    ///
    /// @param lhs  Starting character
    /// @param rhs  Closing character
    static func characterStrings(from lhs: Character, through rhs: Character) -> [String] {
        let bounds = [lhs, rhs].flatMap { String($0).utf16.first }
        
        return bounds.toTuple().map { lhs, rhs in
                stride(from: lhs, through: rhs, by: lhs == min(lhs, rhs) ? 1 : -1)
                    .flatMap { UnicodeScalar($0) }
                    .map { String($0) }
            }
            ?? []
    }
    
    func characterStrings() -> [String] {
        return self.characters.map { String($0) }
    }
}
