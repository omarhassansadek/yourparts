//
//  productCollectionViewCell.swift
//  yourparts
//
//  Created by iMac1 on 8/9/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class productCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productimg: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var borderView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code'
        
        self.productName.text = "تيل فرامل"
        
        self.productName.font = UIFont(name: "Cairo-SemiBold", size: 12)

        borderView.layer.borderWidth = 1.0
        borderView.layer.borderColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0).cgColor

    }

}
