//
//  userReviewCollectionViewCell.swift
//  yourparts
//
//  Created by iMac1 on 8/6/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import Cosmos

class detailProductCellTableViewCell: UITableViewCell {
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDesc: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productPriceDesc: UILabel!
    @IBOutlet weak var productDeliveryDesc: UILabel!

    
    @IBOutlet weak var roundView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.roundView.layer.cornerRadius = 10.0
        
        self.productName.font = UIFont(name: "Cairo-Bold", size: 13)

        
        self.productDesc.font = UIFont(name: "Cairo-SemiBold", size: 13)
        
        
        self.productPrice.font = UIFont(name: "Cairo-Bold", size: 16)

        
        self.productPriceDesc.font = UIFont(name: "Cairo-SemiBold", size: 12)

        
        self.productDeliveryDesc.font = UIFont(name: "Cairo-SemiBold", size: 13)

    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
