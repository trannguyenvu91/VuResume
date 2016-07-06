//
//  VRCollectionCell.swift
//  VuResume
//
//  Created by Vince Tran on 7/6/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

class VRCollectionCell: UICollectionViewCell {
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        UIColor.darkGrayColor().colorWithAlphaComponent(0.4).setStroke()
        let divideLine = UIBezierPath()
        divideLine.moveToPoint(CGPointMake(8, CGRectGetHeight(rect)))
        divideLine.addLineToPoint(CGPointMake(CGRectGetWidth(rect) - 8, CGRectGetHeight(rect)))
        divideLine.closePath()
        divideLine.lineWidth = 0.5
        
        divideLine.stroke()
    }
    
    override var selected: Bool {
        didSet {
            if selected {
                self.contentView.alpha = 0.3
            } else {
                self.contentView.alpha = 1.0
            }
        }
    }
    
    override var highlighted: Bool {
        didSet {
            if highlighted {
                self.contentView.alpha = 0.3
            } else {
                self.contentView.alpha = 1.0
            }
        }
    }
}
