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

extension MirrorItem : CustomStringConvertible {
  public var description: String {
    return "\(name): \(type) = \(value)"
  }
}

// MARK: -

public struct Mirror<T> {
  private let mirror: MirrorType
  let instance: T
  
  public init (_ x: T) {
    instance = x
    mirror = reflect(x)
  }

// MARK: - Type Info
  
  /// Instance type full name, include Module.
  public var name: String {
    return "\(instance.dynamicType)"
  }

  /// Instance type short name, just a type name, without Module.
  public var shortName: String {
    return "\(instance.dynamicType)".pathExtension
  }
  
  public var isClass: Bool {
    return mirror.objectIdentifier != nil
  }
  
  public var isStruct: Bool {
    return mirror.objectIdentifier == nil
  }

  /// Type properties count.
  public var childrenCount: Int {
    return mirror.count
  }
  
  public var memorySize: Int {
    return sizeofValue(instance)
  }
  
// MARK: - Children Inpection

  /// Properties Names.
  public var names: [String] {
    return map { $0.name }
  }

  /// Properties Values.
  public var values: [Any] {
    return map { $0.value }
  }

  /// Properties Types.
  public var types: [Any.Type] {
    return map { $0.type }
  }
  
  /// Short style for type names.
  public var typesShortName: [String] {
    return map { "\($0.type)".pathExtension }
  }

  /// Mirror types for every children property.
  public var children: [MirrorItem] {
    return map { $0 }
  }
  
// MARK: - Quering
  
  /// Returns a property value for a property name.
  public subscript(key: String) -> Any? {
    let res = findFirst(self) { $0.name == key }
    return res.map { $0.value }
  }

  /// Returns a property value for a property name with a Generic type.
  /// No casting needed.
  public func get<U>(key: String) -> U? {
    let res = findFirst(self) { $0.name == key }
    return res.flatMap { $0.value as? U }
  }
  
  /// Convert to a dicitonary with [PropertyName : PropertyValue] notation.
  public var toDictionary: [String : Any] {
    var result: [String : Any] = [ : ]
    
    for item in self {
      result[item.name] = item.value
    }
    
    return result
  }
  
  /// Convert to `NSDictionary`.
  /// Useful for saving it to Plist.
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
