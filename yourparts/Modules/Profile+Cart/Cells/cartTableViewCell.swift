
//
//  cartTableViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/17/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import Cosmos
import BEMCheckBox

class cartTableViewCell: UITableViewCell {

    @IBOutlet weak var shipCheckBox: BEMCheckBox!
    @IBOutlet weak var fixCheckBox: BEMCheckBox!
    @IBOutlet weak var fixPrice: UILabel!
    @IBOutlet weak var favico: UIButton!
    @IBOutlet weak var brandimg: UIImageView!
    @IBOutlet weak var imgViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var imgViewContainer: UIView!
    @IBOutlet weak var lblTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var lblHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var productimage: UIImageView!
    @IBOutlet weak var checkBoxView: UIView!
    @IBOutlet weak var roundCounterView: UIView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDesc: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var productPrice: UILabel!
    
    @IBOutlet weak var quantityTf: UITextField!
    @IBOutlet weak var shipLbl: UILabel!
    @IBOutlet weak var fixLbl: UILabel!
    
    @IBOutlet weak var shippingView: UIView!
    @IBOutlet weak var installationView: UIView!
    @IBOutlet weak var shippingViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var installationViewHeightConstraint: NSLayoutConstraint!
    var pickerDataSourceDelegate : quantityPickerDelegate?

    var row: Int?
    
    var quantityPickerView = UIPickerView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
     //   self.productName.sizeToFit()
       // self.productName.numberOfLines = 0
        
//        self.quantityTf.inputView = quantityPickerView
        
        self.quantityTf.tintColor = .clear
        
        self.favico.isHidden = true

        
        self.roundCounterView.layer.cornerRadius = 12.5
        
        self.productName.font = UIFont(name: "Cairo-Bold", size: 13)

        
        self.productDesc.font = UIFont(name: "Cairo-SemiBold", size: 13)
        
        
        self.productPrice.font = UIFont(name: "Cairo-Bold", size: 17)

        self.shipLbl.font = UIFont(name: "Cairo-SemiBold", size: 15)

        self.fixLbl.font = UIFont(name: "Cairo-SemiBold", size: 15)

        self.fixPrice.font = UIFont(name: "Cairo-SemiBold", size: 15)

        self.shipLbl.text = "Ship in the same day".localized

        self.fixLbl.text = "Installation Service From".localized
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var addInstallation : (() -> Void)? = nil

    
    @IBAction func updateInstallationCost(_ sender: Any) {
        if let updateInstallClicked = self.addInstallation{
            updateInstallClicked()
        }
    }
    
    var addShippingOnSameDay : (() -> Void)? = nil

    @IBAction func updateShippingSameDay(_ sender: Any) {
        if let updateShipping = self.addShippingOnSameDay{
            updateShipping()
        }
    }
    
}

extension cartTableViewCell{
    
    func setPickerViewDataSourceDelegate(_ dataSourceDelegate: quantityPickerDelegate , forRow row:Int ){
        self.pickerDataSourceDelegate = dataSourceDelegate
        self.row = row
        quantityPickerView.delegate = self.pickerDataSourceDelegate
        quantityPickerView.dataSource = self.pickerDataSourceDelegate
        quantityPickerView.reloadAllComponents()
    }
 
}
