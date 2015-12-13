//
//  Helpers.swift
//  Mirror
//
//  Created by Kostiantyn Koval on 05/07/15.
//
//

import Swift

internal func findFirst<S : SequenceType> (s: S, condition: (S.Generator.Element) -> Bool) -> S.Generator.Element? {
    for value in s where condition(value) {
        return value
    }
    
    return nil
}

public extension Dictionary where Key: StringLiteralConvertible {
    /// Initialize from mirror with [PropertyName : PropertyValue] notation.
    public init(mirror: Mirror) {
        self = [:] // self.init()
        for item in mirror.children {
            guard let label = item.label as? Key,
                value = item.value as? Value else { continue }
            
            self[label] = value
        }
    }
}
