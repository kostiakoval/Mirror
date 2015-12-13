////
////  Mirror.swift
////  Mirror
////
////  Created by Ivan Trubach on 12/12/15.
////
////
//
//import Swift
//import Foundation
//
//// MARK: Type Info
//public extension Mirror {
//    
//    /// Full name of instance's type.
//    /// With module name.
//    public var name: String {
//        return "\(self.subjectType)"
//    }
//    
//    /// Short name of instance's type.
//    /// Without a module name.
//    public var shortName: String {
//        return self.name._pathExtension
//    }
//    
//    public var isClass: Bool {
//        return self.displayStyle == .Some(.Class)
//    }
//    
//    /// Returns `true` iff mirrored instance is `struct`.
//    public var isStruct: Bool {
//        return self.displayStyle == .Some(.Struct)
//    }
//    
//    /// Count of child properties.
//    public var childrenCount: AnyForwardIndex {
//        return self.children.endIndex
//    }
//}
//
//// MARK: - Children Inpection
//public extension Mirror {
//    /// Properties Names
//    public var names: [String?] {
//        return self.map { $0.label }
//    }
//    
//    /// Properties Values
//    public var values: [Any] {
//        return self.map { $0.value }
//    }
//    
//    /// Properties Types
//    public var types: [Any.Type] {
//        return self.map { $0.value.dynamicType }
//    }
//    
//    /// Short style for type names
//    public var typesShortName: [String] {
//        return self.map { "\($0.value.dynamicType)"._pathExtension }
//    }
//}
//
//// MARK: - Quering
//public extension Mirror {
//    /// Returns a property value for a property name
//    public subscript (key: String) -> Any? {
//        let res = findFirst(self) { $0.label == key }
//        return res.map { $0.value }
//    }
//    
//    /// Returns a value for a property name with a generic type.
//    public func get<U>(forKey: String) -> U? {
//        let res = findFirst(self) { $0.label == forKey }
//        return res.flatMap { $0.value as? U }
//    }
//    
//    /// Convert to a dicitonary with [PropertyName : PropertyValue] notation.
//    public var toDictionary: [String : Any] {
//        var result: [String : Any] = [ : ]
//        for item in self {
//            guard let name = item.label else { continue }
//            result[name] = item.value
//        }
//        
//        return result
//    }
//    
//    // Unsafe, let the user do this work (convert `self.toDictionary` to `NSDictionary`)
//    
//    //    /// Convert to NSDictionary.
//    //    /// Useful for saving it to Plist
//    //    public var toNSDictionary: NSDictionary {
//    //        var result: [String : AnyObject] = [ : ]
//    //        for item in self {
//    //            result[item.name] = item.value as? AnyObject
//    //        }
//    //
//    //        return result
//    //    }
//}
//
//extension Mirror : CollectionType, SequenceType, Indexable {
//    public func generate() -> AnyGenerator<Mirror.Child> {
//        return self.children.generate()
//    }
//    
//    public var startIndex: AnyForwardIndex {
//        return self.children.startIndex
//    }
//    
//    public var endIndex: AnyForwardIndex {
//        return self.children.endIndex
//    }
//    
//    /// Get child property at `position` index.
//    public subscript(position: AnyForwardIndex) -> Mirror.Child {
//        return self.children[AnyForwardIndex(position)]
//    }
//}
//
//
//internal extension String {
//    /// Path extension of string.
//    ///
//    /// - Remark: Replacement for deprecated `pathExtension` method.
//    internal var _pathExtension: String {
//        return self.componentsSeparatedByString(".").last!
//    }
//}