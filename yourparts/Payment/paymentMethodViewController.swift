//
//  paymentMethodViewController.swift
//  yourparts
//
//  Created by iMac1 on 9/21/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class paymentMethodViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var paymentMethodTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.paymentMethodTableView.delegate = self
        self.paymentMethodTableView.dataSource = self
        
        
        let nib = UINib(nibName: String(describing: methodTableViewCell.self), bundle: nil)
        self.paymentMethodTableView.register(nib, forCellReuseIdentifier: "methodCell")
        
        let nib2 = UINib(nibName: String(describing: addAddressTableViewCell.self), bundle: nil)
        self.paymentMethodTableView.register(nib2, forCellReuseIdentifier: "AddAddressCell")
        
        
        self.navigationController?.navigationBar.tintColor = primaryColor
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationController?.navigationBar.barTintColor = anotherGreyColor
        
        self.title = "Payment Method".localized
        
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.black,
             NSAttributedString.Key.font: UIFont(name: "Cairo-Bold", size: 18)!]
        
        //AddAddressCell
        
        
    
        // Do any additional setup after loading the view.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 3{
            
            let addAddressCell = tableView.dequeueReusableCell(withIdentifier: "AddAddressCell") as! addAddressTableViewCell
            addAddressCell.addAddress = {
                self.performSegue(withIdentifier: "gotoAddAddress", sender: self)
            }
            
            addAddressCell.addAddressBtn.setTitle("Choose Payment Method".localized, for: .normal)

            return addAddressCell
            
        }else{
            let methodCell = tableView.dequeueReusableCell(withIdentifier: "methodCell") as! methodTableViewCell
            switch indexPath.row{
                case 0:
                    methodCell.methodico.image = UIImage(named: "methodico1")
                case 1:
                    methodCell.methodico.image = UIImage(named: "methodico2")
                case 2:
                    methodCell.methodico.image = UIImage(named: "methodico3")

                default:
                  break
                }
            return methodCell
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 2{
            return 135.0
        }else{
            return 65.0
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
