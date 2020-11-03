//
//  brandCollectionViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/16/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class brandCollectionViewCell: UICollectionViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var brandimg: UIImageView!
    @IBOutlet weak var roundView: UIView!
    
    //MARK:- Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.roundView.layer.cornerRadius = 10.0
        self.brandimg.layer.cornerRadius = 10.0
        self.brandimg.clipsToBounds = true
        
    }
    
}
