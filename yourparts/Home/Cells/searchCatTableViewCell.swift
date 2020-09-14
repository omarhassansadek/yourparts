//
//  searchCatTableViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/14/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class searchCatTableViewCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.clipsToBounds = true
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]

        backView.transform = CGAffineTransform(scaleX: -1, y: 1)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var goBack : (() -> Void)? = nil
    
    
    
    @IBAction func goBackClicked(_ sender: Any) {
        if let addAddressClicked = self.goBack{
                 addAddressClicked()
        }
    }
    
}
