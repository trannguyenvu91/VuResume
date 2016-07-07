//
//  CoverHeaderView.swift
//  VuResume
//
//  Created by Vince Tran on 6/10/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

class VRCoverHeaderView: UICollectionReusableView {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
        self.layer.masksToBounds = true

    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let screenWidth = CGRectGetWidth(UIScreen.mainScreen().bounds) + 20
        let height = VRCoverHeaderView.sizeForCoverHeader().height
        let color1 = UIColor.clearColor()
        let color2 = UIColor.init(colorLiteralRed: 38.0/255.0, green: 56.0/255.0, blue: 44.0/255.0, alpha: 1.0)
        
        
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = CGRectMake(0, height - 35, screenWidth, 35)
        gradient.colors = [color1.CGColor, color2.CGColor]
        gradient.locations = [0.0, 0.7]
        imageView.layer.addSublayer(gradient)
        
    }
    
    class func nibFile() -> UINib {
        return UINib.init(nibName: "VRCoverHeaderView", bundle: NSBundle.mainBundle())
    }
    
    class func sizeForCoverHeader() -> CGSize {
        let screenWidth = CGRectGetWidth(UIScreen.mainScreen().bounds)
        
        return CGSizeMake(screenWidth, min(screenWidth * 0.4, 320))
    }
    
}
