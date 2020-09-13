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

        
        self.categoryLbl.text = "Categories".localized
        self.categoryLbl.font = UIFont(name: "Cairo-Bold", size: 14)

    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
      //  self.roundView.roundCorners(corners: [.topLeft, .topRight], radius: 15.0)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
