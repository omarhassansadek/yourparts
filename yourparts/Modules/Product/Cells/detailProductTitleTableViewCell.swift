//
//  chooseAdrressTitleTableViewCell.swift
//  yourparts
//
//  Created by iMac1 on 8/16/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class detailProductTitleTableViewCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var roundView: UIView!
    
    //MARK:- Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.roundView.layer.cornerRadius = 12.0
        
    }
    
}
