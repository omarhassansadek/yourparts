
//
//  cartTableViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/17/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import Cosmos

class cartTableViewCell: UITableViewCell {

    @IBOutlet weak var roundCounterView: UIView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDesc: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var productPrice: UILabel!
    
    @IBOutlet weak var quantityTf: UITextField!
    
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
        

        
        self.roundCounterView.layer.cornerRadius = 12.5
        
        self.productName.font = UIFont(name: "Cairo-Bold", size: 13)

        
        self.productDesc.font = UIFont(name: "Cairo-SemiBold", size: 13)
        
        
        self.productPrice.font = UIFont(name: "Cairo-Bold", size: 16)

        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
