//
//  chooseAdrressTitleTableViewCell.swift
//  yourparts
//
//  Created by iMac1 on 8/16/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class chooseAdrressTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var chooseRegionTf: UITextField!
    @IBOutlet weak var chooseAddressTitle: UILabel!
    @IBOutlet weak var chooseCityTf: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        self.chooseAddressTitle.text = "أختر الفرع الأقرب اليك للإستلام"
        self.chooseAddressTitle.font = UIFont(name: "Cairo-Bold", size: 14)

        
        self.chooseRegionTf.attributedPlaceholder = NSAttributedString(string: "المحافظة" , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "Cairo-Semibold", size: 12 )!
            ])
        
        self.chooseCityTf.attributedPlaceholder = NSAttributedString(string: "المنطقة" , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "Cairo-Semibold", size: 12 )!
            ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
