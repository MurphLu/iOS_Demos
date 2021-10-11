//
//  AppDelegate.swift
//  Hello_iOS
//
//  Created by Murph on 2021/10/11.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if window == nil {
            window = UIWindow()
            window?.rootViewController = TabbarGenerator.shared.tabbarController
        }
        window?.makeKeyAndVisible()
        return true
    }
}

