//
//  carTableViewCell.swift
//  yourparts
//
//  Created by iMac1 on 6/28/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class carTableViewCell: UITableViewCell {

    @IBOutlet weak var favCarLbl: UILabel!
    @IBOutlet weak var foreignLbl: UILabel!
    @IBOutlet weak var oilLbl: UILabel!
    @IBOutlet weak var tiresLbl: UILabel!
    @IBOutlet weak var innerPartsLbl: UILabel!
    @IBOutlet weak var sparePartsLbl: UILabel!
    @IBOutlet weak var carNameLbl: UILabel!
    @IBOutlet var roundViews: [UIView]!
    @IBOutlet var circleViews: [UIView]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.carNameLbl.text = "Car Name".localized
        self.carNameLbl.font = UIFont(name: "TheMixArab-Bold", size: 16)

//        self.sparePartsLbl.text = "Spare Parts".localized
//        self.sparePartsLbl.font = UIFont(name: "TheMixArab", size: 12)

        self.innerPartsLbl.text = "Inner Parts".localized
        self.innerPartsLbl.font = UIFont(name: "TheMixArab", size: 12)

        self.tiresLbl.text = "Tires".localized
        self.tiresLbl.font = UIFont(name: "TheMixArab", size: 12)

        self.oilLbl.text = "Fluids & Oil".localized
        self.oilLbl.font = UIFont(name: "TheMixArab", size: 12)

        self.foreignLbl.text = "Foreign Parts".localized
        self.foreignLbl.font = UIFont(name: "TheMixArab", size: 12)

        self.favCarLbl.text = "Make favorite car".localized
        self.favCarLbl.font = UIFont(name: "TheMixArab", size: 12)

        for oneView in roundViews{
            
            oneView.roundCorners(corners: [.topLeft, .topRight], radius: oneView.frame.width / 2.0)
//            
//            oneView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 12.5)
        
        }
        
        for oneCircleView in circleViews{
            
            oneCircleView.layer.cornerRadius = oneCircleView.frame.width / 2.0
            
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
