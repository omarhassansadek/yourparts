//
//  filterItemsTableViewCell.swift
//  yourparts
//
//  Created by iMac1 on 7/28/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class filterItemsTableViewCell: UITableViewCell {

    @IBOutlet weak var homeCountryTF: UITextField!
    @IBOutlet weak var subDepTF: UITextField!
    @IBOutlet weak var mainDepTF: UITextField!
    @IBOutlet weak var manufacTF: UITextField!
    @IBOutlet weak var modelTF: UITextField!
    @IBOutlet weak var brandTF: UITextField!
    @IBOutlet weak var typeTF: UITextField!
    @IBOutlet weak var filterSubtitle3: UILabel!
    @IBOutlet weak var filterSubtitle2: UILabel!
    @IBOutlet weak var filterSubtitle1: UILabel!
    @IBOutlet weak var filterTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.filterTitle.text = "Advanced Search Internal and External Parts".localized
        self.filterTitle.font = UIFont(name: "TheMixArab-Bold", size: 14)
        
        self.filterSubtitle1.text = "Choose Car Info".localized
        self.filterSubtitle1.font = UIFont(name: "TheMixArab", size: 12)
        
        self.filterSubtitle2.text = "Choose Main and Far3y".localized
        self.filterSubtitle2.font = UIFont(name: "TheMixArab", size: 12)
//
        self.filterSubtitle3.text = "Price".localized
        self.filterSubtitle3.font = UIFont(name: "TheMixArab", size: 12)
//
//        
        self.typeTF.attributedPlaceholder = NSAttributedString(string: "Choose Type".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "TheMixArab", size: 12 )!
            ])
        
        self.brandTF.attributedPlaceholder = NSAttributedString(string: "Choose Brand".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "TheMixArab", size: 12 )!
            ])
        
        self.modelTF.attributedPlaceholder = NSAttributedString(string: "Choose Model".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "TheMixArab", size: 12 )!
            ])
        
        self.manufacTF.attributedPlaceholder = NSAttributedString(string: "Manufacture Year".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "TheMixArab", size: 12 )!
            ])
        
        self.mainDepTF.attributedPlaceholder = NSAttributedString(string: "Choose Main Dep.".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "TheMixArab", size: 12 )!
            ])
        
        self.subDepTF.attributedPlaceholder = NSAttributedString(string: "Choose Sub Dep.".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "TheMixArab", size: 12 )!
            ])
        
        self.homeCountryTF.attributedPlaceholder = NSAttributedString(string: "Choose Home Country".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "TheMixArab", size: 12 )!
            ])
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
