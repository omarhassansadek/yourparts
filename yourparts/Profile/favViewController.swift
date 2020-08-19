//
//  favViewController.swift
//  yourparts
//
//  Created by iMac1 on 8/10/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class favViewController: UIViewController {

    @IBOutlet weak var favSloginLbl: UILabel!
    @IBOutlet weak var favMainTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        self.navigationController?.navigationBar.tintColor = primaryColor

        self.favMainTitle.text = "المفضلة"
        self.favMainTitle.font = UIFont(name: "Cairo-Bold", size: 16)
        
        self.favSloginLbl.text = "لديك ٣ قطع في المفضلة"
        self.favSloginLbl.font = UIFont(name: "Cairo-SemiBold", size: 12)
        

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
