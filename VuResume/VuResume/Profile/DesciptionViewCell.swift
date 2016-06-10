//
//  DesciptionViewCell.swift
//  VuResume
//
//  Created by Vince Tran on 6/10/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

class DesciptionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func nibFile() -> UINib {
        return UINib.init(nibName: "DesciptionViewCell", bundle: NSBundle.mainBundle())
    }

    class func sizeForDesciptionViewCell() -> CGSize {
        let screenWidth = CGRectGetWidth(UIScreen.mainScreen().bounds)
        return CGSizeMake(screenWidth, 88)
    }
}
