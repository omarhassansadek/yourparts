//
//  myCarTableViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/21/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import BEMCheckBox

class myCarTableViewCell: UITableViewCell {

    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carCheckbox: BEMCheckBox!
    @IBOutlet weak var carYearModel: UILabel!
    @IBOutlet weak var carYear: UILabel!
    @IBOutlet weak var carNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.carNameLbl.text = "بى ام دبليو".localized
        self.carNameLbl.font = UIFont(name: "Cairo-Bold", size: 15)

        self.carYear.text = "النمط سيدان".localized
        self.carYear.font = UIFont(name: "Cairo-SemiBold", size: 13)
        
        self.carYearModel.text = "سنة الصنع".localized
        self.carYearModel.font = UIFont(name: "Cairo-SemiBold", size: 13)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
