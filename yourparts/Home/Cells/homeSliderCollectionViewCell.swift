//
//  homeSliderCollectionViewCell.swift
//  yourparts
//
//  Created by iMac1 on 8/10/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class homeSliderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var offerLbl: UILabel!
    @IBOutlet weak var offerBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.offerLbl.text = "Discount 30%".localized
        self.offerBtn.setTitle("Show Offer".localized, for: .normal)
        self.offerBtn.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 12)
    }

}
