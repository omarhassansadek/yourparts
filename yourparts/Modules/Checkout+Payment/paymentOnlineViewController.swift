//
//  onlineViewController.swift
//  yourparts
//
//  Created by Yourparts #1 on 10/18/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import WebKit

class paymentOnlineViewController: UIViewController {

    var urlToCall: String?
    
    @IBOutlet weak var paymentWebView: WKWebView!
    
    @IBOutlet weak var closeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
       self.closeView.layer.cornerRadius = self.closeView.frame.width / 2.0

        if let topItem = self.navigationController?.navigationBar.topItem {
                  topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
              }

              
        self.navigationController?.navigationBar.tintColor = primaryColor
              
        self.navigationController?.navigationBar.shadowImage = UIImage()
              
        self.navigationController?.navigationBar.barTintColor = anotherGreyColor
              
        self.title = "Pay".localized
              
        self.navigationController?.navigationBar.titleTextAttributes =
                  [NSAttributedString.Key.foregroundColor: UIColor.black,
                   NSAttributedString.Key.font: UIFont(name: "Cairo-Bold", size: 18)!]

        self.paymentWebView.load(URLRequest(url: URL(string: urlToCall ?? "")! ))
        // Do any additional setup after loading the view.
    }
    

    @IBAction func dismissVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
