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
        window = WindowManager.shared.currentWindow
        WindowManager.shared.startApp()
        return true
    }
}

