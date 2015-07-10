# Mirror

[![CI Status](http://img.shields.io/travis/kostiakoval/Mirror.svg?style=flat)](https://travis-ci.org/kostiakoval/Mirror)
[![Version](https://img.shields.io/cocoapods/v/Mirror.svg?style=flat)](http://cocoapods.org/pods/Mirror)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/Mirror.svg?style=flat)](http://cocoapods.org/pods/Mirror)
[![Platform](https://img.shields.io/cocoapods/p/Mirror.svg?style=flat)](http://cocoapods.org/pods/Mirror)

**Mirror** - Swift objects Reflection API. It's 100% Swift, no Objc runtime.  
It's possible to do reflection of Swift object. And it doesn’t need to be hard.

##Features
- [x] 100% Pure Swift implementation
- [x] Easy to use
- [x] Powerful
- [ ] Even more Powerful (Coming soon)

## Usage
If you want to try it, there is a demo Playground available, just run 

```
pod try Mirror
```

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

```swift
// Its properties names  
mirror.names  
//["name", "age"]

// Its properties values  
mirror.values
//["Jon", 27]

//Its properties types  
mirror.types
//[Swift.String, Swift.Int]

Type properties types short notation, skip bundle  
mirror.typesShortName
//["String", "Int"]

//Get property values by name  
mirror["name"] // "Jon"
mirror["age"]  // 27

//Convert to dictionary with [PropertyName : PropertyValues]  
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
