//
//  myCarTableViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/21/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class myCarTableViewCell: UITableViewCell {

    @IBOutlet weak var carYearModel: UILabel!
    @IBOutlet weak var carType: UILabel!
    @IBOutlet weak var carNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.carNameLbl.text = "بى ام دبليو".localized
        self.carNameLbl.font = UIFont(name: "Cairo-Bold", size: 12)

        self.carType.text = "النمط سيدان".localized
        self.carType.font = UIFont(name: "Cairo-Regular", size: 12)
        
        self.carYearModel.text = "سنة الصنع".localized
        self.carYearModel.font = UIFont(name: "Cairo-Regular", size: 12)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
