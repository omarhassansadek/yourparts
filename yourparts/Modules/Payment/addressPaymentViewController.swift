//
//  addressPaymentViewController.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/20/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class addressPaymentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var receivingMethodsView: UIView!
    @IBOutlet weak var fixerLbl: UILabel!
    @IBOutlet weak var homeLbl: UILabel!
    @IBOutlet weak var addressTableViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var indView: UIView!
    @IBOutlet weak var indviewheightConstraint: NSLayoutConstraint!
    @IBOutlet weak var activityind: NVActivityIndicatorView!
    @IBOutlet weak var addressTableView: UITableView!
    @IBOutlet weak var addViewBtn: UIButton!
    @IBOutlet weak var noAddressLbl: UILabel!
    @IBOutlet weak var addAddressView: UIView!
    
    @IBOutlet var AddressVM: AddressViewModel!
    
    @IBOutlet weak var chooseLocLbl: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        self.getAddresses()
    }
    
    var isComingFromProfile: Bool?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.isComingFromProfile ?? false{
            self.receivingMethodsView.isHidden = true
            self.chooseLocLbl.isHidden = false
            self.addressTableView.isHidden = false
            self.indviewheightConstraint.constant = 0
            self.indView.layoutIfNeeded()
            self.addressTableViewTopConstraint.constant = 15
            self.addressTableView.layoutIfNeeded()

        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadAddresses), name: Notification.Name("finishAddAddress"), object: nil)

        
        let nib = UINib(nibName: String(describing: addressTableViewCell.self), bundle: nil)
        self.addressTableView.register(nib, forCellReuseIdentifier: "addressCell")

        let nib2 = UINib(nibName: String(describing: addAddressTableViewCell.self), bundle: nil)
        self.addressTableView.register(nib2, forCellReuseIdentifier: "AddAddressCell")

        
        self.navigationController?.navigationBar.tintColor = primaryColor

        self.navigationController?.navigationBar.shadowImage = UIImage()

        self.navigationController?.navigationBar.barTintColor = anotherGreyColor

        
        self.title = "Delivery Address".localized
        
        self.homeLbl.text = "Receive from home".localized
        
        self.fixerLbl.text = "Receive from yourfixers branch".localized

        self.homeLbl.font = UIFont(name: "Cairo-SemiBold", size: 14)!

        self.fixerLbl.font = UIFont(name: "Cairo-SemiBold", size: 14)!


        
        if !(self.isComingFromProfile ?? false) {
            self.chooseLocLbl.text = "Choose Location".localized
            self.chooseLocLbl.font = UIFont(name: "Cairo-Bold", size: 14)!
        }else{
            self.chooseLocLbl.text = ""
        }

        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.black,
             NSAttributedString.Key.font: UIFont(name: "Cairo-Bold", size: 18)!]

        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }

        //AddAddressCell

        
        self.noAddressLbl.text = "There is no address saved".localized
        
        self.noAddressLbl.font = UIFont(name: "Cairo-Regular", size: 19)

        self.addViewBtn.setTitle("Add Address".localized, for: .normal)
        
        self.addViewBtn.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 14)
        
        self.addViewBtn.layer.cornerRadius = 15.0

        // Do any additional setup after loading the view.
    }
    
    func getAddresses(){
        self.activityind.startAnimating()

        self.AddressVM.getUserAddress(onSuccess: { (isSuccess) in
            //
            
            if isSuccess{
                
                self.addressTableView.delegate = self
                self.addressTableView.dataSource = self

                if self.AddressVM.addressArr.count > 0{
                    self.addAddressView.isHidden = true

                    self.activityind.stopAnimating()

                    self.addressTableView.reloadData()

                }else{
                    self.addAddressView.isHidden = false
                }
            }
            
        }) { (errMsg) in
            //
            self.addAddressView.isHidden = false

            self.activityind.stopAnimating()

        }
    }
    

    @IBAction func addViewBtnClicked(_ sender: Any) {
        //self.addAddressView.layer.isHidden = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.AddressVM.addressArr.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row == self.AddressVM.addressArr.count{
            let addAddressCell = tableView.dequeueReusableCell(withIdentifier: "AddAddressCell") as! addAddressTableViewCell
            addAddressCell.addAddress = {
                self.performSegue(withIdentifier: "gotoAddAddress", sender: self)
            }
            return addAddressCell

        }else{
            let addressCell = tableView.dequeueReusableCell(withIdentifier: "addressCell") as! addressTableViewCell
            //addressCell.chooseAddressCheckBox.On
            addressCell.buildingNo.text = self.AddressVM.addressArr[indexPath.row].address
            //addressCell.appartmentNo.text = self.AddressVM.addressArr[indexPath.row - 1].address
            addressCell.region.text = "\(self.AddressVM.addressArr[indexPath.row].city ?? "") - \(self.AddressVM.addressArr[indexPath.row].region ?? "")"
            return addressCell

        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != 2{
            if !(self.isComingFromProfile ?? false){
                self.performSegue(withIdentifier: "gotoSecondPaymentView", sender: self)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 2{
            return 115.0
        }else{
            return 115.0
        }

    }
    
    @objc func reloadAddresses(notification: Notification) {
        self.getAddresses()

    }

    
    @IBAction func receiveFromHomeClicked(_ sender: Any) {
        //self.receivingMethodsView.isHidden = false
   
        UIView.animate(withDuration: 5.5, delay: 0.0, options: .allowAnimatedContent, animations: {
            self.chooseLocLbl.isHidden = false
            self.receivingMethodsView.isHidden = true
            self.addressTableView.isHidden = false

        }) { _ in
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
