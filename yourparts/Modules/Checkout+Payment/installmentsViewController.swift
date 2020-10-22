//
//  installmentsViewController.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/21/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class installmentsViewController: UIViewController {

    @IBOutlet weak var roundView: UIView!
    
    
    @IBOutlet weak var valuBtn: UIButton!
    
    @IBOutlet weak var bankBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.roundView.layer.cornerRadius = 15.0
        
        self.navigationItem.hidesBackButton = false

        self.navigationController?.navigationBar.tintColor = primaryColor
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationController?.navigationBar.barTintColor = anotherGreyColor
        
        self.title = "Installment Type".localized
        
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.black,
             NSAttributedString.Key.font: UIFont(name: "Cairo-Bold", size: 18)!]
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }

        self.valuBtn.backgroundColor = primaryColor
        self.valuBtn.layer.cornerRadius = 12.5
        self.valuBtn.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 13) 
        self.valuBtn.setTitleColor(UIColor.white, for: .normal)
        self.valuBtn.setTitle("Installment using valu".localized, for: .normal)

        self.bankBtn.backgroundColor = primaryColor
        self.bankBtn.layer.cornerRadius = 12.5
        self.bankBtn.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 13)
        self.bankBtn.setTitleColor(UIColor.white, for: .normal)
        self.bankBtn.setTitle("Installment By Bank".localized, for: .normal)


        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = true

        self.navigationController?.navigationBar.tintColor = UIColor.black

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
