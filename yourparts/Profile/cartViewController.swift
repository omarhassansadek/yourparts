//
//  cartViewController.swift
//  yourparts
//
//  Created by iMac1 on 8/10/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class cartViewController: UIViewController {

    @IBOutlet weak var cartSloginLbl: UILabel!
    @IBOutlet weak var mainTitleLbl: UILabel!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        self.navigationController?.navigationBar.tintColor = primaryColor

        
        self.mainTitleLbl.text = "عربة التسوق"
        self.mainTitleLbl.font = UIFont(name: "Cairo-Bold", size: 16)
        
        self.cartSloginLbl.text = "لديك ٣ قطع في عربة التسوق"
        self.cartSloginLbl.font = UIFont(name: "Cairo-SemiBold", size: 12)

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
