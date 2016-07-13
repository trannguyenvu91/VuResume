//
//  ProfileViewController.swift
//  VuResume
//
//  Created by Vince Tran on 6/10/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

class VRProfileViewController: VRBaseViewController, VRProfileDataSourceDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource:VRProfileDataSource!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let color2 = UIColor.init(colorLiteralRed: 38.0/255.0, green: 56.0/255.0, blue: 44.0/255.0, alpha: 1.0)
        collectionView.backgroundColor = color2
        collectionView.contentInset = UIEdgeInsetsMake(0, 0, 90, 0)
        dataSource = VRProfileDataSource(delegate: self, collectionView: collectionView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - ProfileDataSourceDelegate
    func profileDataSource(dataSource: VRProfileDataSource, openProjectsBySelectingAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.section == 1 {
            
            if indexPath.row == 1{
                performSegueWithIdentifier("Experience", sender: self)
            } else if indexPath.row == 2 {
                performSegueWithIdentifier("Projects", sender: self)
            } else if indexPath.row == 3 {
                performSegueWithIdentifier("Competences", sender: self)
            }
        }
        
        
    }
    
    
    /*

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
