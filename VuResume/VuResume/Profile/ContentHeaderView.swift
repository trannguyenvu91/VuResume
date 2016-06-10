//
//  ContactReusableView.swift
//  VuResume
//
//  Created by Vince Tran on 6/10/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

class ContentHeaderView: UICollectionReusableView {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func nibFile() -> UINib {
        return UINib.init(nibName: "ContentHeaderView", bundle: NSBundle.mainBundle())
    }
    
    class func sizeForContentHeaderView() -> CGSize {
        let screenWidth = CGRectGetWidth(UIScreen.mainScreen().bounds)
        return CGSizeMake(screenWidth, 36)
    }
    
}
