//
//  ItemViewCell.swift
//  VuResume
//
//  Created by Vince Tran on 6/10/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

class ItemViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func nibFile() -> UINib {
        return UINib.init(nibName: "ItemViewCell", bundle: NSBundle.mainBundle())
    }
    
    class func sizeForItemViewCell() -> CGSize {
        let screenWidth = CGRectGetWidth(UIScreen.mainScreen().bounds)
        return CGSizeMake(screenWidth, 54)
    }

}
