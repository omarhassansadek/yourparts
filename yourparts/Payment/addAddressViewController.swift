//
//  addAddressViewController.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/20/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class addAddressViewController: UIViewController {

    @IBOutlet weak var appartmentTf: UITextField!
    @IBOutlet weak var floorNoTf: UITextField!
    @IBOutlet weak var buildingNoTf: UITextField!
    @IBOutlet weak var streetTf: UITextField!
    @IBOutlet weak var regionTf: UITextField!
    @IBOutlet weak var cityTf: UITextField!
    
    @IBOutlet weak var addAddressLbl: UILabel!
    
    @IBOutlet weak var handlerView: UIView!
    
    @IBOutlet var roundViews: [UIView]!
    
    @IBOutlet weak var addAddressBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // self.preferredContentSize = CGSize(width: self.view.frame.width , height: 100)
        
        self.handlerView.layer.cornerRadius = 5.0
        
        for oneView in roundViews{
            oneView.layer.cornerRadius = 15.0
        }

        
        self.addAddressLbl.text = "Add Address".localized
        
        self.addAddressLbl.font = UIFont(name: "Cairo-Bold", size: 16)

        
        
        self.cityTf.attributedPlaceholder = NSAttributedString(string: "City".localized , attributes: [
                  .foregroundColor: UIColor.darkGray,
                  .font: UIFont(name: "Cairo-Regular", size: 12 )!
              ])
              
        
        self.regionTf.attributedPlaceholder = NSAttributedString(string: "Region".localized , attributes: [
                  .foregroundColor: UIColor.darkGray,
                  .font: UIFont(name: "Cairo-Regular", size: 12 )!
              ])
              
        
        self.streetTf.attributedPlaceholder = NSAttributedString(string: "Street".localized , attributes: [
                  .foregroundColor: UIColor.darkGray,
                  .font: UIFont(name: "Cairo-Regular", size: 12 )!
              ])
              
        self.buildingNoTf.attributedPlaceholder = NSAttributedString(string: "Building".localized , attributes: [
                  .foregroundColor: UIColor.darkGray,
                  .font: UIFont(name: "Cairo-Regular", size: 12 )!
              ])
              
        
        self.floorNoTf.attributedPlaceholder = NSAttributedString(string: "Floor".localized , attributes: [
                        .foregroundColor: UIColor.darkGray,
                        .font: UIFont(name: "Cairo-Regular", size: 12 )!
                    ])
        
        
        self.appartmentTf.attributedPlaceholder = NSAttributedString(string: "Appartment".localized , attributes: [
                                    .foregroundColor: UIColor.darkGray,
                                    .font: UIFont(name: "Cairo-Regular", size: 12 )!
                                ])
        
        self.addAddressBtn.layer.cornerRadius = 20.0
        self.addAddressBtn.setTitle("Save Address".localized, for: .normal)
        self.addAddressBtn.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 14)

                                
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
