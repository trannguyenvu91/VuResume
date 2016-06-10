//
//  ProfileFlowLayout.swift
//  VuResume
//
//  Created by Vince Tran on 6/10/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

class ProfileFlowLayout: UICollectionViewFlowLayout {
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElementsInRect(rect)
        for attribute in layoutAttributes! {
            if attribute.representedElementCategory == .SupplementaryView && attribute.indexPath.section == 0{
                let offsetY = self.collectionView?.contentOffset.y
                if offsetY < 0 {
                    let oldSize = CoverHeaderView.sizeForCoverHeader()
                    
                    let newFrame = CGRectMake(4, offsetY!, oldSize.width, oldSize.height)
                    attribute.frame = newFrame
                }
                
                break
            }
        }
        
        return layoutAttributes
    }

}
