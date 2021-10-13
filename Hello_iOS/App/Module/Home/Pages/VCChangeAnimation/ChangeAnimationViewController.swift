//
//  ChangeAnimationViewController.swift
//  Hello_iOS
//
//  Created by Murph on 2021/10/13.
//

import UIKit

class ChangeAnimationViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self
    }
    
    @IBAction func action(_ sender: Any) {
        self.navigationController?.pushViewController(getPushedViewController(), animated: true)
    }
    
    private func getPushedViewController() -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = UIColor.yellow
        return controller
    }
}

extension ChangeAnimationViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .pop:
            return Animation(presenting: false)
        default:
            return Animation(presenting: true)
        }
    }
}

extension ChangeAnimationViewController: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animator = Animation(presenting: false)
        return animator
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animator = Animation(presenting: true)
        return animator
    }
}
