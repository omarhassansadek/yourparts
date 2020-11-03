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
    
    //MARK:- Outlets
    @IBOutlet weak var brandSample: UIImageView!
    @IBOutlet weak var imageViewContainter: UIView!
    @IBOutlet weak var imageViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var lblTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var lblHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var cartimg: UIImageView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDesc: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productPriceDesc: UILabel!
    @IBOutlet weak var productDeliveryDesc: UILabel!
    @IBOutlet weak var activityind: NVActivityIndicatorView!
    @IBOutlet weak var cartView: UIView!
    
    //MARK:- Variables
    var addToCart : (() -> Void)? = nil
    
    //MARK:- Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.cartView.layer.cornerRadius = 5.0
        self.productName.font = UIFont(name: "Cairo-Bold", size: 13)
        self.productDesc.font = UIFont(name: "Cairo-SemiBold", size: 13)
        self.productPrice.font = UIFont(name: "Cairo-Bold", size: 16)
        self.productPriceDesc.font = UIFont(name: "Cairo-SemiBold", size: 12)
        self.productDeliveryDesc.font = UIFont(name: "Cairo-SemiBold", size: 11)
        
    }
    
    //MARK:- Actions
    @IBAction func addToCartBtnClicked(_ sender: Any) {
        if let addToCartBtn = self.addToCart{
            addToCartBtn()
        }
    }
    
}
