//
//  WindowManager.swift
//  Hello_iOS
//
//  Created by Murph on 2021/10/12.
//

import UIKit

class WindowManager {
    static let shared: WindowManager = WindowManager()
    
    var currentWindow: UIWindow
    
    private var mainAppWindow: UIWindow
    
    private init() {
        mainAppWindow = WindowManager.generateMainAppWindow()
        currentWindow = mainAppWindow
    }
    
    private static func generateMainAppWindow() -> UIWindow {
        let window = UIWindow()
        window.rootViewController = TabbarManager.shared.tabbarController
        return window
    }
    
    private func generateLoginWindow() -> UIWindow {
        let window = UIWindow()
        window.rootViewController = LoginViewController()
        return window
    }
    
    private func showMainAppWindow() {
        currentWindow = mainAppWindow
        currentWindow.makeKeyAndVisible()
    }
    
    private func showLoginWindow() {
        currentWindow = generateLoginWindow()
        currentWindow.makeKeyAndVisible()
    }
    
    func startApp() {
        showMainAppWindow()
    }
    
    func login() {
        showLoginWindow()
    }
}
