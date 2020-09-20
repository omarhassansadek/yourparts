//
//  infoProfileViewController.swift
//  yourparts
//
//  Created by iMac1 on 6/28/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class infoProfileViewController: UIViewController {

    @IBOutlet weak var nameTf: UITextField!
    
    @IBOutlet weak var mobileTf: UITextField!
    
    @IBOutlet weak var emailTf: UITextField!
    
    @IBOutlet weak var jobTf: UITextField!
    
    @IBOutlet weak var profileimg: UIImageView!
   
    @IBOutlet weak var editBtn: UIButton!
  
    @IBOutlet var labelsArr: [UILabel]!

    @IBOutlet var infoprofileVM : infoProfileViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configure()
        // Do any additional setup after loading the view.
    }
    
    func configure(){
        
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        
        self.infoprofileVM.getUserProfile( onSuccess: { (isSuccess) in
            //
            self.nameTf.text = "\(self.infoprofileVM.userProfile.firstname) \(self.infoprofileVM.userProfile.lastname)"
            self.mobileTf.text = self.infoprofileVM.userProfile.phone_number ?? ""
            self.emailTf.text = self.infoprofileVM.userProfile.email ?? ""

           // self.jobTf.text = self.infoprofileVM.userProfile.
        }) { (errormsg) in
            //
        }
        self.navigationController?.navigationBar.tintColor = primaryColor
        for lbl in labelsArr{
            lbl.font = UIFont(name: "TheMixArab", size: 13)
            lbl.textColor = UIColor.gray
        }
        
        self.profileimg.layer.cornerRadius = 50.0
   
        self.editBtn.layer.cornerRadius = 15.0
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
