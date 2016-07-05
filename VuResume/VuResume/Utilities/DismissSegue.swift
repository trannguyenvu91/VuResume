//
//  DismissSegue.swift
//  VuResume
//
//  Created by Vince Tran on 7/5/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

class DismissSegue: UIStoryboardSegue {
    override func perform() {
        sourceViewController.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
}
