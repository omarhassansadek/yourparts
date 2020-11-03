//
//  OffersTableViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/13/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class CategoryTitleTableViewCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var roundView: UIView!
    
    //MARK:- Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        roundView.clipsToBounds = true
        roundView.layer.cornerRadius = 10
        roundView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        self.categoryLbl.text = "Categories".localized
        self.categoryLbl.font = UIFont(name: "Cairo-Bold", size: 18)
    }
    
}
