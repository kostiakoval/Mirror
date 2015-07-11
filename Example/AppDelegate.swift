//
//  AppDelegate.swift
//  Example
//
//  Created by Kostiantyn Koval on 11/07/15.
//  Copyright (c) 2015 CocoaPods. All rights reserved.
//

import UIKit
import Mirror

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    window = UIWindow(frame: UIScreen.mainScreen().bounds)
    window?.backgroundColor = .orangeColor()
    window?.makeKeyAndVisible()

    struct Person {
      let name: String
      var age: Int
    }
    
    var person = Person(name: "Jon", age: 27)
    let mirror = Mirror(person)
    
    println(mirror.names)
    println(mirror.values)
    println(mirror.types)
    println(mirror.typesShortName)

    println(mirror["name"])
    println(mirror["age"])
    
    println(mirror.toDictionary)
    
    // Iterate over it's children MirrorItems
    for item in mirror {
      println(item)
    }
    
    let children = mirror.children
    let firstKid = children[0]
    println(firstKid)
    
    var mirP = mirror[1]
    println(mirP.name)   // "age"
    println(mirP.value)// 27
    println(mirP.type)  // Swift.Int


    return true
  }
  
}

