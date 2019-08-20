//
//  AppDelegate.swift
//  KakaoLogin
//
//  Created by Fury on 19/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  var deviceToken: Data? = nil
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
  
    window = UIWindow(frame: UIScreen.main.bounds)
    
    let loginVC = LoginViewController()
    
    window?.rootViewController = loginVC
    window?.makeKeyAndVisible()
    
    return true
  }
  
  
  func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
    if KOSession.isKakaoAccountLoginCallback(url.absoluteURL) {
      return KOSession.handleOpen(url)
    }
    
    return true
  }
  
  func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
    if KOSession.isKakaoAccountLoginCallback(url.absoluteURL) {
      return KOSession.handleOpen(url)
    }
    return true
  }
}

