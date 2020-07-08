//
//  addressTableViewCell.swift
//  yourparts
//
//  Created by iMac1 on 6/27/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class addressTableViewCell: UITableViewCell {

    @IBOutlet weak var addressTf: UITextField!
    
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var homeTitle: UILabel!
    
    @IBOutlet weak var conditionTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.homeTitle.text = "Home".localized
        self.homeTitle.font = UIFont(name: "TheMixArab-Bold", size: 17)
        
        self.conditionTitle.text = "Make it primary address".localized
        self.conditionTitle.font = UIFont(name: "TheMixArab", size: 12)

        self.addressTf.attributedPlaceholder = NSAttributedString(string: "Enter address ..".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "TheMixArab", size: 14 )!
            ])

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
