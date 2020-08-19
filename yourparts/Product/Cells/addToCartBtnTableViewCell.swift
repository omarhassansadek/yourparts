//
//  addToCartBtnTableViewCell.swift
//  yourparts
//
//  Created by iMac1 on 8/16/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class addToCartBtnTableViewCell: UITableViewCell {

    @IBOutlet weak var addToCartBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.addToCartBtn.layer.cornerRadius = 10.0
        self.addToCartBtn.setTitle("أضف الى سلة التسوق", for: .normal)
        self.addToCartBtn.titleLabel?.font = UIFont(name: "Cairo-SemiBold", size: 14 )

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
