//
//  ImageCollectionCell.swift
//  VuResume
//
//  Created by Vince Tran on 7/7/16.
//  Copyright © 2016 VuVince. All rights reserved.
//

import UIKit

class ImageCollectionCell: VRCollectionCell {
    
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.masksToBounds = true
    }
}
