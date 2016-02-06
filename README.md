# Mirror

[![CI Status](http://img.shields.io/travis/kostiakoval/Mirror.svg?style=flat)](https://travis-ci.org/kostiakoval/Mirror)
[![Version](https://img.shields.io/cocoapods/v/Mirror.svg?style=flat)](http://cocoapods.org/pods/Mirror)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/Mirror.svg?style=flat)](http://cocoapods.org/pods/Mirror)
[![Platform](https://img.shields.io/cocoapods/p/Mirror.svg?style=flat)](http://cocoapods.org/pods/Mirror)

**Mirror** - Swift objects Reflection API. It's 100% Swift, no Objc runtime.  
It's possible to do reflection of Swift object. And it doesn’t need to be hard.

## Features
- [x] 100% Pure Swift implementation.
- [x] Does not reimplement any existing Swift types. Extensions only.
- [x] Easy to use.
- [x] Powerful.
- [ ] Even more Powerful. (Coming soon)

## Usage
If you want to try it, there is a demo Playground available, just run 

```
pod try Mirror
```

### Create a mirror for an instance

```swift
struct Person {
    var name: String
    var age:  Int
}

let person = Person(name: "Jon", age: 27)
let mirror = Mirror(reflecting: person)
```

### Inspect it

```swift
// Get information about the type of an instance

mirror.subjectTypeLabel
// "Person"

mirror.displayStyle == .Some(.Class)
// false

mirror.displayStyle == .Some(.Struct)
// true
```

### Type Properties Inspection  
Get information about content of the type, its properties

```swift
mirror.labels
// ["name", "age"]

mirror.values
// ["Jon", 27]

mirror.types
// [Swift.String.Type, Swift.Int.Type]

mirror["name"] // "Jon"
mirror["age"]  // 27

Dictionary<String, Any>(mirror: mirror)
// ["age": 27, "name": "Jon"]
```

### Mirror's `children` property is a `CollectionType`
All the CollectionType methods are available for use with the `mirror.children`.
Iterating, count, map, filter and other.

```swift
// Iterate over its `Mirror.Child` children
for child in mirror.children {
    print(child)
}

// (Optional("name"), "Jon")
// (Optional("age"), 27)

let index = AnyForwardIndex(0)

let children = mirror.children // AnyForwardCollection of Mirror.Child
let firstKid = children[index]
// (label: Optional("name"), value: "Jon")

let mirP = mirror.children[index.successor()]
mirP.label               // Optional("age")
mirP.value               // 27
mirP.value.dynamicType   // Swift.Int.Type
```

## Installation
###[CocoaPods](http://cocoapods.org)

To install it, simply add the following line to your Podfile:

```ruby
use_frameworks!
pod "Mirror"
```

###[Carthage](https://github.com/Carthage/Carthage)

To integrate Mirror into your Xcode project using Carthage, specify it in your Cartfile:

```
github "kostiakoval/Mirror"
```

## Author

Kostiantyn Koval, konstantin.koval1@gmail.com

## License

Mirror is available under the MIT license. See the LICENSE file for more info.
