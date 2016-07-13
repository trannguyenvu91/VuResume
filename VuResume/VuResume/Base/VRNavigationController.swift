//
//  VRNavigationController.swift
//  VuResume
//
//  Created by Vince Tran on 7/13/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

class VRNavigationController: UINavigationController {
    
    var animationDelegate:VRNavigationControllerDelegate?
    internal override func awakeFromNib() {
        super.awakeFromNib()
        animationDelegate = VRNavigationControllerDelegate(navigationController: self)
    }
}
