# Mirror

[![CI Status](http://img.shields.io/travis/kostiakoval/Mirror.svg?style=flat)](https://travis-ci.org/kostiakoval/Mirror)
[![Version](https://img.shields.io/cocoapods/v/Mirror.svg?style=flat)](http://cocoapods.org/pods/Mirror)
[![License](https://img.shields.io/cocoapods/l/Mirror.svg?style=flat)](http://cocoapods.org/pods/Mirror)
[![Platform](https://img.shields.io/cocoapods/p/Mirror.svg?style=flat)](http://cocoapods.org/pods/Mirror)

100% Swift objects Reflection API

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.  
Create a mirror for an instance   

```swift
struct Person {
  let name: String
  var age: Int
}

var person = Person(name: "Jon", age: 27)
let mirror = Mirror(person)
```

Inspect it  

```swift
mirror.names  
//["name", "age"]
```

```swift
mirror.values
//["Jon", 27]
```

```swift 
mirror["name"] // "Jon"
mirror["age"]  // 27
```

```swift 
mirror.toDictionary
//["age": 27, "name": "Jon"]
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
