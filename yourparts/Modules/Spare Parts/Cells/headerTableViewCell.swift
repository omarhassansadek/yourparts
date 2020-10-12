//
//  headerTableViewCell.swift
//  yourparts
//
//  Created by iMac1 on 8/13/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class headerTableViewCell: UITableViewCell {

    @IBOutlet weak var spartsBg: UIImageView!
    @IBOutlet weak var searchTf: UITextField!
    @IBOutlet weak var cellTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.cellTitle.text = "All Spare Parts".localized
        
        self.cellTitle.font = UIFont(name: "Cairo-Bold", size: 16)

        self.searchTf.attributedPlaceholder = NSAttributedString(string: "Search with part name".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "Cairo-Regular", size: 12 )!
            ])
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
