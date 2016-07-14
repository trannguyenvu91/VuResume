//
//  VRPushAnimation.swift
//  VuResume
//
//  Created by Vince Tran on 7/13/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

class VRPopAnimation: VRBaseAnimation {
    
    override func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.45
    }
    
    //MARK - Animated Transitioning
    override func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView()
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        var startFrameForToView = CGRectZero
        var endFrameForToView = CGRectZero
        var endFrameForFromView = CGRectZero
        
        
        
        switch type {
        case AnimationType.Present:
            startFrameForToView = CGRectMake( CGRectGetWidth(fromView.frame), CGRectGetMinY(toView.frame), CGRectGetWidth(toView.frame), CGRectGetHeight(toView.frame))
            endFrameForToView = CGRectMake( 0, CGRectGetMinY(toView.frame), CGRectGetWidth(toView.frame), CGRectGetHeight(toView.frame))
            endFrameForFromView = CGRectMake( -CGRectGetWidth(fromView.frame) / 2.5, CGRectGetMinY(toView.frame), CGRectGetWidth(toView.frame), CGRectGetHeight(toView.frame))
            
            containerView?.insertSubview(toView, aboveSubview: fromView)
            break
        case AnimationType.Dismiss:
            startFrameForToView = CGRectMake( -CGRectGetWidth(toView.frame) / 2.5, CGRectGetMinY(toView.frame), CGRectGetWidth(toView.frame), CGRectGetHeight(toView.frame))
            endFrameForToView = CGRectMake( 0, CGRectGetMinY(toView.frame), CGRectGetWidth(toView.frame), CGRectGetHeight(toView.frame))
            endFrameForFromView = CGRectMake( CGRectGetWidth(toView.frame), CGRectGetMinY(fromView.frame), CGRectGetWidth(fromView.frame), CGRectGetHeight(fromView.frame))
            
            containerView?.insertSubview(toView, belowSubview: fromView)
            break
        }
        
        
        toView.frame = startFrameForToView
        
        UIView.animateWithDuration(transitionDuration(transitionContext),
                                   delay: 0,
                                   usingSpringWithDamping: 1.2,
                                   initialSpringVelocity: 0.9,
                                   options: UIViewAnimationOptions.CurveEaseOut,
                                   animations: {
                                    
                                    toView.frame = endFrameForToView
                                    fromView.frame = endFrameForFromView
                                    
        }) { (finished) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
            if !transitionContext.transitionWasCancelled() {
                fromView.removeFromSuperview()
            }
        }
        
    }
}
