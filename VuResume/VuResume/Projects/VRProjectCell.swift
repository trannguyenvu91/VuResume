//
//  VRProjectCell.swift
//  VuResume
//
//  Created by Vince Tran on 7/6/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

class VRProjectCell: VRCollectionCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sub1Label: UILabel!
    @IBOutlet weak var sub2Label: UILabel!
    @IBOutlet weak var btnAppStore: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 12
        self.backgroundColor = UIColor.clearColor()
    }
    
    class func sizeForProjectCell() -> CGSize {
        let screenWidth = CGRectGetWidth(UIScreen.mainScreen().bounds)
        return CGSizeMake(screenWidth, 85)
    }

}
