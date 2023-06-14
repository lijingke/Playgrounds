//
//  MainTabbarController.swift
//  Playgrounds
//
//  Created by 李京珂 on 2023/6/14.
//

import Foundation

class MainTabbarController: SuperTabbarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupChildrenViewControllers() {
                        
        addChileViewController(title: "Home", image: "house", selectedImage: "house.fill", controller: HomeViewController())
        addChileViewController(title: "Setting", image: "square.grid.2x2", selectedImage: "square.grid.2x2.fill", controller: HomeViewController())
        
    }
    
}
