//
//  addCarTableViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/13/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class addCarTableViewCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var carLogo: UIImageView!
    @IBOutlet weak var detailAddCarLbl: UILabel!
    @IBOutlet weak var addCarLbl: UILabel!
    
    //MARK:- Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.addCarLbl.font = UIFont(name: "Cairo-Bold", size: 14)
        self.detailAddCarLbl.font = UIFont(name: "Cairo-SemiBold", size: 12)
    }
    
}
