//
//  detailCatTableViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/14/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class detailCatTableViewCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var detailImg: UIImageView!
    @IBOutlet weak var catName: UILabel!
    
    //MARK:- Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.catName.text = "Tire for your car".localized
        self.catName.font = UIFont(name: "Cairo-Bold", size: 14)
    }
    
}
