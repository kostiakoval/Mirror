//
//  Mirror.swift
//  Mirror
//
//  Created by Ivan Trubach on 12/12/15.
//
//

import Swift

// MARK: Type Info

public extension Mirror {
    /// Label of instance's type.
    public var subjectTypeLabel: String {
        return "\(self.subjectType)"
    }
}

// MARK: - Children Inpection

public extension Mirror {
    /// Labels of properties.
    public var labels: [String?] {
        return self.children.map { $0.label }
    }
    
    /// Values of properties.
    public var values: [Any] {
        return self.children.map { $0.value }
    }
    
    /// Types of properties.
    public var types: [Any.Type] {
        return self.children.map { $0.value.dynamicType }
    }
    
// FIXME: Invalid `sizeof` return value?
// In tests applying `sizeofValue` to each value returned 32x2 (64).
    
//    /// Size of value in memory.
//    ///
//    /// - Remark: Try using `sizeof()` or `sizeofValue()` 
//    ///           on mirrored values or type insted.
//    ///
//    /// - Complexity: `O(n)`, where `n`
//    ///               is a number of properties.
//    public var memorySize: Int {
//        return self.children.reduce(0) { $0 + sizeofValue($1.value) }
//    }
}

// MARK: - Quering

public extension Mirror {
    /// Returns a property value for a property name.
    public subscript(key: String) -> Any? {
        let res = findFirst(self.children) { $0.label == key }
        return res.map { $0.value }
    }
    
    /// Returns a value for a property name with a generic type.
    public func getValue<U>(forKey key: String) -> U? {
        let res = findFirst(self.children) { $0.label == key }
        return res.flatMap { $0.value as? U }
    }
}

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
//        return self.children[position]
//    }
//}
