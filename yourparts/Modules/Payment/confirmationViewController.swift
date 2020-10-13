//
//  confirmationViewController.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/21/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class confirmationViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var confirmTableView: UITableView!
    
    
    override func viewDidLoad() {
        

        super.viewDidLoad()
        
        self.confirmTableView.delegate = self
        
        self.confirmTableView.dataSource = self

        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }

        
        self.navigationController?.navigationBar.tintColor = primaryColor
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationController?.navigationBar.barTintColor = anotherGreyColor
        
        self.title = "Confirmation".localized
        
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.black,
             NSAttributedString.Key.font: UIFont(name: "Cairo-Bold", size: 18)!]

        let nib = UINib(nibName: String(describing: confirmAddressTableViewCell.self), bundle: nil)
        self.confirmTableView.register(nib, forCellReuseIdentifier: "confirmCell")

        let nib2 = UINib(nibName: String(describing: paymentMethodTableViewCell.self), bundle: nil)
        self.confirmTableView.register(nib2, forCellReuseIdentifier: "payDetailCell")
        
        let nib3 = UINib(nibName: String(describing: cartTableViewCell.self), bundle: nil)
        self.confirmTableView.register(nib3, forCellReuseIdentifier: "cartCell")

        // Do any additional setup after loading the view.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
          return 1
      }
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return 4
      }
      
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
        if indexPath.row == 0{
            let confirmCell = tableView.dequeueReusableCell(withIdentifier: "confirmCell") as! confirmAddressTableViewCell

            return confirmCell

        }else if indexPath.row == 1{
            let payDetailCell = tableView.dequeueReusableCell(withIdentifier: "payDetailCell") as! paymentMethodTableViewCell

            return payDetailCell
        }else{
            let cartCell = tableView.dequeueReusableCell(withIdentifier: "cartCell") as! cartTableViewCell

            return cartCell

        }
     }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 195.0
        }else if indexPath.row == 1{
            return 125.0
        }else{
            return 215.0
        }
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
