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

struct Record {
  let name: String?
  let id: Int?
}

class MirrorOptionalSpec: QuickSpec {
  override func spec() {
    
    describe("Mirror Optionals") {
      let record = Record(name: "Working", id: 1)
      let mirror = Mirror(record)
      
      let maybeRecord: Record? = Record(name: "Sara", id: 1)
      let optionalMirror = Mirror(maybeRecord)
      
      //MARK: - Type Info
      
      it("can get its type name") {
        expect(mirror.name) == "Record"
        expect(optionalMirror.name) == "Optional<Record>"
      }
      
      it("can get its type short name") {
        expect(mirror.shortName) == "Record"
        expect(optionalMirror.shortName) == "Record?"
      }
      
      it("can get its properties count") {
        expect(mirror.childrenCount) == 2
      }
      
      xit("can get momory size for the type") {
//FIXME: Doesn't work
        expect(mirror.memorySize) == 34 //(sizeof(Optional<String>) + sizeof(Optional<Int>))
      }
      
//      it("can check if it's a class") {
//        expect(mirror.isClass) == false
//        expect(Mirror("String").isClass) == false
//        expect(Mirror(NSObject()).isClass) == true
//        
//        class A { }
//        expect(Mirror(A()).isClass) == true
//      }
//      
//      it("can check if it's a struct ") {
//        expect(mirror.isStruct) == true
//        struct B { }
//        expect(Mirror(B()).isStruct) == true
//      }
//      

      
      //MARK: - Children info
      
      it("can get names") {
        expect(mirror.names) == ["name", "id"]
      }
      
      xit("can get values") {
        
      }
      
      it("can get types") {
        let types = mirror.types
        let stringTypes = types.map { "\($0)" }
        expect(stringTypes) == ["Optional<String>", "Optional<Int>"]
      }
      
      it("can get types names with short style") {
        let typesName = mirror.typesShortName
        expect(typesName) == ["String?", "Int?"]
      }
      
      xit("can get children mirrors") {
        let children = mirror.children
        expect(children.count) == 2
        
        expect(children[0].name) == "name"
        expect(children[0].value as? String ) == "Sara"
        expect(children[0].type is String.Type).to(beTrue())
        
        expect(children[1].name) == "age"
      }
      
      xit("has a subscript for getting values by name") {
        expect(mirror["name"] as? String) == "Sara"
        expect(mirror["age"] as? Int) == 24
        expect(mirror["NonExist"]).to(beNil())
      }
      
      xit("has a get method with generic return type") {
        expect(mirror.get("name")) == "Sara"
        expect(mirror.get("age")) == 24
        
        let nonExit: String? = mirror.get("NonExist")
        expect(nonExit).to(beNil())
      }
      
      xit("can be exported to Dictionary") {
        let dic = mirror.toDictionary
        expect(dic.count) == 2
        expect(dic["name"] as? String) == "Sara"
        expect(dic["age"] as? Int) == 24
      }
      
      xit("can be exported to NSDictioanry") {
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
          expect(next?.name) == "id"
          
          expect(generator.next()).to(beNil())
        }
        
        it("has count") {
          expect(mirror.count) == 2
        }
        
        xit("has int subcript that returns MirrorItem") {
          let item = mirror[0]
          expect(item.name) == "name"
          expect(item.value as? String ) == "Sara"
          expect(item.type is String.Type).to(beTrue())
        }
      }
    }
  }
}
