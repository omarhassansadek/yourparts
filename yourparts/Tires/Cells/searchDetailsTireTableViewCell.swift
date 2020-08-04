//
//  searchDetailsTireTableViewCell.swift
//  yourparts
//
//  Created by iMac1 on 7/28/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class searchDetailsTireTableViewCell: UITableViewCell {

    @IBOutlet weak var tireSizeTitle: UILabel!
    @IBOutlet weak var selectTireInfoTitle: UILabel!
    @IBOutlet weak var carTire: UILabel!
    @IBOutlet weak var carTireTitle: UILabel!
    @IBOutlet weak var searchTitle: UILabel!
    @IBOutlet weak var carTypeTF: UITextField!
    @IBOutlet weak var carBrandTF: UITextField!
    @IBOutlet weak var carModelTF: UITextField!
    @IBOutlet weak var tireTypeTF: UITextField!
    @IBOutlet weak var widthTF: UITextField!
    @IBOutlet weak var heightTF: UITextField!
    @IBOutlet weak var lengthTF: UITextField!
    @IBOutlet weak var showTiresBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        self.searchTitle.text = "Search Car Tires".localized
        self.searchTitle.font = UIFont(name: "TheMixArab-Bold", size: 16)
        
        self.carTireTitle.text = "Tire for your car".localized
        self.carTireTitle.font = UIFont(name: "TheMixArab", size: 12)

        self.selectTireInfoTitle.text = "Select Tire Info".localized
        self.selectTireInfoTitle.font = UIFont(name: "TheMixArab-Bold", size: 14)

        self.tireSizeTitle.text = "Tire Size".localized
        self.tireSizeTitle.font = UIFont(name: "TheMixArab-Bold", size: 14)

        
        self.carTypeTF.attributedPlaceholder = NSAttributedString(string: "Choose Car Type".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "TheMixArab", size: 12 )!
            ])
        
        self.carBrandTF.attributedPlaceholder = NSAttributedString(string: "Brand".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "TheMixArab", size: 12 )!
            ])
        
        self.carModelTF.attributedPlaceholder = NSAttributedString(string: "Model".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "TheMixArab", size: 12 )!
            ])
        
        self.tireTypeTF.attributedPlaceholder = NSAttributedString(string: "Tire Size".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "TheMixArab", size: 12 )!
            ])
        
        self.widthTF.attributedPlaceholder = NSAttributedString(string: "Width".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "TheMixArab", size: 12 )!
            ])
        
        self.lengthTF.attributedPlaceholder = NSAttributedString(string: "Length".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "TheMixArab", size: 12 )!
            ])
        
        self.heightTF.attributedPlaceholder = NSAttributedString(string: "Height".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "TheMixArab", size: 12 )!
            ])
        
        self.showTiresBtn.setTitle("Show Tires".localized, for: .normal)
        self.showTiresBtn.titleLabel?.font = UIFont(name: "TheMixArab-Bold", size: 14 )
        
        self.widthTF.layer.borderWidth = 1.0
        self.widthTF.layer.borderColor = UIColor.darkGray.cgColor
        
        
        self.heightTF.layer.borderWidth = 1.0
        self.heightTF.layer.borderColor = UIColor.darkGray.cgColor
        
        
        self.lengthTF.layer.borderWidth = 1.0
        self.lengthTF.layer.borderColor = UIColor.darkGray.cgColor
        

    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
