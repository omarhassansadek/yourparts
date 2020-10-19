//
//  changePasswordViewController.swift
//  yourparts
//
//  Created by Yourparts #1 on 10/19/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class changePasswordViewController: UIViewController {

    @IBOutlet weak var confirmBtn: UIButton!
    
    @IBOutlet weak var currentView: UIView!
    @IBOutlet weak var newPassView: UIView!
    @IBOutlet weak var new2PassView: UIView!
    @IBOutlet weak var new2PassTf: UITextField!
    @IBOutlet weak var newPassTf: UITextField!
    @IBOutlet weak var currentPassTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        self.navigationController?.navigationBar.tintColor = primaryColor

        self.navigationController?.navigationBar.shadowImage = UIImage()

        self.navigationController?.navigationBar.barTintColor = anotherGreyColor

        self.title = "Change Password".localized
        
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.black,
             NSAttributedString.Key.font: UIFont(name: "Cairo-Bold", size: 18)!]

        self.confirmBtn.setTitle("Confirmation".localized, for: .normal)
             
        self.confirmBtn.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 14)
             
        self.confirmBtn.layer.cornerRadius = 15.0

        self.currentView.layer.cornerRadius = 12.5

        self.newPassView.layer.cornerRadius = 12.5

        self.new2PassView.layer.cornerRadius = 12.5

        self.currentPassTf.attributedPlaceholder = NSAttributedString(string: "Current Password".localized , attributes: [
                 .foregroundColor: UIColor.darkGray,
                 .font: UIFont(name: "Cairo-SemiBold", size: 12 )!
             ])

        self.newPassTf.attributedPlaceholder = NSAttributedString(string: "New Password".localized , attributes: [
                 .foregroundColor: UIColor.darkGray,
                 .font: UIFont(name: "Cairo-SemiBold", size: 12 )!
             ])

        
        self.new2PassTf.attributedPlaceholder = NSAttributedString(string: "Confirm New Password".localized , attributes: [
                 .foregroundColor: UIColor.darkGray,
                 .font: UIFont(name: "Cairo-SemiBold", size: 12 )!
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
