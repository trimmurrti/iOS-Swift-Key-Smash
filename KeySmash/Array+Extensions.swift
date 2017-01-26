//
//  Array+Extensions.swift
//  KeySmash
//
//  Created by Oleksa 'trimm' Korin on 1/26/17.
//  Copyright © 2017 Piikea Street. All rights reserved.
//

extension Array {
    public func toTuple() -> (Element, Element)? {
        if self.count != 2 {
            return nil
        }
        
        return (self[0], self[1])
    }
}

extension Array where Element: Comparable {
    public func minmax() -> (Element, Element)? {
        return lift((self.min(), self.max()))
    }
}
