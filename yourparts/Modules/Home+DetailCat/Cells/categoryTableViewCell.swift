//
//  categoryTableViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/13/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class categoryTableViewCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var catName: UILabel!
    @IBOutlet weak var roundView: UIView!
    
    //MARK:- Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.roundView.layer.cornerRadius = 15.0
        self.catName.font = UIFont(name: "Cairo-Bold", size: 18)
    }
    
}
