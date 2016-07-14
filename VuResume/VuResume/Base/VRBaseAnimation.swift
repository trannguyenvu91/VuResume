//
//  ZKBaseAnimation.swift
//  VuResume
//
//  Created by Vince Tran on 7/13/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit
enum AnimationType {
    case Present
    case Dismiss
}

class VRBaseAnimation: NSObject, UIViewControllerAnimatedTransitioning{
    var type:AnimationType = AnimationType.Present
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        assert(false, "animateTransition: should be handled by subclass of BaseAnimation")
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 1.0
    }
    
    
}
