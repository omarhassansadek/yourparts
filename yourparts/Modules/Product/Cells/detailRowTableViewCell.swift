//
//  extraProductsTitleTableViewCell.swift
//  yourparts
//
//  Created by iMac1 on 8/16/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class detailRowTableViewCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var rightLbl: UILabel!
    @IBOutlet weak var separator: UIView!
    @IBOutlet weak var leftLbl: UILabel!
    
    //MARK:- Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.leftLbl.font = UIFont(name: "Cairo-Regular", size: 12)
        self.rightLbl.font = UIFont(name: "Cairo-Regular", size: 12)
        
    }
    
}
