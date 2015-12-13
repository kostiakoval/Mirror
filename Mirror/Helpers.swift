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
