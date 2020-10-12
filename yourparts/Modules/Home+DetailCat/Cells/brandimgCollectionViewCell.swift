//
//  brandimgCollectionViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/28/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class brandimgCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var brandView: UIView!
    @IBOutlet weak var brandimg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.brandView.layer.cornerRadius = 10.0
        
        // Initialization code
    }

}
