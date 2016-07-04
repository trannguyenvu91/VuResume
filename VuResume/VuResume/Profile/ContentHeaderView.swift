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
        
        self.backgroundColor = UIColor.clearColor()
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        UIColor.whiteColor().colorWithAlphaComponent(0.4).setStroke()
        let divideLine = UIBezierPath()
        divideLine.moveToPoint(CGPointMake(12, CGRectGetHeight(rect)))
        divideLine.addLineToPoint(CGPointMake(CGRectGetWidth(rect) - 12, CGRectGetHeight(rect)))
        divideLine.closePath()
        divideLine.lineWidth = 0.5
        
        divideLine.stroke()
        
    }
    
    class func nibFile() -> UINib {
        return UINib.init(nibName: "ContentHeaderView", bundle: NSBundle.mainBundle())
    }
    
    class func sizeForContentHeaderView() -> CGSize {
        let screenWidth = CGRectGetWidth(UIScreen.mainScreen().bounds)
        return CGSizeMake(screenWidth, 50)
    }
    
}
