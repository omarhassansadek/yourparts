//
//  addCarTableViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/13/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class addCarTableViewCell: UITableViewCell {

    @IBOutlet weak var carLogo: UIImageView!
    @IBOutlet weak var detailAddCarLbl: UILabel!
    @IBOutlet weak var addCarLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
        self.addCarLbl.font = UIFont(name: "Cairo-Bold", size: 14)
        
        self.detailAddCarLbl.font = UIFont(name: "Cairo-SemiBold", size: 12)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
