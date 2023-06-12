//
//  SYDebouncer.swift
//  RPlusHealthDoctor
//
//  Created by liufeng on 2020/6/9.
//  Copyright © 2020 postop. All rights reserved.
//

import UIKit

class SYDebouncer: NSObject {
    private var block: (() -> Void)!
    // 毫秒
    private var wait: TimeInterval!
    private var timer: Timer!

    /// 初始化一个debouncer对象
    /// - Parameters:
    ///   - block: 要执行的内容
    ///   - wait: 等待时间：毫秒
    init(block: @escaping (() -> Void), wait: TimeInterval) {
        super.init()
        self.block = block
        self.wait = wait
    }

    func call() {
        // timer重新计时
        timer?.invalidate()
        let waitsec = wait / 1000
        timer = Timer.scheduledTimer(withTimeInterval: waitsec, repeats: false, block: { _ in
            self.block()
        })
    }
}
