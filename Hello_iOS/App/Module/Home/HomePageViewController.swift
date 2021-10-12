//
//  HomePageViewController.swift
//  Hello_iOS
//
//  Created by Murph on 2021/10/11.
//

import UIKit

class HomePageViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInderface()
    }
    
    private func setupInderface() {
        view.backgroundColor = UIColor.white
    }
    @IBAction func toLogin(_ sender: Any) {
        WindowManager.shared.login()
    }
}
