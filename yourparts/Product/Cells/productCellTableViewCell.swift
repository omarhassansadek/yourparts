//
//  productCellTableViewCell.swift
//  yourparts
//
//  Created by iMac1 on 8/5/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import Cosmos
import NVActivityIndicatorView

class productCellTableViewCell: UITableViewCell {

    @IBOutlet weak var cartimg: UIImageView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDesc: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productPriceDesc: UILabel!
    @IBOutlet weak var productDeliveryDesc: UILabel!
    
    
    var addToCart : (() -> Void)? = nil

    
    @IBOutlet weak var activityind: NVActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        
        self.productName.font = UIFont(name: "Cairo-Bold", size: 13)

        
        self.productDesc.font = UIFont(name: "Cairo-SemiBold", size: 13)
        
        
        self.productPrice.font = UIFont(name: "Cairo-Bold", size: 16)

        
        self.productPriceDesc.font = UIFont(name: "Cairo-SemiBold", size: 12)

        
        self.productDeliveryDesc.font = UIFont(name: "Cairo-SemiBold", size: 11)

    }

    @IBAction func addToCartBtnClicked(_ sender: Any) {
        if let addToCartBtn = self.addToCart{
                 addToCartBtn()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
