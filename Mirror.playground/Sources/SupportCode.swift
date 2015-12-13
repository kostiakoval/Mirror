//
//  Helpers.swift
//  Mirror
//
//  Created by Ivan Trubach on 12/12/15.
//
//

import Swift

func findFirst<S : SequenceType> (s: S, condition: (S.Generator.Element) -> Bool) -> S.Generator.Element? {
    for value in s where condition(value) {
        return value
    }

    return nil
}
