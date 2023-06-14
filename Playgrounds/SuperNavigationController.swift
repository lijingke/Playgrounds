//
//  SuperNavigationController.swift
//  Playgrounds
//
//  Created by 李京珂 on 2023/6/14.
//

import Foundation
import FLEX

class SuperNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let flexTap = UITapGestureRecognizer(target: self, action: #selector(fourClick))
        flexTap.numberOfTapsRequired = 4
        view.addGestureRecognizer(flexTap)
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: true)
    }
    
    @objc private func fourClick() {
        FLEXManager.shared.showExplorer()
    }
}
