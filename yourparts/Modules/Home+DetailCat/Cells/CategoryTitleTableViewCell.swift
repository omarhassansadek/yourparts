//
//  OffersTableViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/13/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class CategoryTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var roundView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //self.roundView.roundCorners(corners: [.topLeft, .topRight], radius: 15.0)
        //
        //let view = UIView()
        roundView.clipsToBounds = true
        roundView.layer.cornerRadius = 10
        roundView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        self.categoryLbl.text = "Categories".localized
        self.categoryLbl.font = UIFont(name: "Cairo-Bold", size: 18)

    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
