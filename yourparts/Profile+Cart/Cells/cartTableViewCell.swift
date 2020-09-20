
//
//  cartTableViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/17/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import Cosmos

class cartTableViewCell: UITableViewCell {

    @IBOutlet weak var roundCounterView: UIView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDesc: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var productPrice: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.roundCounterView.layer.cornerRadius = 12.5
        
        self.productName.font = UIFont(name: "Cairo-Bold", size: 13)

        
        self.productDesc.font = UIFont(name: "Cairo-SemiBold", size: 13)
        
        
        self.productPrice.font = UIFont(name: "Cairo-Bold", size: 16)

        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
