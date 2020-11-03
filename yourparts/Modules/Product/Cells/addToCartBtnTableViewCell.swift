//
//  addToCartBtnTableViewCell.swift
//  yourparts
//
//  Created by iMac1 on 8/16/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class addToCartBtnTableViewCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var addToCartBtn: UIButton!
    
    //MARK:- Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.addToCartBtn.layer.cornerRadius = 10.0
        self.addToCartBtn.setTitle("أضف الى سلة التسوق", for: .normal)
        self.addToCartBtn.titleLabel?.font = UIFont(name: "Cairo-SemiBold", size: 14 )
        
    }
    
}
