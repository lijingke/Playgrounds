//
//  Data+Extension.swift
//  Playgrounds
//
//  Created by 李京珂 on 2023/6/14.
//

import Foundation
import SwiftyJSON

extension Data {
    /// 转字典
    func toDic() -> [String: Any] {
        do {
            let json = try JSON(data: self)
            let dic = json.dictionaryObject!
            return dic

        } catch _ {
            return [:]
        }
    }
}
