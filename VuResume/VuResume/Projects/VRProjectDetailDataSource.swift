//
//  VRProjectDetailDataSource.swift
//  VuResume
//
//  Created by Vince Tran on 7/7/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

@objc protocol VRProjectDetailDataSourceDelegate:NSObjectProtocol {
    func projectDetailDataSource(dataSource:VRProjectDetailDataSource, openProjectBySelectingAtIndexPath indexPath:NSIndexPath)
}

class VRProjectDetailDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, VRScreenShotDataSourceDelegate {
    weak var delegate: VRProjectDetailDataSourceDelegate!
    weak var collectionView:UICollectionView!
    var screenWidth = CGRectGetWidth(UIScreen.mainScreen().bounds)
    
    
    var screenShotDataSource:VRScreenShotDataSource!
    
    init(delegate:VRProjectDetailDataSourceDelegate, collectionView:UICollectionView) {
        super.init()
        
        self.delegate = delegate
        self.collectionView = collectionView
        commonInit()
    }
    
    func commonInit() {
        screenShotDataSource = VRScreenShotDataSource(delegate: self, collectionView: nil, cellRatio: 16.0 / 9.0)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    //MARK: - UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell:UICollectionViewCell!
        
        switch indexPath.row {
        case 0:
            cell = projectCell(atIndexPath: indexPath)
        case 1:
            cell = timeCell(atIndexPath: indexPath)
        case 2:
            cell = desciptionCell(atIndexPath: indexPath)
        case 3:
            cell = screenShotCell(atIndexPath: indexPath)
        case 4:
            cell = techniqueCell(atIndexPath: indexPath)
        default:
            cell = UICollectionViewCell()
        }
        
        return cell
    }
    
    
    //MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        var size = CGSizeMake(screenWidth, 0)
        
        switch indexPath.row {
        case 0:
            size = VRProjectCell.sizeForProjectCell()
        case 1:
            size.height = 40
        case 2:
            size.height = 80
        case 3:
            size.height = 200
        case 4:
            size.height = 180
        default:
            size.height = 40
            
        }
        
        return size
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
        if self.delegate.respondsToSelector(#selector(VRProjectDetailDataSourceDelegate.projectDetailDataSource(_:openProjectBySelectingAtIndexPath:))) {
            self.delegate.projectDetailDataSource(self, openProjectBySelectingAtIndexPath: indexPath)
        }
    }
    
    
    //MARK: - VRScreenShotDataSourceDelegate
    func screenShotDataSource(dataSource: VRScreenShotDataSource, openProjectBySelectingAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    //MARK: - Configure Cells
    
    
    func projectCell(atIndexPath indexPath:NSIndexPath) -> UICollectionViewCell {
        //return avar cell
        let avaCell = collectionView.dequeueReusableCellWithReuseIdentifier("VRProjectCell", forIndexPath: indexPath) as! VRProjectCell
        avaCell.nameLabel.text = "Papelook"
        avaCell.sub1Label.text = "Team size: 10 people"
        avaCell.sub2Label.text = "Position: iOS Developer"
        return avaCell
    }
    
    func timeCell(atIndexPath indexPath:NSIndexPath) -> VRDesciptionCollectionCell {
        let timeCell = collectionView.dequeueReusableCellWithReuseIdentifier("VRDesciptionCollectionCell", forIndexPath: indexPath) as! VRDesciptionCollectionCell
        timeCell.titleLabel.text = "Time"
        timeCell.detailLabel.text = "June 10th 1991 - July 20th 2016"
        return timeCell
    }
    
    func desciptionCell(atIndexPath indexPath:NSIndexPath) -> VRDesciptionCollectionCell {
        let desciptionCell = collectionView.dequeueReusableCellWithReuseIdentifier("VRDesciptionCollectionCell", forIndexPath: indexPath) as! VRDesciptionCollectionCell
        desciptionCell.titleLabel.text = "Description"
        desciptionCell.detailLabel.text = "Papelook Video Service. Create small social videos network between family’s members. They can share, gather video and send/delivery their video as a CD gift."
        return desciptionCell
    }
    
    
    func screenShotCell(atIndexPath indexPath:NSIndexPath) -> VRScreenShotCell {
        let screenShotCell = collectionView.dequeueReusableCellWithReuseIdentifier("VRScreenShotCell", forIndexPath: indexPath) as! VRScreenShotCell
        screenShotCell.titleLabel.text = "Screen Shots"
        screenShotDataSource.collectionView = screenShotCell.collectionView
        
        return screenShotCell
    }
    
    func techniqueCell(atIndexPath indexPath:NSIndexPath) -> VRDesciptionCollectionCell {
        let techniqueCell = collectionView.dequeueReusableCellWithReuseIdentifier("VRDesciptionCollectionCell", forIndexPath: indexPath) as! VRDesciptionCollectionCell
        techniqueCell.titleLabel.text = "Techniques"
        techniqueCell.detailLabel.text = "- JSON/REST Web intergration\n- Socket\n- Core Data\n- Core Animation\n- Social framework (facebook, weibo, tencent, twitter,...),\n- APNS (Apple Push Notification Service)\n- Custom transitions using view controllers,... "
        return techniqueCell
    }
}


