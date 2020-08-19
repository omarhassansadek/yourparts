//
//  signupViewController.swift
//  yourparts
//
//  Created by iMac1 on 8/18/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class signupViewController: UIViewController {

    @IBOutlet weak var title3Lbl: UILabel!
    @IBOutlet weak var title2Lbl: UILabel!
    @IBOutlet weak var title1Lbl: UILabel!
    
    @IBOutlet weak var nameTf: UITextField!
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    
    @IBOutlet weak var signupVM: signupViewModel!
    
    @IBOutlet weak var checkboxLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameTf.attributedPlaceholder = NSAttributedString(string: "Name".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "Cairo-Regular", size: 12 )!
            ])
        
        self.emailTf.attributedPlaceholder = NSAttributedString(string: "Email".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "Cairo-Regular", size: 12 )!
            ])
        
        self.passwordTf.attributedPlaceholder = NSAttributedString(string: "Password".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "Cairo-Regular", size: 12 )!
            ])
        
        

        self.title1Lbl.text = "Create New Account".localized
        self.title1Lbl.font = UIFont(name: "Cairo-Bold", size: 18)

        self.title2Lbl.text = "Welcome to Your Parts".localized
        self.title2Lbl.font = UIFont(name: "Cairo-SemiBold", size: 14)

        
        self.title3Lbl.text = "Sign up to explore a world of car parts".localized
        self.title3Lbl.font = UIFont(name: "Cairo-Regular", size: 14)
        
        self.checkboxLbl.text = "أوافق على الشروط و الأحكام".localized
        self.checkboxLbl.font = UIFont(name: "Cairo-Regular", size: 11)

        

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
