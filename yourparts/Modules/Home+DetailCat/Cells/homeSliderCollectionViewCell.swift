//
//  homeSliderCollectionViewCell.swift
//  yourparts
//
//  Created by iMac1 on 8/10/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class homeSliderCollectionViewCell: UICollectionViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var roundView: UIView!
    @IBOutlet weak var offerimg: UIImageView!
    
    //MARK:- Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.roundView.layer.cornerRadius = 15.0
        self.offerimg.layer.cornerRadius = 15.0
        self.offerimg.contentMode = .scaleAspectFill
        self.offerimg.clipsToBounds = true
    }
    
}
