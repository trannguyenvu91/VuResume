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
        
        self.backgroundColor = UIColor.clearColor()
    }
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        UIColor.whiteColor().colorWithAlphaComponent(0.4).setStroke()
        let divideLine = UIBezierPath()
        divideLine.moveToPoint(CGPointMake(8, CGRectGetHeight(rect)))
        divideLine.addLineToPoint(CGPointMake(CGRectGetWidth(rect) - 8, CGRectGetHeight(rect)))
        divideLine.closePath()
        divideLine.lineWidth = 0.5
        
        divideLine.stroke()
        
    }
    
    class func nibFile() -> UINib {
        return UINib.init(nibName: "ItemViewCell", bundle: NSBundle.mainBundle())
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

    
    class func sizeForItemViewCell() -> CGSize {
        let screenWidth = CGRectGetWidth(UIScreen.mainScreen().bounds)
        return CGSizeMake(screenWidth, 48)
    }

}
