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
  var p: P
}

var person = Person(name: "Jon", age: 27, p: P(a: 0, b: ""))
let mirror = Mirror(person)

mirror.names
mirror.values

mirror["name"]
mirror["age"]

mirror.toDictionary

for item in mirror {
  print(item)
}

var mirP = mirror[2]
mirP.name
mirP.value
mirP.type
//

dump(person, name: "Person", indent: 0, maxDepth: 10, maxItems: 40)
