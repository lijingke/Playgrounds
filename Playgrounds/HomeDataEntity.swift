//
//  HomeDataEntity.swift
//  Playgrounds
//
//  Created by 李京珂 on 2023/6/14.
//

import Foundation

enum CellInfoEnum {
    case cellName
    case className
    case pushType
}

struct HomeDataEntity {
    var cellName: String?
    var className: String?
    var pushType: String? = "navi"
    
    init(_ dic: [CellInfoEnum: String]) {
        cellName = dic[.cellName]
        className = dic[.className]
        pushType = dic[.pushType]
    }
}
