//
//  ProfileViewController.swift
//  VuResume
//
//  Created by Vince Tran on 6/10/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController, ProfileDataSourceDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    var dataSource:ProfileDataSource!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let color2 = UIColor.init(colorLiteralRed: 38.0/255.0, green: 56.0/255.0, blue: 44.0/255.0, alpha: 1.0)
        collectionView.backgroundColor = color2
        dataSource = ProfileDataSource(delegate: self, collectionView: self.collectionView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - ProfileDataSourceDelegate
    
    
    
    /*
    // MARK: - ProfileDataSourceDelegate

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
