//
//  loginViewController.swift
//  yourparts
//
//  Created by iMac1 on 8/19/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {

    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var signinBtn: UIButton!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var signinLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.signinLbl.text = "Sign in".localized
        self.signinLbl.font = UIFont(name: "Cairo-Bold", size: 17)
        
        
        self.emailTf.attributedPlaceholder = NSAttributedString(string: "Email".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "Cairo-Semibold", size: 12 )!
            ])
        
        self.passwordTf.attributedPlaceholder = NSAttributedString(string: "Password".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "Cairo-Semibold", size: 12 )!
            ])
        
        self.signinBtn.layer.cornerRadius = 10.0
        self.signinBtn.setTitle("Sign in".localized, for: .normal)
        self.signinBtn.titleLabel?.font = UIFont(name: "Cairo-SemiBold", size: 14 )

        self.signupBtn.setTitle("Don't have an account? Sign up".localized, for: .normal)
        self.signupBtn.titleLabel?.font = UIFont(name: "Cairo-SemiBold", size: 14 )


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
