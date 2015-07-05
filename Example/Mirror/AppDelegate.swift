//
//  AppDelegate.swift
//  Mirror
//
//  Created by Konstantin Koval on 06/30/2015.
//  Copyright (c) 06/30/2015 Konstantin Koval. All rights reserved.
//

import UIKit
import Mirror

struct A {
  let name: String
  let val: Int
  let maybe: Int?
  let tup: (Int, Int)
  let tupNam: (x: Int, y: Int)
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
    let a = A(name: "", val: 10, maybe: nil, tup: (1, 2),  tupNam: (x: 1, y: 2))
    let mirror = Mirror(a)
    
    count(mirror)
    
    mirror.names
    mirror.values
    
    let tt = mirror[4]
    tt.key
    let val = tt.data.value as! (x: Int, y: Int)
    val.x
    
    let namedTup :(x: Int, y: Int)?
    namedTup = mirror.get("maybe")
    println(namedTup)
    
    let child = mirror.children
    for (k, v) in mirror {
      k
      v
    }
    return true
  }
}


