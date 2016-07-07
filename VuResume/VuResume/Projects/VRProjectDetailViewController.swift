//
//  VRProjectDetailViewController.swift
//  VuResume
//
//  Created by Vince Tran on 7/6/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

class VRProjectDetailViewController: UIViewController, VRProjectDetailDataSourceDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource:VRProjectDetailDataSource!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = VRProjectDetailDataSource(delegate: self, collectionView: collectionView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: - VRProjectDetailDataSourceDelegate
    func projectDetailDataSource(dataSource: VRProjectDetailDataSource, openProjectBySelectingAtIndexPath indexPath: NSIndexPath) {
        
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
