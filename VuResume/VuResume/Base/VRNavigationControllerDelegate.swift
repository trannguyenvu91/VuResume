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
    
    private let swipeInteractionController = VRInteractionController()
    
    init(navigationController:UINavigationController) {
        super.init()
        
        self.navigationController = navigationController
        self.navigationController.delegate = self
        swipeInteractionController.wireToViewController(self.navigationController)
        
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
        return swipeInteractionController.interactionInProgress ? swipeInteractionController : nil
    }
}
