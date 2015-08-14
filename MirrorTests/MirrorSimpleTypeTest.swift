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

class MirrorSimpleTypeSpec: QuickSpec {
  override func spec() {
    let mirrorInt = Mirror(10)
    let mirrorStr = Mirror("String")
    
    describe("Mirror") {
      
      //MARK: - Type Info
      
      it("can get its type name") {
        expect(mirrorInt.name) == "Swift.Int"
        expect(mirrorStr.name) == "Swift.String"
      }
      
      it("can get its type short name") {
        expect(mirrorInt.shortName) == "Int"
        expect(mirrorStr.shortName) == "String"
      }
      
      it("can get its properties count") {
        expect(mirrorInt.childrenCount) == 0
        expect(mirrorStr.childrenCount) == 0
      }
      
      it("can get momory size for the type") {
        expect(mirrorInt.memorySize) == sizeof(Int)
        expect(mirrorStr.memorySize) == sizeof(String)
      }
      
      it("can check if it's a class") {
        expect(mirrorInt.isClass) == false
        expect(mirrorStr.isClass) == false
      }
      
      it("can check if it's a struct ") {
        expect(mirrorInt.isStruct) == true
        expect(mirrorStr.isStruct) == true
      }
    }
    
    describe("Mirror Children") {
      it("can get names") {
        expect(mirrorInt.names.isEmpty) == true
        expect(mirrorStr.names.isEmpty) == true
      }
      
      it("can get values") {
        expect(mirrorInt.values.isEmpty) == true
        expect(mirrorStr.values.isEmpty) == true
      }
      
      it("can get types") {
        expect(mirrorInt.types.isEmpty) == true
        expect(mirrorStr.types.isEmpty) == true
      }
      
      it("can get types names with short style") {
        expect(mirrorInt.typesShortName.isEmpty) == true
        expect(mirrorStr.typesShortName.isEmpty) == true
      }
      
      it("can get children mirrors") {
        expect(mirrorInt.children.isEmpty) == true
        expect(mirrorStr.children.isEmpty) == true
      }
    }
    
    describe("Converting") {
      it("can be exported to Dictionary") {
        expect(mirrorInt.toDictionary.count) == 0
        expect(mirrorStr.toDictionary.count) == 0
      }
      
      it("can be exported to NSDictioanry") {
        expect(mirrorInt.toNSDictionary.count) == 0
        expect(mirrorStr.toNSDictionary.count) == 0
      }
      
      context("The Collection type") {
        
        it("has a generator") {
          var intGenerator = mirrorInt.generate()
          var stringGenerator = mirrorStr.generate()

          expect(intGenerator.next()).to(beNil())
          expect(stringGenerator.next()).to(beNil())
        }
        
        it("has count") {
          expect(count(mirrorInt)) == 0
          expect(count(mirrorStr)) == 0
        }
      }
    }
  }
}

