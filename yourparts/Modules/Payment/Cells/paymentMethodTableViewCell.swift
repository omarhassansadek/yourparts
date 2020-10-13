//
//  paymentMethodTableViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 10/12/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class paymentMethodTableViewCell: UITableViewCell {

    @IBOutlet weak var paymentMethod: UILabel!
    @IBOutlet weak var methodLbl: UILabel!
    @IBOutlet weak var cartLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.paymentMethod.text = "Payment Method".localized

        self.paymentMethod.font = UIFont(name: "Cairo-Bold", size: 13)
        
        self.methodLbl.text = "فيزا".localized

        self.methodLbl.font = UIFont(name: "Cairo-Regular", size: 12)

        self.cartLbl.text = "Cart".localized

        self.cartLbl.font = UIFont(name: "Cairo-Bold", size: 18)

    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
