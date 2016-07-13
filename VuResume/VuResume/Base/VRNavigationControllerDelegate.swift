//
//  VRNavigationControllerDelegate.swift
//  VuResume
//
//  Created by Vince Tran on 7/13/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

class VRNavigationControllerDelegate: NSObject, UINavigationControllerDelegate {
    weak var navigationController:UINavigationController!
    var popAnimation = VRPopAnimation()
    var panGesture:UIPanGestureRecognizer!
    var interactionController:UIPercentDrivenInteractiveTransition?
    
    init(navigationController:UINavigationController) {
        super.init()
        
        self.navigationController = navigationController
        self.navigationController.delegate = self
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture(_:)))
        self.navigationController.view.addGestureRecognizer(panGesture)
        
    }
    
    
    @objc func handlePanGesture(panGesture:UIPanGestureRecognizer) {
        let view = navigationController.view
        
        let point = panGesture.translationInView(view)
        
        switch panGesture.state {
        case UIGestureRecognizerState.Began:
            if point.x >= CGRectGetWidth(view.frame) / 4 {
                return
            }
            interactionController = UIPercentDrivenInteractiveTransition()
            navigationController.popViewControllerAnimated(true)
            break
        case UIGestureRecognizerState.Changed:
            let percent = fabs(point.x / CGRectGetWidth(view.frame))
            interactionController?.updateInteractiveTransition(percent)
            break
            
        default:
            if panGesture.velocityInView(view).x > 0 {
                interactionController?.finishInteractiveTransition()
            } else {
                interactionController?.cancelInteractiveTransition()
            }
            interactionController = nil
            break
        }
        
        
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case UINavigationControllerOperation.Pop:
            popAnimation.type = AnimationType.Dismiss
            return popAnimation
        default:
            popAnimation.type = AnimationType.Present
            return popAnimation
        }
    }
    
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactionController
    }
}
