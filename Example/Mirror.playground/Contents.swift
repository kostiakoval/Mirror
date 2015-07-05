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
mirror.values

mirror["name"]
mirror["age"]


