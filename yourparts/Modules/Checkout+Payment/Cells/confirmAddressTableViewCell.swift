//
//  addressTableViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/20/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import BEMCheckBox


class confirmAddressTableViewCell: UITableViewCell {

    @IBOutlet weak var detailsLbl: UILabel!
    @IBOutlet var addressLbl: UILabel!
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var appartmentNo: UILabel!
    @IBOutlet weak var buildingNo: UILabel!
    @IBOutlet weak var chooseAddressCheckBox: BEMCheckBox!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        self.addressLbl.text = "عنوان التوصيل".localized
//
//        self.addressLbl.font = UIFont(name: "Cairo-Bold", size: 12)

        self.detailsLbl.text = "Order Details".localized

        self.detailsLbl.font = UIFont(name: "Cairo-Bold", size: 16)

        self.buildingNo.text = "ريحانة ريزدينس".localized
        
        self.addressLbl.text = "Shipping Address".localized

        self.addressLbl.font = UIFont(name: "Cairo-SemiBold", size: 14)

        self.buildingNo.font = UIFont(name: "Cairo-Regular", size: 12)
        
        //self.appartmentNo.text = "شقة 40 الطابق 4".localized
        
        self.appartmentNo.font = UIFont(name: "Cairo-Regular", size: 12)

        self.region.text = "زهراء المعادى - المعادى - القاهرة".localized
        
        self.region.font = UIFont(name: "Cairo-Regular", size: 12)


        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
