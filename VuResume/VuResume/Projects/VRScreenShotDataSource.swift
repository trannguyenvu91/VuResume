//
//  VRScreenShotDataSource.swift
//  VuResume
//
//  Created by Vince Tran on 7/7/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit


@objc protocol VRScreenShotDataSourceDelegate:NSObjectProtocol {
    func screenShotDataSource(dataSource:VRScreenShotDataSource, openProjectBySelectingAtIndexPath indexPath:NSIndexPath)
}

class VRScreenShotDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    weak var delegate: VRScreenShotDataSourceDelegate!
    var cellRatio:Float = 1.0
    
    weak var collectionView:UICollectionView? {
        didSet {
            collectionView?.delegate = self
            collectionView?.dataSource = self
        }
    }
    
    var items = ["1", "2", "2", "2", "2", "2", "2", "2"]
    
    init(delegate:VRScreenShotDataSourceDelegate, collectionView:UICollectionView?, cellRatio:Float) {
        super.init()
        self.cellRatio = cellRatio
        self.delegate = delegate
        self.collectionView = collectionView
        commonInit()
    }
    
    func commonInit() {
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
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
        let height = CGRectGetHeight(collectionView.frame)
        return CGSizeMake(height / CGFloat(cellRatio), height)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        let width = CGRectGetHeight(collectionView.frame) * 9.0 / 16.0
        return width / 3.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        let width = CGRectGetHeight(collectionView.frame) * 9.0 / 16.0
        return width / 3.0
    }
    
    //MARK: - UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        if self.delegate.respondsToSelector(#selector(VRScreenShotDataSourceDelegate.screenShotDataSource(_:openProjectBySelectingAtIndexPath:))) {
            self.delegate.screenShotDataSource(self, openProjectBySelectingAtIndexPath: indexPath)
        }
    }
    
    
    //MARK: - Configure Cells
    func cellInBasicSection(atIndexPath indexPath:NSIndexPath) -> UICollectionViewCell {
        //return avar cell
        let imageCell = collectionView!.dequeueReusableCellWithReuseIdentifier("ImageCollectionCell", forIndexPath: indexPath) as! ImageCollectionCell
        return imageCell
    }
}
