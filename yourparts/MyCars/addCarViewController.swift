//
//  addCarViewController.swift
//  yourparts
//
//  Created by iMac1 on 7/8/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class addCarViewController: UIViewController {

    @IBOutlet weak var yearManuTF: UITextField!
    @IBOutlet weak var chooseModelTF: UITextField!
    @IBOutlet weak var chooseBrandTF: UITextField!
    @IBOutlet weak var chooseType: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.chooseType.attributedPlaceholder = NSAttributedString(string: "Choose Type".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "TheMixArab", size: 14 )!
            ])

        self.chooseBrandTF.attributedPlaceholder = NSAttributedString(string: "Choose Brand".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "TheMixArab", size: 14 )!
            ])
        
        self.chooseModelTF.attributedPlaceholder = NSAttributedString(string: "Choose Model".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "TheMixArab", size: 14 )!
            ])
        
        self.yearManuTF.attributedPlaceholder = NSAttributedString(string: "Manufacture Year".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "TheMixArab", size: 14 )!
            ])
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
