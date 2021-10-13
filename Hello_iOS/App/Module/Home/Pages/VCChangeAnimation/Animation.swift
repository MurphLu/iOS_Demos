//
//  Animation.swift
//  Hello_iOS
//
//  Created by Murph on 2021/10/13.
//

import UIKit

class Animation: NSObject {
    var presenting: Bool = true
        
    init(presenting: Bool) {
        super.init()
        self.presenting = presenting
    }
}

extension Animation: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.25
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let fromVC = transitionContext.viewController(forKey: .from)
        let toVC = transitionContext.viewController(forKey: .to)
        let toView = transitionContext.view(forKey: .to)
        let fromView = transitionContext.view(forKey: .from)
        
        let containerFrame = containerView.frame
        var toViewStartFrame = transitionContext.initialFrame(for: toVC!)
        
        let toViewFinalFrame = transitionContext.finalFrame(for: toVC!)
        
        var fromViewFinalFrame = transitionContext.finalFrame(for: fromVC!)
        containerView.addSubview(toView!)
        if self.presenting{
            toViewStartFrame.origin.x = containerFrame.size.width
            toViewStartFrame.origin.y = containerFrame.size.height
            toView?.frame = toViewStartFrame
        }else{
            fromViewFinalFrame = CGRect.init(x: containerFrame.size.width, y: containerFrame.size.height, width:(toView?.frame.size.width)!, height:(toView?.frame.size.height)!);
            toView?.frame = toViewFinalFrame
            containerView.bringSubviewToFront(fromView!)
        }
        
        UIView.animate(
            withDuration: self.transitionDuration(using:transitionContext),
            animations: {
                if self.presenting{
                    toView?.frame = toViewFinalFrame
                }else{
                    
                    fromView?.frame = fromViewFinalFrame
                }
            }) { finshed in
                let success = !transitionContext.transitionWasCancelled
                transitionContext.completeTransition(success)
            }
    }
}
