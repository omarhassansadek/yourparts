//
//  headerTableViewCell.swift
//  yourparts
//
//  Created by iMac1 on 8/13/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class headerTableViewCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var spartsBg: UIImageView!
    @IBOutlet weak var searchTf: UITextField!
    @IBOutlet weak var cellTitle: UILabel!
    
    //MARK:- Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.cellTitle.text = "All Spare Parts".localized
        self.cellTitle.font = UIFont(name: "Cairo-Bold", size: 16)
        self.searchTf.attributedPlaceholder = NSAttributedString(string: "Search with part name".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "Cairo-Regular", size: 12 )!
        ])
    }
    
}
