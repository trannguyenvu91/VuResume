//
//  ViewController.swift
//  VuResume
//
//  Created by Vince Tran on 6/10/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

class VRBaseViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    private var popAnimation:VRPopAnimation?
    private var swipeInteractionController:VRInteractionController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let sourceVC = segue.sourceViewController
        if sourceVC.isKindOfClass(VRProfileViewController) {
            sourceVC.modalPresentationStyle = UIModalPresentationStyle.Custom
            
            
            if let destinationVC = segue.destinationViewController as? UINavigationController {
                
                popAnimation = VRPopAnimation()
                destinationVC.transitioningDelegate = self
                swipeInteractionController = VRInteractionController()
                swipeInteractionController?.wireToViewController(destinationVC.viewControllers.first)
            }
            
        }
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        popAnimation?.type = AnimationType.Present
        return popAnimation
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        popAnimation?.type = AnimationType.Dismiss
        return popAnimation
    }
    
    func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return swipeInteractionController!.interactionInProgress ? swipeInteractionController : nil
    }
}
