//
//  TabbarGenerator.swift
//  Hello_iOS
//
//  Created by Murph on 2021/10/11.
//

import UIKit

class TabbarGenerator {
    static let shared: TabbarGenerator = TabbarGenerator()

    var tabbarController: UITabBarController

    private init() {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            UINavigationController(rootViewController: HomePageViewController()),
            UINavigationController(rootViewController: InfoViewController()),
            UINavigationController(rootViewController: AboutViewController())
        ]
        self.tabbarController = tabBarController
        setupTabbar(tabbarController: tabbarController)
    }
    
    private func setupTabbar(tabbarController: UITabBarController) {
        guard let tabbarItems = tabbarController.tabBar.items else { return }
        tabbarController.tabBar.tintColor = UIColor.orange
        tabbarController.tabBar.backgroundColor = UIColor.white
        for(tabbarItem, itemType) in zip(tabbarItems, [TabbarItem.home, TabbarItem.info, TabbarItem.about]) {
            tabbarItem.title = itemType.title
            tabbarItem.image = itemType.icon
        }
    }
}

enum TabbarItem {
    case home
    case info
    case about
    
    var title: String {
        switch self {
        case .home:
            return "首页"
        case .info:
            return "信息"
        case .about:
            return "关于"
        }
    }
    
    var icon: UIImage {
        switch self {
        case .home:
            return UIImage(systemName: "house.fill")!
        case .info:
            return UIImage(systemName: "info.circle.fill")!
        case .about:
            return UIImage(systemName: "person.fill")!
        }
    }
}
