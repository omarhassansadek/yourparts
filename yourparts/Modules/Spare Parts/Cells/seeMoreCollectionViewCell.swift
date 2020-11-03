//
//  seeMoreCollectionViewCell.swift
//  yourparts
//
//  Created by iMac1 on 8/15/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class seeMoreCollectionViewCell: UICollectionViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var seeMoreText: UITextView!
    @IBOutlet weak var borderView: UIView!
    
    //MARK:- Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        borderView.layer.borderWidth = 1.0
        borderView.layer.borderColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0).cgColor
    }
    
}
