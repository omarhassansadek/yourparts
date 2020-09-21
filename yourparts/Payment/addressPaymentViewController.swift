//
//  addressPaymentViewController.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/20/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class addressPaymentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var addressTableView: UITableView!
    @IBOutlet weak var addViewBtn: UIButton!
    @IBOutlet weak var noAddressLbl: UILabel!
    @IBOutlet weak var addAddressView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addressTableView.delegate = self
        self.addressTableView.dataSource = self
        
        let nib = UINib(nibName: String(describing: addressTableViewCell.self), bundle: nil)
        self.addressTableView.register(nib, forCellReuseIdentifier: "addressCell")

        let nib2 = UINib(nibName: String(describing: addAddressTableViewCell.self), bundle: nil)
        self.addressTableView.register(nib2, forCellReuseIdentifier: "AddAddressCell")

        
        self.navigationController?.navigationBar.tintColor = primaryColor

        self.navigationController?.navigationBar.shadowImage = UIImage()

        self.navigationController?.navigationBar.barTintColor = anotherGreyColor

        self.title = "Delivery Address".localized
        
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.black,
             NSAttributedString.Key.font: UIFont(name: "Cairo-Bold", size: 18)!]

        //AddAddressCell

        
        self.noAddressLbl.text = "There is no address saved".localized
        
        self.noAddressLbl.font = UIFont(name: "Cairo-Regular", size: 19)

        self.addViewBtn.setTitle("Add Address".localized, for: .normal)
        
        self.addViewBtn.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 14)
        
        self.addViewBtn.layer.cornerRadius = 15.0

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addViewBtnClicked(_ sender: Any) {
        //self.addAddressView.layer.isHidden = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 2{
            let addAddressCell = tableView.dequeueReusableCell(withIdentifier: "AddAddressCell") as! addAddressTableViewCell
            addAddressCell.addAddress = {
                self.performSegue(withIdentifier: "gotoAddAddress", sender: self)
            }
            return addAddressCell

        }else{
            let addressCell = tableView.dequeueReusableCell(withIdentifier: "addressCell") as! addressTableViewCell
            return addressCell

        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 2{
            return 135.0
        }else{
            return 135.0
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