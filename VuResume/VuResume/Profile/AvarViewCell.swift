//
//  InfoViewCell.swift
//  VuResume
//
//  Created by Vince Tran on 6/10/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

class AvarViewCell: UICollectionViewCell {

    @IBOutlet weak var btnAva: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        btnAva.layer.masksToBounds = true
        btnAva.layer.cornerRadius = 18
        self.backgroundColor = UIColor.clearColor()
    }
    
    class func nibFile() -> UINib {
        return UINib.init(nibName: "AvarViewCell", bundle: NSBundle.mainBundle())
    }
    
    class func sizeForAvarViewCell() -> CGSize {
        let screenWidth = CGRectGetWidth(UIScreen.mainScreen().bounds)
        return CGSizeMake(screenWidth, 85)
    }

}
