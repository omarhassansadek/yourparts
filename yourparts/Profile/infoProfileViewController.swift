//
//  infoProfileViewController.swift
//  yourparts
//
//  Created by iMac1 on 6/28/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class infoProfileViewController: UIViewController {

    @IBOutlet weak var profileimg: UIImageView!
   
    @IBOutlet weak var editBtn: UIButton!
  
    @IBOutlet var labelsArr: [UILabel]!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configure()
        // Do any additional setup after loading the view.
    }
    
    func configure(){
        
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
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
