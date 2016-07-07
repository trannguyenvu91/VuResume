//
//  ExperienceDataSource.swift
//  VuResume
//
//  Created by Vince Tran on 7/7/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

@objc protocol VRExperienceDataSourceDelegate:NSObjectProtocol {
    func experienceDataSource(dataSource:VRExperienceDataSource, openProjectBySelectingAtIndexPath indexPath:NSIndexPath)
}

class VRExperienceDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, VRScreenShotDataSourceDelegate {

    weak var delegate: VRExperienceDataSourceDelegate!
    weak var collectionView:UICollectionView!
    var screenWidth = CGRectGetWidth(UIScreen.mainScreen().bounds)
    
    var items = ["1", "2", "2"]
    var expandedIndexPath:NSIndexPath?
    weak var weakSelf:VRExperienceDataSource?
    var screenShotDataSource:VRScreenShotDataSource!
    
    
    init(delegate:VRExperienceDataSourceDelegate, collectionView:UICollectionView) {
        super.init()
        
        self.delegate = delegate
        self.collectionView = collectionView
        commonInit()
        weakSelf = self
    }
    
    func commonInit() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    //MARK: - UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return items.count
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if expandedIndexPath?.section == section {
            return 4
        }
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            return cellInBasicSection(atIndexPath: indexPath)
        } else if indexPath.row == 1 {
            return desciptionCell(atIndexPath: indexPath)
        } else if indexPath.row == 2 {
            return techniqueCell(atIndexPath: indexPath)
        } else {
            return screenShotCell(atIndexPath: indexPath)
        }
    }
    
    
    //MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if indexPath.row == 0 {
            return VRProjectCell.sizeForProjectCell()
        } else if indexPath.row == 1 {
            return CGSizeMake(screenWidth, 90)
        } else if indexPath.row == 2 {
            return CGSizeMake(screenWidth, 90)
        } else {
            return CGSizeMake(screenWidth, 80)
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    //MARK: - UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        if self.delegate.respondsToSelector(#selector(VRExperienceDataSourceDelegate.experienceDataSource(_:openProjectBySelectingAtIndexPath:))) {
            self.delegate.experienceDataSource(self, openProjectBySelectingAtIndexPath: indexPath)
        }
        
        
        screenShotDataSource = VRScreenShotDataSource(delegate: self, collectionView: nil, cellRatio: 1)
        if indexPath.section == expandedIndexPath?.section {
            expandedIndexPath = nil
            
            collectionView.performBatchUpdates({ 
                collectionView.deleteItemsAtIndexPaths([
                    NSIndexPath.init(forRow: 1, inSection: indexPath.section),
                    NSIndexPath.init(forRow: 2, inSection: indexPath.section),
                    NSIndexPath.init(forRow: 3, inSection: indexPath.section),
                    ])
                }, completion: { (finished) in
                    collectionView.reloadItemsAtIndexPaths(collectionView.indexPathsForVisibleItems())
            })
            
            
        } else {
            
            
            collectionView.performBatchUpdates({
                if let tempIndexPath = self.expandedIndexPath {
                    collectionView.deleteItemsAtIndexPaths([
                        NSIndexPath.init(forRow: 1, inSection: tempIndexPath.section),
                        NSIndexPath.init(forRow: 2, inSection: tempIndexPath.section),
                        NSIndexPath.init(forRow: 3, inSection: tempIndexPath.section),
                        ])
                }
                
                self.expandedIndexPath = indexPath
                collectionView.insertItemsAtIndexPaths([
                    NSIndexPath.init(forRow: 1, inSection: indexPath.section),
                    NSIndexPath.init(forRow: 2, inSection: indexPath.section),
                    NSIndexPath.init(forRow: 3, inSection: indexPath.section),
                    ])
                
                
                }, completion: { (finished) in
                    collectionView.reloadItemsAtIndexPaths(collectionView.indexPathsForVisibleItems())
            })
            
            
        }
        
    }
    
    
    //MARK: - Configure Cells
    func cellInBasicSection(atIndexPath indexPath:NSIndexPath) -> UICollectionViewCell {
        //return avar cell

        let avaCell = collectionView.dequeueReusableCellWithReuseIdentifier("VRProjectCell", forIndexPath: indexPath) as! VRProjectCell
        avaCell.nameLabel.text = "Apple Head Quarter"
        avaCell.sub1Label.text = "July 20th 2009 - June 10th 2016"
        avaCell.sub2Label.text = "Role: iOS Team Leader"
        
        if expandedIndexPath != nil && expandedIndexPath?.section != indexPath.section {
            avaCell.alpha = 0.25
        } else {
            avaCell.alpha = 1
        }
        return avaCell
    }

    func desciptionCell(atIndexPath indexPath:NSIndexPath) -> VRDesciptionCollectionCell {
        let desciptionCell = collectionView.dequeueReusableCellWithReuseIdentifier("VRDesciptionCollectionCell", forIndexPath: indexPath) as! VRDesciptionCollectionCell
        desciptionCell.titleLabel.text = "Description"
        desciptionCell.detailLabel.text = "Apple is a leading corporation on the World. It has successfully delivered over bilions of premium mobile apps and IT solutions for diverse range of clients."
        return desciptionCell
    }
    
    
    func screenShotCell(atIndexPath indexPath:NSIndexPath) -> VRScreenShotCell {
        let screenShotCell = collectionView.dequeueReusableCellWithReuseIdentifier("VRScreenShotCell", forIndexPath: indexPath) as! VRScreenShotCell
        screenShotCell.titleLabel.text = "Projects"
        screenShotDataSource.collectionView = screenShotCell.collectionView
        
        return screenShotCell
    }
    
    func techniqueCell(atIndexPath indexPath:NSIndexPath) -> VRDesciptionCollectionCell {
        let techniqueCell = collectionView.dequeueReusableCellWithReuseIdentifier("VRDesciptionCollectionCell", forIndexPath: indexPath) as! VRDesciptionCollectionCell
        techniqueCell.titleLabel.text = "Resposibilities"
        techniqueCell.detailLabel.text = "I has joined the newly created software development team in USA. I has been involved in developing social app: iHeartLocal which was rewarded No.1 of CES 2016 Mobile App Showdown"
        return techniqueCell
    }
    
    
    //MARK: - VRScreenShotDataSourceDelegate
    func screenShotDataSource(dataSource: VRScreenShotDataSource, openProjectBySelectingAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}



