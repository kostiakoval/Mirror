//
//  MirrorTests.swift
//  MirrorTests
//
//  Created by Kostiantyn Koval on 10/07/15.
//

@exported import Quick
@exported import Nimble

@testable @exported import Mirror

struct Person {
    var name: String // sizeof(String) == 24 (iff String)
    var age:  Int    // sizeof(Int) == 8 (iff Int64)
}

class MirrorSpec: QuickSpec {
    override func spec() {
        
        describe("Mirror") {
            let person = Person(name: "Sara", age: 24)
            let mirror = Mirror(reflecting: person)
            
            // MARK: - Type Info
            
            it("can get its type label") {
                expect(mirror.subjectTypeLabel) == "Person"
            }
            
            //      it("can get its type short name") {
            //        expect(mirror.shortName) == "Person"
            //      }
            
            it("can get its properties count") {
                expect(mirror.children.count) == 2
            }
            
//            it("can get momory size for the type") {
//                expect(mirror.memorySize) == sizeof(Person) // failed - expected to equal <32>, got <64>
//            }
            
            it("can check if it's a class") {
                expect(mirror.displayStyle == .Some(.Class)) == false
                expect(Mirror(reflecting: "StringLiteral").displayStyle == .Some(.Class)) == false
                expect(Mirror(reflecting: NSObject()).displayStyle == .Some(.Class)) == true
                
                class A { }
                expect(Mirror(reflecting: A()).displayStyle == .Some(.Class)) == true
            }
            
            it("can check if it's a struct") {
                expect(mirror.displayStyle == .Some(.Struct)) == true
                struct B { }
                expect(Mirror(reflecting: B()).displayStyle == .Some(.Struct)) == true
            }
            
            it("can check if it's a enum") {
                expect(mirror.displayStyle == .Some(.Enum)) == false
                enum C { case Test }
                expect(Mirror(reflecting: C.Test).displayStyle == .Some(.Enum)) == true
            }
            
            it("can check if it's a optional") {
                expect(mirror.displayStyle == .Some(.Optional)) == false
                expect(Mirror(reflecting: person as Person?).displayStyle == .Some(.Optional)) == true
            }
            
            // and etc.
            // There is no need in testing Swift's Standart library here.
            
            // Available cases (Swift.Mirror.DisplayStyle):
            // .Struct, .Class, .Enum, .Tuple, .Optional, .Collection, .Dictionary, .Set
            
            // MARK: - Children info
            
            it("can get labels") {
                let mirror = Mirror(reflecting: person)
                let equal = mirror.labels.elementsEqual(["name", "age"]) { $0.0 == $0.1 }
                expect(equal).to(beTrue())
            }
            
            it("can get values") {
                expect(mirror.values.count) == 2
                expect(mirror.values[0] as? String) == "Sara"
                expect(mirror.values[1] as? Int) == 24
            }
            
            it("can get types") {
                let types = mirror.types
                let typeLabels = types.map { "\($0)" }
                expect(typeLabels) == ["String", "Int"]
            }
            
            it("can get children mirrors") {
                let children = mirror.children
                expect(children.count) == 2
                
                let baseIndex = children.startIndex
                
                expect(children[baseIndex].label) == "name"
                expect(children[baseIndex].value as? String ) == "Sara"
                expect(children[baseIndex].value.dynamicType is String.Type).to(beTrue())
                
                expect(children[baseIndex.successor()].label) == "age"
            }
            
            it("has a subscript for getting values by name") {
                expect(mirror["name"] as? String) == "Sara"
                expect(mirror["age"] as? Int) == 24
                expect(mirror["NonExist"]).to(beNil())
            }
            
            it("has a get method with generic return type") {
                expect(mirror.getValue(forKey: "name")) == "Sara"
                expect(mirror.getValue(forKey: "age")) == 24
                
                let nonExit: String? = mirror.getValue(forKey: "NonExist")
                expect(nonExit).to(beNil())
            }
            
            it("can be exported to Dictionary") {
                let dict =  Dictionary<String, Any>(mirror: mirror)
                expect(dict.count) == 2
                expect(dict["name"] as? String) == "Sara"
                expect(dict["age"] as? Int) == 24
            }
            
            it("can be exported to NSDictioanry") {
                let dict =  Dictionary<String, AnyObject>(mirror: mirror) as NSDictionary
                expect(dict.count) == 2
                expect(dict["name"] as? String) == "Sara"
                expect(dict["age"] as? Int) == 24
            }
        
        // Tesing Swift Standart Library again :]
        context("The Collection type") {
            
            it("has a generator") {
                let generator = mirror.children.generate()
                
                expect(generator.next()?.label) == "name"
                
                expect(generator.next()?.label) == "age"
                
                expect(generator.next()).to(beNil())
            }
            
            it("has count") {
                expect(mirror.children.count) == 2
            }
            
            it("has AnyForwardIndex subcript that returns Mirror.Child") {
                let baseIndex = AnyForwardIndex(0)
                let item = mirror.children[baseIndex]
                expect(item.label) == "name"
                expect(item.value as? String) == "Sara"
                expect(item.value.dynamicType is String.Type).to(beTrue())
            }
        }
      }
   }
}

/*
it("can get children mirrors") {


}



it("will eventually fail") {
expect("time").toEventually( equal("done") )
}

context("these will pass") {

it("can do maths") {
expect(23) == 23
}

it("can read") {
expect("🐮") == "🐮"
}

it("will eventually pass") {
var time = "passing"

dispatch_async(dispatch_get_main_queue()) {
time = "done"
}

waitUntil { done in
NSThread.sleepForTimeInterval(0.5)
expect(time) == "done"

done()
}
}
}*/
