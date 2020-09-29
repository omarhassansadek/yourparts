//
//  addCarViewController.swift
//  yourparts
//
//  Created by iMac1 on 7/8/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class addCarViewController: UIViewController {

    @IBOutlet weak var yearModel: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var brandLbl: UILabel!
    @IBOutlet weak var addNewCarBtn: UIButton!
    @IBOutlet weak var yearManuTF: UITextField!
    @IBOutlet weak var chooseModelTF: UITextField!
    @IBOutlet weak var chooseBrandTF: UITextField!
    @IBOutlet weak var chooseType: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        self.navigationController?.navigationBar.tintColor = primaryColor
        
        
        self.navigationController?.navigationBar.shadowImage = UIImage()

        self.navigationController?.navigationBar.barTintColor = anotherGreyColor

        self.title = "Add your car".localized
               
        self.navigationController?.navigationBar.titleTextAttributes =
                   [NSAttributedString.Key.foregroundColor: UIColor.black,
                    NSAttributedString.Key.font: UIFont(name: "Cairo-Bold", size: 18)!]
        
        
        self.addNewCarBtn.layer.cornerRadius = 15.0
        self.addNewCarBtn.setTitle("Add Car".localized, for: .normal)
        self.addNewCarBtn.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 16)
        
        self.modelLbl.text = "Choose Model".localized
        self.modelLbl.font = UIFont(name: "Cairo-SemiBold", size: 14 )
        
        self.typeLbl.text = "Choose Type".localized
        self.typeLbl.font = UIFont(name: "Cairo-SemiBold", size: 14 )

        
        self.brandLbl.text = "Choose Brand".localized
        self.brandLbl.font = UIFont(name: "Cairo-SemiBold", size: 14 )

        
        self.yearModel.text = "Manufacture Year".localized
        self.yearModel.font = UIFont(name: "Cairo-SemiBold", size: 14 )


        for oneView in roundViews{
            oneView.layer.cornerRadius = 12.5
        }
        
//
//        self.chooseType.attributedPlaceholder = NSAttributedString(string: "Choose Type".localized , attributes: [
//            .foregroundColor: UIColor.darkGray,
//            .font: UIFont(name: "TheMixArab", size: 14 )!
//            ])
//
//        self.chooseBrandTF.attributedPlaceholder = NSAttributedString(string: "Choose Brand".localized , attributes: [
//            .foregroundColor: UIColor.darkGray,
//            .font: UIFont(name: "TheMixArab", size: 14 )!
//            ])
//
//        self.chooseModelTF.attributedPlaceholder = NSAttributedString(string: "Choose Model".localized , attributes: [
//            .foregroundColor: UIColor.darkGray,
//            .font: UIFont(name: "TheMixArab", size: 14 )!
//            ])
//
//        self.yearManuTF.attributedPlaceholder = NSAttributedString(string: "Manufacture Year".localized , attributes: [
//            .foregroundColor: UIColor.darkGray,
//            .font: UIFont(name: "TheMixArab", size: 14 )!
//            ])
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBOutlet var roundViews: [UIView]!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
