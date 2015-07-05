//
//  File.swift
//  Mirror
//
//  Created by Kostiantyn Koval on 05/07/15.
//
//

import Foundation

public struct Mirror<T> {
  public typealias MirrorItem = (key: String, data: MirrorType)

  private let mirror: MirrorType
  private var instance: T
  
  public init (_ x: T) {
    instance = x
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
