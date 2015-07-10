//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct P {
  let a: Int
  let b: String
}

let m = reflect(P(a: 0, b: ""))
m.count


struct Person {
  let name: String
  var age: Int
}

var person = Person(name: "Jon", age: 27)
let mirror = Mirror(person)

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

// Iterate over it's children MirrorItems
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


/// Enum

enum Animals: String {
  case Cat = "C"
  case Dog = "D"
}

let cat = Animals.Cat

let mm = Mirror(cat)
mm.names
mm.values

let rf = reflect(cat)
rf.count
rf.disposition
rf.value
