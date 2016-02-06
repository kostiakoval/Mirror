//: Playground - noun: a place where people can play
import Mirror

struct Person {
  let name: String
  var age: Int
}

var person = Person(name: "Jon", age: 27)
let mirror = Mirror(reflecting: person)

//: ## Type inspection
//: Get information about the type of an instance

mirror.name
//"__lldb_expr_69.Person"

mirror.shortName
//Person

mirror.memorySize
// 32

mirror.isClass
//false

mirror.isStruct
//true

//: ## Type Properties Inpection
//: Get information about content of the type, its properties

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

//: ## Mirror is a CollectionType
//: All the CollectionType  methods are available for use with mirror  
//: Iterating, count, map, filter and other

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
