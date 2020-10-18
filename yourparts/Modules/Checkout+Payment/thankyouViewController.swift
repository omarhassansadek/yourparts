//
//  thankyouViewController.swift
//  yourparts
//
//  Created by Yourparts #1 on 10/18/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class thankyouViewController: UIViewController {

    @IBOutlet weak var closeView: UIView!
    @IBOutlet weak var roundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.roundView.layer.cornerRadius = 15.0

        self.closeView.layer.cornerRadius = self.closeView.frame.width / 2.0
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissVC(_ sender: Any) {
        self.performSegue(withIdentifier: "gotoHomePage", sender: self)
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
