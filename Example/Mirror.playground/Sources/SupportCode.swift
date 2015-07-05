//
// This file (and all other Swift source files in the Sources directory of this playground) will be precompiled into a framework which is automatically made available to Mirror.playground.
//

//
//  File.swift
//  Mirror
//
//  Created by Kostiantyn Koval on 05/07/15.
//
//

import Foundation

func findFirst<S : SequenceType> (s: S, condition: (S.Generator.Element) -> Bool) -> S.Generator.Element? {
  
  for value in s {
    if condition(value) {
      return value
    }
  }
  return nil
}

public struct Mirror<T> {
  public typealias MirrorItem = (key: String, data: MirrorType)
  private let mirror: MirrorType
  
  public init (_ x: T) {
    mirror = reflect(x)
  }
  
  //MARK: -
  public var names: [String] {
    return map(self) { $0.key }
  }
  
  public var values: [Any] {
    return map(self) { $0.data.value }
  }
  
  public var children: [MirrorItem] {
    return map(self) { $0 }
  }
  
  //MARK: -
  public subscript (key: String) -> Any? {
    let res = findFirst(self) { $0.key == key }
    return res.map { $0.data.value }
  }
  
  public func get<U>(key: String) -> U? {
    let res = findFirst(self) { $0.key == key }
    return res.flatMap { $0.data.value as? U }
  }
  
  //MARK: -
  public var toDictionary: [String : Any] {
    
    var result: [String : Any] = [ : ]
    for (key, value) in self {
      result[key] = value.value
    }
    
    return result
  }
  
  public var toNSDictionary: NSDictionary {
    
    var result: [String : AnyObject] = [ : ]
    for (key, value) in self {
      result[key] = value.value as? AnyObject
    }
    
    return result
  }
  
  
  
  
  //  func value(instance: T, key: String) -> Any? {
  //    var result: Any? = nil
  //
  //    iterate { childKey, childVal in
  //      if childKey == key {
  //        result = childVal.value
  //      }
  //      return
  //    }
  //    return result
  //  }
  
  
  func setValue<U>(instance: T, value: U) {
    
    //    iterate { childKey, childMirror in
    //      if childKey == key {
    //        return childMirror.value
    //      }
    //    }
    //    return nil
  }
  
  /*
  
  static func fromDictionary<T : Encodable>(instance: NSDictionary) -> T {
  let result = T()
  for (key, val) in instance {
  //      result <-- instance[key]
  }
  
  return result
  }
  */
}

extension Mirror : CollectionType, SequenceType {
  
  public func generate() -> IndexingGenerator<[MirrorItem]> {
    return children.generate()
  }
  
  public var startIndex: Int {
    return 0
  }
  
  public var endIndex: Int {
    return mirror.count
  }
  
  public subscript (i: Int) -> MirrorItem {
    return mirror[i]
  }
  
}

infix operator --> {}

func --> <T>(instance: T, key: String) -> Any? {
  let mirror = reflect(instance)
  
  for index in 0 ..< mirror.count {
    let (childKey, childMirror) = mirror[index]
    if childKey == key {
      return childMirror.value
    }
  }
  
  return nil
}
