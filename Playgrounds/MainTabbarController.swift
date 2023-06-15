//
//  MainTabbarController.swift
//  Playgrounds
//
//  Created by 李京珂 on 2023/6/14.
//

import Foundation

class MainTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addChileViewController(title: "Home", image: "house", selectedImage: "house.fill", controller: HomeViewController())
        addChileViewController(title: "Setting", image: "square.grid.2x2", selectedImage: "square.grid.2x2.fill", controller: UIViewController())
    }
    
    
    func addChileViewController(title: String, image: String, selectedImage: String, controller: UIViewController) {
        
        controller.title = title
        controller.tabBarItem.title = title
        controller.tabBarItem.image = UIImage(named: image) ?? UIImage(systemName: image)
        controller.tabBarItem.selectedImage = UIImage(named: selectedImage) ?? UIImage(systemName: selectedImage)
        
        let naviController = SuperNavigationController(rootViewController: controller)
        
        addChild(naviController)
    }
    
}
