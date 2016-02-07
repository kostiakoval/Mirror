
struct Person {
  let name: String
  var age: Int
}

var person = Person(name: "Jon", age: 27)
let mirror = Mirror(reflecting: person)

mirror.children.count
let child = mirror.children.first

child?.label
child?.value

mirror.displayStyle
mirror.subjectType

let m = mirror.customMirror()
m.children

let ar = [1,2,3]

let arF = AnyForwardCollection(ar)
