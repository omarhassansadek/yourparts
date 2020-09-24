//
//  signupViewController.swift
//  yourparts
//
//  Created by iMac1 on 8/18/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class signupViewController: UIViewController {
    
    @IBOutlet weak var createAccImg: UIImageView!
    @IBOutlet weak var title3Lbl: UILabel!
    @IBOutlet weak var title2Lbl: UILabel!
    @IBOutlet weak var title1Lbl: UILabel!
    
    @IBOutlet weak var nameTf: UITextField!
    @IBOutlet weak var emailTf: UITextField!
    @IBOutlet weak var mobileTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var confirmPassTf: UITextField!
    
    @IBOutlet weak var activityindicatorView: NVActivityIndicatorView!
    
    var isUsernameFilled = false
    var isEmailFilled = false
    var isMobileFilled = false
    var isPasswordFilled = false
    var isConfirmPasswordFilled = false

    @IBOutlet weak var signupVM: signupViewModel!
    
    @IBOutlet weak var checkboxLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNeedsStatusBarAppearanceUpdate()
        
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
        
        
        self.confirmPassTf.attributedPlaceholder = NSAttributedString(string: "Confirm Password".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "Cairo-Regular", size: 12 )!
        ])
        
        
        self.mobileTf.attributedPlaceholder = NSAttributedString(string: "Mobile Number".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "Cairo-Regular", size: 12 )!
        ])
        
        self.nameTf.layer.cornerRadius = 15.0
        self.emailTf.layer.cornerRadius = 15.0
        self.passwordTf.layer.cornerRadius = 15.0
        self.confirmPassTf.layer.cornerRadius = 15.0
        self.mobileTf.layer.cornerRadius = 15.0

        
        self.nameTf.setLeftPaddingPoints(10)
        self.nameTf.setRightPaddingPoints(10)
        self.emailTf.setLeftPaddingPoints(10)
        self.emailTf.setRightPaddingPoints(10)
        self.passwordTf.setLeftPaddingPoints(10)
        self.passwordTf.setRightPaddingPoints(10)
        self.confirmPassTf.setLeftPaddingPoints(10)
        self.confirmPassTf.setRightPaddingPoints(10)
        self.mobileTf.setLeftPaddingPoints(10)
        self.mobileTf.setRightPaddingPoints(10)

        self.title1Lbl.text = "Create New Account".localized
        self.title1Lbl.font = UIFont(name: "Cairo-Bold", size: 18)
        
        self.title2Lbl.text = "Welcome to Your Parts".localized
        self.title2Lbl.font = UIFont(name: "Cairo-SemiBold", size: 14)
        
        
        self.title3Lbl.text = "Sign up to explore a world of car parts".localized
        self.title3Lbl.font = UIFont(name: "Cairo-Regular", size: 14)
        
        self.checkboxLbl.text = "أوافق على الشروط و الأحكام".localized
        self.checkboxLbl.font = UIFont(name: "Cairo-Regular", size: 11)
        
        
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func closePressedBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    @IBAction func signUserUp(){
        
        self.createAccImg.isHidden = true
        self.activityindicatorView.startAnimating()
        
        var username: String?
        if EmptyFieldValidator.isFieldEmpty(field: self.nameTf){
            username = String((self.nameTf.text)!)
            self.isUsernameFilled = true
        }
        
        var email: String?
        if EmptyFieldValidator.isFieldEmpty(field: self.emailTf){
            email = String((self.emailTf.text)!)
            self.isEmailFilled = true
        }
        
        var mobile: String?
        if EmptyFieldValidator.isFieldEmpty(field: self.mobileTf){
            mobile = String((self.mobileTf.text)!)
            self.isMobileFilled = true
        }
        
        var pass: String?
        if EmptyFieldValidator.isFieldEmpty(field: self.passwordTf){
            pass = String((self.passwordTf.text)!)
            self.isPasswordFilled = true
        }
        
        var confirmpass: String?
        if EmptyFieldValidator.isFieldEmpty(field: self.confirmPassTf){
            confirmpass = String((self.confirmPassTf.text)!)
            self.isConfirmPasswordFilled = true
        }
       
        if isUsernameFilled && isEmailFilled && isMobileFilled && isPasswordFilled && isConfirmPasswordFilled{
            
            
            if isValidEmail(testStr: email!){
                if (self.passwordTf.text?.count ?? 0 >= 6) {
                    
                    let userParameters: [String: String] = ["username" : username! , "email": email!, "password1" : pass! , "password2" : confirmpass!, "phone_number" : mobile! ]
                    
                    self.signupVM.registerUser(apiParameters: userParameters, onSuccess: { (isSuccess) in
                        //gotoHomePage
                        self.activityindicatorView.stopAnimating()
                        self.createAccImg.isHidden = false


                        self.performSegue(withIdentifier: "gotoHome", sender: self)
                        
                    }) { (errorMsg) in
                        //
                        self.createAccImg.isHidden = false
                        
                        AlertViewer().showAlertView(withMessage: "We encountered an error. Try agian later", onController: self)

                        self.activityindicatorView.stopAnimating()

                    }
                    
                    
                }else{
                    self.activityindicatorView.stopAnimating()
                    self.createAccImg.isHidden = false

                    AlertViewer().showAlertView(withMessage: "Password must be at least 6 characters", onController: self)
                }
            }else{
                self.activityindicatorView.stopAnimating()
                self.createAccImg.isHidden = false

                AlertViewer().showAlertView(withMessage: "Invalid email format", onController: self)
            }
            
            
            
        }else{
            AlertViewer().showAlertView(withMessage: "All fields are required", onController: self)

        }

        
    }
    
}
