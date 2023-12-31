//
//  ScreenTool.swift
//  Playgrounds
//
//  Created by 李京珂 on 2023/6/15.
//

import Foundation

enum SCREEN_SET {
    case set_port
    case set_land
    case set_auto
}

public struct ScreenTool {
    func switchScreenOrientation(vc: UIViewController, mode: SCREEN_SET) {
        appDelegate.screen_set = mode
        if #available(iOS 16.0, *) {
            /// iOS 16以上需要通过scene来实现屏幕方向设置
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            switch mode {
            case .set_port:
                windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .portrait))
                break
            case .set_land:
                windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .landscape))
                break
            case .set_auto:
                windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .all))
                break
            }
            vc.setNeedsUpdateOfSupportedInterfaceOrientations()
        } else {
            switch mode {
            case .set_port:
                /// 强制设置成竖屏
                UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                break
            case .set_land:
                /// 强制设置成横屏
                UIDevice.current.setValue(UIInterfaceOrientation.landscapeLeft.rawValue, forKey: "orientation")
                break
            case .set_auto:
                /// 设置自动旋转
                UIDevice.current.setValue(UIInterfaceOrientation.unknown.rawValue, forKey: "orientation")
                break
            }
        }
    }
}
