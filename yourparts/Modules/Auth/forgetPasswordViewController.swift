//
//  forgetPasswordViewController.swift
//  yourparts
//
//  Created by Yourparts #1 on 10/19/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class forgetPasswordViewController: UIViewController {
    
    @IBOutlet weak var vcTitle: UILabel!
    
    @IBOutlet weak var sendBtn: UIButton!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var emailTf: UITextField!
    
    @IBOutlet weak var emailView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        self.sendBtn.layer.cornerRadius = 12.5
        
        self.emailView.layer.cornerRadius = 12.5

        self.textView.text = "يٌرجى كتابة البريد الإلكترونى سيتم إرسال رابط إليك لتعديل كلمة المرور"
        
        self.textView.font = UIFont(name: "Cairo-Regular", size: 14)!

        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        self.navigationController?.navigationBar.tintColor = primaryColor

        self.navigationController?.navigationBar.shadowImage = UIImage()

        self.navigationController?.navigationBar.barTintColor = anotherGreyColor

        self.vcTitle.text = "Retrieve Password".localized
        
        self.vcTitle.font = UIFont(name: "Cairo-Bold", size: 18)!

        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.black,
             NSAttributedString.Key.font: UIFont(name: "Cairo-Bold", size: 18)!]
        
        self.emailTf.attributedPlaceholder = NSAttributedString(string: "example@email.com" , attributes: [
                 .foregroundColor: UIColor.darkGray,
                 .font: UIFont(name: "Cairo-SemiBold", size: 12 )!
             ])
        
        self.sendBtn.setTitle("Send".localized, for: .normal)
             
        self.sendBtn.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 14)



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
