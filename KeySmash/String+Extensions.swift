//
//  String+Extensions.swift
//  KeySmash
//
//  Created by trimm on 1/21/17.
//  Copyright © 2017 Piikea Street. All rights reserved.
//

import Foundation

extension String {
    func characterStrings() -> [String] {
        return self.characters.map { String($0) }
    }
}
