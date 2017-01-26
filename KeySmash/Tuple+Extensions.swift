//
//  Tuple+Extensions.swift
//  KeySmash
//
//  Created by Oleksa 'trimm' Korin on 1/26/17.
//  Copyright © 2017 Piikea Street. All rights reserved.
//

public func lift<A, B>(_ tuple: (A?, B?)) -> (A, B)? {
    return tuple.0.flatMap { lhs in
        tuple.1.flatMap { (lhs, $0) }
    }
}
