//
//  Const.swift
//  CustomizationGlass
//
//  Created by 李京珂 on 2021/7/21.
//

import Foundation
import UIKit

let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height
let kScreenScale: CGFloat = UIScreen.main.scale
let kAppVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
let kStatusBarHeight = UIApplication.shared.statusBarFrame.height
let kNaviHeight = CGFloat(44)
let kTopHeight = kStatusBarHeight + kNaviHeight
let kThemeColor = UIColor(hexString: "#0A75D8")

// Networking
let HttpMethod_GET = "GET"
let HttpMethod_POST = "POST"
let HttpMethod_PUT = "PUT"
let HttpMethod_HEAD = "HEAD"
let HttpMethod_PATCH = "PATCH"
let HttpMethod_DELETE = "DELETE"
