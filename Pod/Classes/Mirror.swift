//
//  File.swift
//  Mirror
//
//  Created by Kostiantyn Koval on 05/07/15.
//
//

import Foundation

public struct MirrorItem {
  public let name: String
  public let type: Any.Type
  public let value: Any
  
  init(_ tup: (String, MirrorType)) {
    self.name = tup.0
    self.type = tup.1.valueType
    self.value = tup.1.value
  }
}

extension MirrorItem : Printable {
  public var description: String {
    return "\(name): \(type) = \(value)"
  }
}

//MARK: -

public struct Mirror<T> {

  private let mirror: MirrorType
  private let instance: T
  
  public init (_ x: T) {
    instance = x
    mirror = reflect(x)
  }
  
//MARK: -

  /// Properties Names
  public var names: [String] {
    return map(self) { $0.name }
  }

  /// Properties Values
  public var values: [Any] {
    return map(self) { $0.value }
  }

  /// Properties Types
  public var types: [Any.Type] {
    return map(self) { $0.type }
  }
  
  /// short style for type names
  public var typesShortName: [String] {
    return map(self) { "\($0.type)".pathExtension }
  }


  /// Mirror types for every children property
  public var children: [MirrorItem] {
    return map(self) { $0 }
  }
  
//MARK: -
  public subscript (key: String) -> Any? {
    let res = findFirst(self) { $0.name == key }
    return res.map { $0.value }
  }

  public func get<U>(key: String) -> U? {
    let res = findFirst(self) { $0.name == key }
    return res.flatMap { $0.value as? U }
  }
  
//MARK: -
  public var toDictionary: [String : Any] {
    
    var result: [String : Any] = [ : ]
    for item in self {
      result[item.name] = item.value
    }
    
    return result
  }
  
  public var toNSDictionary: NSDictionary {
    
    var result: [String : AnyObject] = [ : ]
    for item in self {
      result[item.name] = item.value as? AnyObject
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
    return MirrorItem(mirror[i])
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
