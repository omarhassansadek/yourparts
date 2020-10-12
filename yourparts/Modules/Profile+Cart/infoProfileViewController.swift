//
//  infoProfileViewController.swift
//  yourparts
//
//  Created by iMac1 on 6/28/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class infoProfileViewController: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var mobileLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mobileView: UIView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet var infoprofileVM : infoProfileViewModel!
    
    @IBOutlet weak var nameTf: UITextField!
    
    @IBOutlet weak var mobileTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configure()
        // Do any additional setup after loading the view.
    }
    
    func configure(){
        
        self.nameTf.delegate = self
        
        self.mobileTf.delegate = self
        
        self.nameView.layer.cornerRadius = 12.5

        self.mobileView.layer.cornerRadius = 12.5
        
        self.nameLbl.text = "Name".localized
        
        self.nameLbl.font = UIFont(name: "Cairo-SemiBold", size: 14 )

        self.mobileLbl.text = "Mobile Number".localized
              
        self.mobileLbl.font = UIFont(name: "Cairo-SemiBold", size: 14 )


        

        self.editBtn.setTitle("Edit your profile".localized, for: .normal)
        
        self.editBtn.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 14)
        
        self.editBtn.layer.cornerRadius = 15.0

        
        
        self.nameTf.attributedPlaceholder = NSAttributedString(string: "Name".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "Cairo-Semibold", size: 12 )!
        ])
        
        self.mobileTf.attributedPlaceholder = NSAttributedString(string: "Mobile Number".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "Cairo-Semibold", size: 12 )!
        ])
        
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        self.navigationController?.navigationBar.tintColor = primaryColor

        self.navigationController?.navigationBar.shadowImage = UIImage()

        self.navigationController?.navigationBar.barTintColor = anotherGreyColor

        self.title = "Settings".localized
        
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.black,
             NSAttributedString.Key.font: UIFont(name: "Cairo-Bold", size: 18)!]

//
//        self.infoprofileVM.getUserProfile( onSuccess: { (isSuccess) in
//            //
//            self.nameTf.text = "\(self.infoprofileVM.userProfile.firstname) \(self.infoprofileVM.userProfile.lastname)"
//            self.mobileTf.text = self.infoprofileVM.userProfile.phone_number ?? ""
//            self.emailTf.text = self.infoprofileVM.userProfile.email ?? ""
//
//           // self.jobTf.text = self.infoprofileVM.userProfile.
//        }) { (errormsg) in
//            //
//        }
 
    }
    
    @IBAction func changeInTfs(_ sender: UITextField) {
        self.editBtn.backgroundColor = primaryColor
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
