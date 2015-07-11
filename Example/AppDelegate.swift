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
   setupWindow()
  
    struct Person {
      let name: String
      var age: Int
    }
    
    let person = Person(name: "Jon", age: 27)
    let mirror = Mirror(person)
    
    print(mirror.names)
    print(mirror.values)
    print(mirror.types)
    print(mirror.typesShortName)

    print(mirror["name"])
    print(mirror["age"])
    
    print(mirror.toDictionary)
    
    // Iterate over it's children MirrorItems
    for item in mirror {
      print(item)
    }
    
    let children = mirror.children
    let firstKid = children[0]
    print(firstKid)
    
    let mirP = mirror[1]
    print(mirP.name)   // "age"
    print(mirP.value)// 27
    print(mirP.type)  // Swift.Int


    return true
  }

  func setupWindow() {
    window = UIWindow(frame: UIScreen.mainScreen().bounds)
    window?.backgroundColor = .orangeColor()
    window?.makeKeyAndVisible()
    window?.rootViewController = UIViewController()
  }
  
}

