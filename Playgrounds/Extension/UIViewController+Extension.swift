//
//  UIViewController+Extension.swift
//  SY_Patient_Family
//
//  Created by 李京珂 on 2021/12/29.
//  Copyright © 2021 成都尚医信息技术有限公司. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func popGestureClose() {
        if let ges = navigationController?.interactivePopGestureRecognizer?.view?.gestureRecognizers {
            for item in ges {
                item.isEnabled = false
            }
        }
    }

    func popGestureOpen() {
        if let ges = navigationController?.interactivePopGestureRecognizer?.view?.gestureRecognizers {
            for item in ges {
                item.isEnabled = false
            }
        }
    }

    func getVCFromString(_ name: String) -> UIViewController? {
        let className = projectName + "." + name

        if let type = NSClassFromString(className) as? UIViewController.Type {
            return type.init()
        } else {
            return nil
        }
    }
}
