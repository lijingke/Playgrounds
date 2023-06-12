//
//  UIAlertController+Extension.swift
//  PlayGround
//
//  Created by 李京珂 on 2021/7/20.
//

import Foundation
import UIKit

public extension UIAlertController {
    func show() {
        UIApplication.shared.keyWindow?.rootViewController?.present(self, animated: true, completion: nil)
    }
    
    /// 一个取消，确定 的默认提示消息
    class func alert_(vc: UIViewController?, alertMsg: String, isShowCancelBtn: Bool = false, okTitle: String?, block: @escaping (() -> Void)) {
        let alertVC = UIAlertController(title: nil, message: alertMsg, preferredStyle: .alert)
        let sureTitle = okTitle ?? "Ok"
        let ok = UIAlertAction(title: sureTitle, style: .default) { _ in

            block()
        }
        
        if isShowCancelBtn {
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            }
            alertVC.addAction(cancel)
        }
        
        alertVC.addAction(ok)
        if vc == nil {
            alertVC.show()
        } else {
            vc?.present(alertVC, animated: true, completion: nil)
        }
    }

    /// 显示一个“知道了”提示
    class func alert_(_ msg: String?) {
        if let str = msg {
            if str.count == 0 { return }
            alert_("提示", str)
        }
    }

    /// 显示一个“知道了”提示
    class func alert_(_ title: String?, _ msg: String) {
        if msg.count == 0 { return }
        let alertVC = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let ok = UIAlertAction(title: "知道了", style: .default) { _ in }
        alertVC.addAction(ok)
        alertVC.show()
    }
}
