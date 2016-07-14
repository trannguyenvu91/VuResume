//
//  VRProjectsViewController.swift
//  VuResume
//
//  Created by Vince Tran on 7/5/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

class VRProjectsViewController: VRBaseViewController, VRProjectsDataSourceDelegate {
    
    var dataSource:VRProjectsDataSource!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = VRProjectsDataSource(delegate: self, collectionView: collectionView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    deinit {
        
    }
    //MARK: - VRProjectsDataSourceDelegate
    func projectsDataSource(dataSource: VRProjectsDataSource, openProjectBySelectingAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
