![Mirror](https://raw.githubusercontent.com/kostiakoval/Mirror/master/Image/logo.png)


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
//Get information about the type of an instance

mirror.name
//"MirrorTest.Person"

mirror.shortName
//Person

mirror.memorySize
// 32

mirror.isClass
//false

mirror.isStruct
//true
```

### Type Properties Inspection  
Get information about content of the type, its properties

```swift
mirror.names
//["name", "age"]

mirror.values
//["Jon", 27]

mirror.types
//[Swift.String, Swift.Int]

mirror.typesShortName
//["String", "Int"]

mirror["name"] //"Jon"
mirror["age"]  //27

mirror.toDictionary
//["age": 27, "name": "Jon"]
```

### Mirror is a CollectionType  
All the CollectionType methods are available for use with mirror  
Iterating, count, map, filter and other  

```swift
// Iterate over its children MirrorItems
for item in mirror {
  println(item)
}
//name: Swift.String = Jon
//age: Swift.Int = 27

let children = mirror.children //Array of MirrorItem
let firstKid = children[0]
//{name: "name", type: Swift.String, value: "Jon" }

var mirP = mirror[1]
mirP.name   // "age"
mirP.value  // 27
mirP.type   // Swift.Int
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

## Contribute

Please open an issue with bugs and missing features, functionality or ideas for improvements.  
Also you can contribute by following this guidelines:

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create pull request

## Author

Kostiantyn Koval, konstantin.koval1@gmail.com

## License

Mirror is available under the MIT license. See the LICENSE file for more info.
