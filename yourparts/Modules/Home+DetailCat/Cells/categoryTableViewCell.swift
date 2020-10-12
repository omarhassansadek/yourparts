//
//  categoryTableViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/13/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class categoryTableViewCell: UITableViewCell {

    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var catName: UILabel!
    @IBOutlet weak var roundView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.roundView.layer.cornerRadius = 15.0
        
        self.catName.font = UIFont(name: "Cairo-Bold", size: 18)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
