//
//  loginViewController.swift
//  yourparts
//
//  Created by iMac1 on 8/19/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import  NVActivityIndicatorView


class loginViewController: UIViewController {
    
    @IBOutlet weak var activityindicator: NVActivityIndicatorView!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var signinBtn: UIButton!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var signinLbl: UILabel!
    
    @IBOutlet weak var loginVM: loginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNeedsStatusBarAppearanceUpdate()
        
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
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    @IBAction func loginUser(){
        
        self.signinBtn.setTitle("", for: .normal)
        self.activityindicator.startAnimating()
        
        if self.emailTf.text == nil || self.passwordTf.text == nil || self.emailTf.text == "" || self.passwordTf.text == ""{
            
            self.activityindicator.stopAnimating()
            self.signinBtn.setTitle( "Sign in".localized, for: .normal)

            AlertViewer().showAlertView(withMessage: "Email and Password are required", onController: self)
            
            
        }else{
            
            if Connectivity.isConnectedToInternet(){
                
                let apiParameters = ["email" : self.emailTf.text! , "password" : self.passwordTf.text!]
                self.loginVM.loginUsr(apiParameters: apiParameters, onSuccess: { (isSuccess) in
                    //
                    if isSuccess{
                        self.activityindicator.stopAnimating()
                        self.signinBtn.setTitle( "Sign in".localized, for: .normal)

                        self.performSegue(withIdentifier: "gotoHomeFromLogin", sender: self)
                    }
                    
                }) { (errMsg) in
                    //
                    self.activityindicator.stopAnimating()
                    self.signinBtn.setTitle( "Sign in".localized, for: .normal)

                    AlertViewer().showAlertView(withMessage: errMsg, onController: self)
                }
            }
            
        }
    }
    
}
