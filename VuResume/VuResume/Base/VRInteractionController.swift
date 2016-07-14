//
//  VRInteractionController.swift
//  VuResume
//
//  Created by Vince Tran on 7/14/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

class VRInteractionController: UIPercentDrivenInteractiveTransition {
    var interactionInProgress = false
    
    private var firstTranslationX:CGFloat = 0.0
    private var shouldCompleteTransition = false
    private weak var viewController: UIViewController!
    var gesture:UIPanGestureRecognizer!
    
    func wireToViewController(viewController: UIViewController!) {
        self.viewController = viewController
        self.completionCurve = .EaseOut
        prepareGestureRecognizerInView(viewController.view)
    }
    
    private func prepareGestureRecognizerInView(view: UIView) {
        gesture = UIPanGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
        view.addGestureRecognizer(gesture)
    }
    
    func handleGesture(gestureRecognizer: UIScreenEdgePanGestureRecognizer) {
        
        let translation = gestureRecognizer.translationInView(gestureRecognizer.view!.superview!)
        var progress = ((translation.x - firstTranslationX) / CGRectGetWidth(viewController.view.frame) / 2.0)
        progress = CGFloat(fminf(fmaxf(Float(progress), 0.0), 1.0))
        
        switch gestureRecognizer.state {
            
        case .Began:
            interactionInProgress = true
            firstTranslationX = translation.x
            
            if let navigationController = viewController as? UINavigationController {
                if navigationController.viewControllers.count > 1 {
                    navigationController.popViewControllerAnimated(true)
                } else {
                    viewController.dismissViewControllerAnimated(true, completion: nil)
                }
            } else {
                viewController.dismissViewControllerAnimated(true, completion: nil)
            }
            
            
        case .Changed:
            shouldCompleteTransition = progress > 0.3
            updateInteractiveTransition(progress)
            
        case .Cancelled:
            interactionInProgress = false
            cancelInteractiveTransition()
            firstTranslationX = 0.0
            
        case .Ended:
            interactionInProgress = false
            firstTranslationX = 0.0
            
            if !shouldCompleteTransition && gesture.velocityInView(gesture.view).x < 0{
                cancelInteractiveTransition()
            } else {
                finishInteractiveTransition()
            }
            
        default:
            
            firstTranslationX = 0.0
            print("Unsupported")
        }
    }
}
