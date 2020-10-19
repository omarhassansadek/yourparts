//
//  profileHeaderTableViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/22/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class profileHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var favLbl: UILabel!
    @IBOutlet weak var cartLbl: UILabel!
    @IBOutlet weak var favNumberLbl: UILabel!
    @IBOutlet weak var cartNumberLbl: UILabel!
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userViewImg: UIView!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var contentViewHeader: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.userViewImg.layer.borderColor = UIColor.white.cgColor
        self.userViewImg.layer.borderWidth = 3.0
        
        
        self.userViewImg.layer.cornerRadius = self.userViewImg.frame.width / 2.0
        
        self.userImg.layer.cornerRadius = self.userImg.layer.cornerRadius / 2.0
        
        self.favNumberLbl.font = UIFont(name: "Cairo-Bold", size: 27)
        self.cartNumberLbl.font = UIFont(name: "Cairo-Bold", size: 27)

        self.favLbl.font = UIFont(name: "Cairo-Regular", size: 13)
        self.cartLbl.font = UIFont(name: "Cairo-Regular", size: 13)

        self.favLbl.font = UIFont(name: "Cairo-Regular", size: 13)
        self.cartLbl.font = UIFont(name: "Cairo-Regular", size: 13)
        
        self.favLbl.text = "Peices in Favorites".localized
        self.cartLbl.text = "Peices in Cart".localized

        
        self.contentViewHeader.layer.cornerRadius = 20.0
        self.contentViewHeader.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        self.contentViewHeader.clipsToBounds = true
        

        
        self.favLbl.font = UIFont(name: "Cairo-Regular", size: 11)
        self.cartLbl.font = UIFont(name: "Cairo-Regular", size: 11)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var cartBtnClicked : (() -> Void)? = nil

    @IBAction func gotoCart(_ sender: Any) {
        if let cartClicked = self.cartBtnClicked{
            cartClicked()
        }
    }
    
    var goSettings : (() -> Void)? = nil

    @IBAction func gotoSettings(_ sender: Any) {
        if let settingsBtnClicked = self.goSettings{
            settingsBtnClicked()
        }
    }
}
