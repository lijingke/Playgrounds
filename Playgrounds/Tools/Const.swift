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

// MARK: - Color
let ColorOfBlueColor = "#3DA3E1"
let ColorOfBlackColor = "#000000"
let ColorOfWaveBlueColor = "#44B7FC"
let ColorOfWaveBlackColor = "#4F4F4F"

// MARK: - 项目相关
let projectName = Bundle.main.infoDictionary?["CFBundleExecutable"] as? String ?? ""

// MARK: - Net
let SMDomainURL = "https://sm.ms/api/v2/"
let TokenAPI = "token"
let UploadHistoryAPI = "upload_history"
let ProfileAPI = "profile"
let UploadAPI = "upload"

let appDelegate = UIApplication.shared.delegate as! AppDelegate
