//
//  Optional+Extensions.swift
//  KeySmash
//
//  Created by trimm on 1/21/17.
//  Copyright © 2017 Piikea Street. All rights reserved.
//

extension Optional {
    func dispatch(work: (Wrapped) -> ()) {
        self.map(work)
    }
}
