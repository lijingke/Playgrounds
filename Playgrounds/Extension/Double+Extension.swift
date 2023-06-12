//
//  Double+Extension.swift
//  PlayGround
//
//  Created by 李京珂 on 2021/8/9.
//

import Foundation
import UIKit

extension Double {
    var cgfloat: CGFloat {
        return CGFloat(self)
    }
    
    /// 小数点后如果只是0，显示整数，如果不是，显示原来的值
 
    var cleanZero: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
