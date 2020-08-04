//
//  ViewController.swift
//  yourparts
//
//  Created by iMac1 on 6/15/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import MOLH

class ViewController: UIViewController {

    @IBOutlet weak var welcomeLbl: UILabel!
 
    override func viewDidLoad() {
        super.viewDidLoad()
 
        for family: String in UIFont.familyNames
        {
            print(family)
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
        
        //unselected state tint
        self.tabBarController?.tabBar.unselectedItemTintColor = greyColor
        
        
        //change tab bar font
        if MOLHLanguage.isArabic() {
            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "TheMixArab-Bold", size: 10)!], for: .normal)
            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "TheMixArab-Bold", size: 10)!], for: .selected)

        }
        
        //Logo in navBar
        let logo = UIImage(named: "navLogo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView

       
        
       
    }


}

