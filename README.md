# Mirror

[![CI Status](http://img.shields.io/travis/kostiakoval/Mirror.svg?style=flat)](https://travis-ci.org/kostiakoval/Mirror)
[![Version](https://img.shields.io/cocoapods/v/Mirror.svg?style=flat)](http://cocoapods.org/pods/Mirror)
[![License](https://img.shields.io/cocoapods/l/Mirror.svg?style=flat)](http://cocoapods.org/pods/Mirror)
[![Platform](https://img.shields.io/cocoapods/p/Mirror.svg?style=flat)](http://cocoapods.org/pods/Mirror)

Swift objects Reflection API - 100%, no Objc runtime

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.  

###Create a mirror for an instance   

```swift
struct Person {
  let name: String
  var age: Int
}

var person = Person(name: "Jon", age: 27)
let mirror = Mirror(person)
```

### Inspect it  

Type properties names  
```swift
mirror.names  
//["name", "age"]
```

Type properties values  
```swift
mirror.values
//["Jon", 27]
```

Type properties types  
```swift
mirror.types
//[Swift.String, Swift.Int]
```

Type properties types short notation, skip bundle  
```swift
mirror.typesShortName
//["String", "Int"]
```

Get property values by name  
```swift 
mirror["name"] // "Jon"
mirror["age"]  // 27
```
Convert to dictionary with [PropertyName : PropertyValues]  
```swift 
mirror.toDictionary
//["age": 27, "name": "Jon"]
```

**Mirror implements CollectionType, SequenceType.**  

Iterate over it's children MirrorItems  
```Swift
for item in mirror {
  println(item)
}
//name: Swift.String = Jon
//age: Swift.Int = 27
```

Get children MirrorItems 
```swift
let children = mirror.children //Array of MirrorItem
let firstKid = children[0]
//{name: "name", type: Swift.String, value: "Jon" }
```

## Requirements
- Swift 1.2

## Installation

Mirror is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Mirror"
```

## Author

Kostiantyn Koval, konstantin.koval1@gmail.com

## License

Mirror is available under the MIT license. See the LICENSE file for more info.
