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
        let mirror = Mirror(reflecting: person)
        
        print(mirror.labels)
        print(mirror.values)
        print(mirror.types)
        
        print(mirror["name"])
        print(mirror["age"])
        
        print(Dictionary<String, Any>(mirror: mirror))
        
        // Iterate over it's `Mirror.Child` children
        for child in mirror.children {
            print(child)
        }
        
        let index = AnyForwardIndex(0)
        
        let children = mirror.children
        let firstKid = children[index]
        print(firstKid)
        
        let mirP = mirror.children[index.successor()]
        print(mirP.label)             // Optional("age")
        print(mirP.value)             // 27
        print(mirP.value.dynamicType) // Swift.Int
        
        return true
    }
    
    func setupWindow() {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor = .orangeColor()
        window?.makeKeyAndVisible()
        window?.rootViewController = UIViewController()
    }
}

