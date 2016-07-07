//
//  VRPhotoViewController.swift
//  VuResume
//
//  Created by Vince Tran on 7/7/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

class VRPhotoViewController: UIViewController, VRScreenShotDataSourceDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    var screenShotDataSource:VRScreenShotDataSource!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        screenShotDataSource = VRScreenShotDataSource(delegate: self, collectionView: collectionView, cellRatio: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: - VRScreenShotDataSourceDelegate
    func screenShotDataSource(dataSource: VRScreenShotDataSource, openProjectBySelectingAtIndexPath indexPath: NSIndexPath) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
