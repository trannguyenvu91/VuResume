//
//  ProfileDataSource.swift
//  VuResume
//
//  Created by Vince Tran on 6/10/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit


let kAvarViewCell        =   "AvarViewCell"
let kDescriptionViewCell =   "DescriptionViewCell"
let kItemViewCell        =   "ItemViewCell"
let kCoverHeaderView     =   "CoverHeaderView"
let kContentHeaderView   =   "ContentHeaderView"

protocol ProfileDataSourceDelegate:NSObjectProtocol {
    
}

class ProfileDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    weak var delegate: ProfileDataSourceDelegate!
    weak var collectionView:UICollectionView!
    var screenWidth = CGRectGetWidth(UIScreen.mainScreen().bounds)
    var sectionNames:[String]!
    
    var detailDict: NSDictionary!
    

    init(delegate:ProfileDataSourceDelegate, collectionView:UICollectionView) {
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
        
        collectionView.registerNib(AvarViewCell.nibFile(), forCellWithReuseIdentifier: kAvarViewCell)
        collectionView.registerNib(DesciptionViewCell.nibFile(), forCellWithReuseIdentifier: kDescriptionViewCell)
        collectionView.registerNib(ItemViewCell.nibFile(), forCellWithReuseIdentifier: kItemViewCell)
        
        collectionView.registerNib(CoverHeaderView.nibFile(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kCoverHeaderView)
        collectionView.registerNib(ContentHeaderView.nibFile(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kContentHeaderView)
        
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
            var cell = collectionView.dequeueReusableCellWithReuseIdentifier(kItemViewCell, forIndexPath: indexPath) as! ItemViewCell
            configureCell(&cell, atIndexPath: indexPath)
            return cell
        }
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
            let header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: kCoverHeaderView, forIndexPath: indexPath)
            return header
        } else {
            let header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: kContentHeaderView, forIndexPath: indexPath)
            return header
        }
    }
    
    
    //MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CoverHeaderView.sizeForCoverHeader()
        } else {
            return ContentHeaderView.sizeForContentHeaderView()
        }
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            if indexPath.row == 0{
                return AvarViewCell.sizeForAvarViewCell()
            } else {
                return DesciptionViewCell.sizeForDesciptionViewCell()
            }
        } else {
            return ItemViewCell.sizeForItemViewCell()
        }
    }
    
    //MARK: - Configure Cells
    func cellInBasicSection(atIndexPath indexPath:NSIndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            //return avar cell
            let avaCell = collectionView.dequeueReusableCellWithReuseIdentifier(kAvarViewCell, forIndexPath: indexPath) as! AvarViewCell
            return avaCell
        } else {
            let desCell = collectionView.dequeueReusableCellWithReuseIdentifier(kDescriptionViewCell, forIndexPath: indexPath) as! DesciptionViewCell
            return desCell
        }
    }
    
    func configureCell(inout cell:ItemViewCell, atIndexPath indexPath:NSIndexPath) {
        
        let name = sectionNames[indexPath.section]
        let list = detailDict[name]
        let item = list![indexPath.row] as! [String:String]

        for (title, subTitle) in item {
            cell.titleLabel.text = title
            cell.subTitleLabel.text = subTitle
        }
        
    }
}
