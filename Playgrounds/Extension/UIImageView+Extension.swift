//
//  UIImageView+Extension.swift
//  SY_Patient_Family
//
//  Created by 李京珂 on 2023/5/12.
//  Copyright © 2023 成都尚医信息技术有限公司. All rights reserved.
//

import Foundation
import UIKit

protocol RotationAnimatedProtocol {
    func startRotationAnimation()
    func stopRotationAnimation()
}

extension UIImageView: RotationAnimatedProtocol {
    func startRotationAnimation() {
        let rotationAnim = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        rotationAnim.keyTimes = [0, 1]
        rotationAnim.values = [0, CGFloat(Double.pi) * 2]
//        rotationAnim.fromValue = 0
//        rotationAnim.toValue = Double.pi * 2
        rotationAnim.repeatCount = MAXFLOAT
        rotationAnim.duration = 3
        rotationAnim.isRemovedOnCompletion = false
        layer.add(rotationAnim, forKey: nil)
    }

    func stopRotationAnimation() {
        layer.removeAllAnimations()
    }
}
