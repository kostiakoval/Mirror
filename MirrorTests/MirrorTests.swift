//
//  MirrorTests.swift
//  MirrorTests
//
//  Created by Kostiantyn Koval on 10/07/15.
//  Copyright (c) 2015 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Mirror

struct Person {
  let name: String
  var age: Int
  
  func printMe() {
    print("Me", appendNewline: false)
  }
}

class MirrorSpec: QuickSpec {
  override func spec() {
    
    describe("Mirror") {
      let person = Person(name: "Sara", age: 24)
      let mirror = Mirror(person)
      
//MARK: - Type Info
      
      it("can get its type name") {
        expect(mirror.name) == "MirrorTests.Person"
      }
      
      it("can get its type short name") {
        expect(mirror.shortName) == "Person"
      }
      
      it("can get its properties count") {
        expect(mirror.childrenCount) == 2
      }
      
      it("can get momory size for the type") {
        expect(mirror.memorySize) == 32 // sizeof(String) + sizeof(Int)
      }
      
      it("can check if it's a class") {
        expect(mirror.isClass) == false
        expect(Mirror("String").isClass) == false
        expect(Mirror(NSObject()).isClass) == true

        class A { }
        expect(Mirror(A()).isClass) == true
      }
      
      it("can check if it's a struct ") {
        expect(mirror.isStruct) == true
        struct B { }
        expect(Mirror(B()).isStruct) == true
      }
      
//MARK: - Children info
      
      it("can get names") {
        let mirror = Mirror(person)
        expect(mirror.names) == ["name", "age"]
      }
      
      it("can get values") {
        expect(mirror.values.count) == 2
        expect(mirror.values[0] as? String) == "Sara"
        expect(mirror.values[1] as? Int) == 24
      }
      
      it("can get types") {
        let types = mirror.types
        let stringTypes = types.map { "\($0)" }
        expect(stringTypes) == ["Swift.String", "Swift.Int"]
      }
      
      it("can get types names with short style") {
        let typesName = mirror.typesShortName
        expect(typesName) == ["String", "Int"]
      }
      
      it("can get children mirrors") {
        let children = mirror.children
        expect(children.count) == 2
        
        expect(children[0].name) == "name"
        expect(children[0].value as? String ) == "Sara"
        expect(children[0].type is String.Type).to(beTrue())
        
        expect(children[1].name) == "age"
      }
      
      it("has a subscript for getting values by name") {
        expect(mirror["name"] as? String) == "Sara"
        expect(mirror["age"] as? Int) == 24
        expect(mirror["NonExist"]).to(beNil())
      }
      
      it("has a get method with generic return type") {
        expect(mirror.get("name")) == "Sara"
        expect(mirror.get("age")) == 24
        
        let nonExit: String? = mirror.get("NonExist")
        expect(nonExit).to(beNil())
      }
      
      it("can be exported to Dictionary") {
        let dic = mirror.toDictionary
        expect(dic.count) == 2
        expect(dic["name"] as? String) == "Sara"
        expect(dic["age"] as? Int) == 24
      }
      
      it("can be exported to NSDictioanry") {
        let dic = mirror.toNSDictionary
        expect(dic.count) == 2
        expect(dic["name"] as? String) == "Sara"
        expect(dic["age"] as? Int) == 24
      }
      
      context("The Collection type") {
        
        it("has a generator") {
          var generator = mirror.generate()
          var next = generator.next()
          expect(next?.name) == "name"
          
          next = generator.next()
          expect(next?.name) == "age"
          
          expect(generator.next()).to(beNil())
        }
        
        it("has count") {
          expect(mirror.count) == 2
        }
        
        it("has int subcript that returns MirrorItem") {
          let item = mirror[0]
          expect(item.name) == "name"
          expect(item.value as? String ) == "Sara"
          expect(item.type is String.Type).to(beTrue())
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
