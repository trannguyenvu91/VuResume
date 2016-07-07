//
//  ProfileDataSource.swift
//  VuResume
//
//  Created by Vince Tran on 6/10/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit


@objc protocol VRProfileDataSourceDelegate:NSObjectProtocol {
    func profileDataSource(dataSource:VRProfileDataSource, openProjectsBySelectingAtIndexPath indexPath:NSIndexPath)
}

class VRProfileDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    weak var delegate: VRProfileDataSourceDelegate!
    weak var collectionView:UICollectionView!
    var screenWidth = CGRectGetWidth(UIScreen.mainScreen().bounds)
    var sectionNames:[String]!
    
    var detailDict: NSDictionary!
    
    let kAvarViewCell        =   "VRAvarViewCell"
    let kDescriptionViewCell =   "VRDescriptionViewCell"
    let kItemViewCell        =   "VRItemViewCell"
    let kCoverHeaderView     =   "VRCoverHeaderView"
    let kContentHeaderView   =   "VRContentHeaderView"

    init(delegate:VRProfileDataSourceDelegate, collectionView:UICollectionView) {
        super.init()
        
        self.delegate = delegate
        self.collectionView = collectionView
        commonInit()
    }
    
    func commonInit() {
        sectionNames = ["Cover", "Content", "Contact"]
        
        if let path = NSBundle.mainBundle().pathForResource("Details", ofType: "plist") {
            detailDict = NSDictionary(contentsOfFile: path)
            
        }
        
        collectionView.registerNib(VRAvarViewCell.nibFile(), forCellWithReuseIdentifier: kAvarViewCell)
        collectionView.registerNib(VRDesciptionViewCell.nibFile(), forCellWithReuseIdentifier: kDescriptionViewCell)
        collectionView.registerNib(VRItemViewCell.nibFile(), forCellWithReuseIdentifier: kItemViewCell)
        
        collectionView.registerNib(VRCoverHeaderView.nibFile(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kCoverHeaderView)
        collectionView.registerNib(VRContentHeaderView.nibFile(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kContentHeaderView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    //MARK: - UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            // contains: ava cell and description cell
            return 2
        } else {
            
            let name = sectionNames[section]
            let list = detailDict[name]
            return list!.count
        }
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            return cellInBasicSection(atIndexPath: indexPath)
        } else {
            var cell = collectionView.dequeueReusableCellWithReuseIdentifier(kItemViewCell, forIndexPath: indexPath) as! VRItemViewCell
            configureCell(&cell, atIndexPath: indexPath)
            return cell
        }
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
            let header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: kCoverHeaderView, forIndexPath: indexPath) as! VRCoverHeaderView
            return header
        } else {
            let header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: kContentHeaderView, forIndexPath: indexPath) as! VRContentHeaderView
            header.titleLabel.text = sectionNames[indexPath.section]
            return header
        }
    }
    
    
    //MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return VRCoverHeaderView.sizeForCoverHeader()
        } else {
            return VRContentHeaderView.sizeForContentHeaderView()
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            if indexPath.row == 0{
                return VRAvarViewCell.sizeForAvarViewCell()
            } else {
                return VRDesciptionViewCell.sizeForDesciptionViewCell()
            }
        } else {
            return VRItemViewCell.sizeForItemViewCell()
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
        if self.delegate.respondsToSelector(#selector(VRProfileDataSourceDelegate.profileDataSource(_:openProjectsBySelectingAtIndexPath:))) {
            self.delegate.profileDataSource(self, openProjectsBySelectingAtIndexPath: indexPath)
        }
    }
    
    
    //MARK: - Configure Cells
    func cellInBasicSection(atIndexPath indexPath:NSIndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            //return avar cell
            let avaCell = collectionView.dequeueReusableCellWithReuseIdentifier(kAvarViewCell, forIndexPath: indexPath) as! VRAvarViewCell
            avaCell.nameLabel.text = "Vu Tran"
            avaCell.sub1Label.text = "iOS Developer"
            return avaCell
        } else {
            let desCell = collectionView.dequeueReusableCellWithReuseIdentifier(kDescriptionViewCell, forIndexPath: indexPath) as! VRDesciptionViewCell
            return desCell
        }
    }
    
    func configureCell(inout cell:VRItemViewCell, atIndexPath indexPath:NSIndexPath) {
        
        let name = sectionNames[indexPath.section]
        if let list = detailDict.objectForKey(name) {
            
            let item = list.objectAtIndex(indexPath.row) as! [String:String]
            for (title, subTitle) in item {
                cell.titleLabel.text = title
                cell.subTitleLabel.text = subTitle
            }
        }
        
        
    }
}
