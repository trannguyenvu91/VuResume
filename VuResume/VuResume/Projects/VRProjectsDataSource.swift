//
//  VRProjectsDataSource.swift
//  VuResume
//
//  Created by Vince Tran on 7/6/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

@objc protocol VRProjectsDataSourceDelegate:NSObjectProtocol {
    func projectsDataSource(dataSource:VRProjectsDataSource, openProjectBySelectingAtIndexPath indexPath:NSIndexPath)
}

class VRProjectsDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    weak var delegate: VRProjectsDataSourceDelegate!
    weak var collectionView:UICollectionView!
    var screenWidth = CGRectGetWidth(UIScreen.mainScreen().bounds)
    
    var items = ["1", "2", "2", "2", "2", "2", "2", "2"]
    
    
    init(delegate:VRProjectsDataSourceDelegate, collectionView:UICollectionView) {
        super.init()
        
        self.delegate = delegate
        self.collectionView = collectionView
        commonInit()
    }
    
    deinit {
        
    }
    
    func commonInit() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    //MARK: - UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return cellInBasicSection(atIndexPath: indexPath)
    }
    
    
    //MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return VRProjectCell.sizeForProjectCell()
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
        if self.delegate.respondsToSelector(#selector(VRProjectsDataSourceDelegate.projectsDataSource(_:openProjectBySelectingAtIndexPath:))) {
            self.delegate.projectsDataSource(self, openProjectBySelectingAtIndexPath: indexPath)
        }
    }
    
    
    //MARK: - Configure Cells
    func cellInBasicSection(atIndexPath indexPath:NSIndexPath) -> UICollectionViewCell {
        //return avar cell
        let avaCell = collectionView.dequeueReusableCellWithReuseIdentifier("VRProjectCell", forIndexPath: indexPath) as! VRProjectCell
        avaCell.nameLabel.text = "Papelook"
        avaCell.sub1Label.text = "Team size: 10 people"
        avaCell.sub2Label.text = "Position: iOS Developer"
        return avaCell
    }
    
}


