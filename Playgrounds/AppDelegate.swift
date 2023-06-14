//
//  AppDelegate.swift
//  Playgrounds
//
//  Created by 李京珂 on 2023/6/12.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc  = MainTabbarController()
        vc.hidesBottomBarWhenPushed = true
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        return true
    }
    
    func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String) async {
        
    }
}

