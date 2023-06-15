//
//  AppDelegate.swift
//  Playgrounds
//
//  Created by 李京珂 on 2023/6/12.
//

import UIKit
import Tiercel
import WXNavigationBar

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var sessionManager: SessionManager = {
        var configuration = SessionConfiguration()
        configuration.allowsCellularAccess = true
        let dstPath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first!
        let temPath = (dstPath as NSString).appendingPathComponent("SportResource")
        let downloadTmpPath = (temPath as NSString).appendingPathComponent("Tmp")
        let downloadFilePath = (temPath as NSString).appendingPathComponent("File")
        let cache = Cache("SportDownload", downloadPath: temPath, downloadTmpPath: downloadTmpPath, downloadFilePath: downloadFilePath)
        let manager = SessionManager("default", configuration: configuration, cache: cache)
        manager.logger.option = .default
        manager.totalRemove()
        return manager
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        WXNavigationBar.setup()
        WXNavigationBar.NavBar.backgroundColor = .secondarySystemBackground
        
        let rootViewController  = MainTabbarController()
//        rootViewController.hidesBottomBarWhenPushed = true
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        return true
    }
    
    func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String) async {
        
    }
}

