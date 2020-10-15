//
//  paymentMethodViewController.swift
//  yourparts
//
//  Created by iMac1 on 9/21/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import BEMCheckBox

class paymentMethodViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var checkico: UIImageView!
    @IBOutlet weak var dimmedView: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var textViewLbl: UITextView!
    @IBOutlet weak var paymentMethodTableView: UITableView!
    @IBOutlet var paymentVM: paymentViewModel!
    var orderId: Int?
    var orderItemId: Int?
    var orderDic: [String: Any]?
    var cartId: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.alertView.layer.cornerRadius = 15.0
        
        self.textViewLbl.text = "Click to make sure to pay when received".localized
        self.textViewLbl.font = UIFont(name: "Cairo-Regular", size: 14)!
        
        
        self.saveBtn.setTitle("Continue".localized, for: .normal)
        
        self.saveBtn.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 14)
        
        self.saveBtn.layer.cornerRadius = 12.5
        
        
        self.cancelBtn.setTitle("Cancel".localized, for: .normal)
        
        self.cancelBtn.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 14)
        
        self.cancelBtn.layer.cornerRadius = 12.5

        
        

        
        self.paymentMethodTableView.delegate = self
        self.paymentMethodTableView.dataSource = self
        
        
        
        let nib = UINib(nibName: String(describing: methodTableViewCell.self), bundle: nil)
        self.paymentMethodTableView.register(nib, forCellReuseIdentifier: "methodCell")
        
        let nib2 = UINib(nibName: String(describing: addAddressTableViewCell.self), bundle: nil)
        self.paymentMethodTableView.register(nib2, forCellReuseIdentifier: "AddAddressCell")
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }

        
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
    
    var selectedMethod = 0
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      
        
        if indexPath.row == 3{
            
            let addAddressCell = tableView.dequeueReusableCell(withIdentifier: "AddAddressCell") as! addAddressTableViewCell
            addAddressCell.addAddress = {
                
                //var params: [String: Any] = [:]
                self.orderDic = [:]
                self.orderDic?["payment_method"] = self.selectedMethod
                
                self.paymentVM.patchOrder(id: self.orderId ?? -1, apiParameters: self.orderDic ?? [:] , onSuccess: { (isSuccess) in
                    //
                    
                    var createDic: [String: Any] = [:]
                    createDic["cart_id"] = self.cartId ?? -1
                    createDic["order_id"] = self.orderItemId ?? -1
                    
                    self.paymentVM.createOrderItem(apiParameters: createDic, onSuccess: { (isSucees) in
                        //
                        self.performSegue(withIdentifier: "gotoConfirmVC", sender: self)

                    }) { (errMsg) in
                        AlertViewer().showAlertView(withMessage: errMsg, onController: self)

                    }

                }) { (errMsg) in
                    //
                    AlertViewer().showAlertView(withMessage: errMsg, onController: self)
                }
                
                
            }
            addAddressCell.addAddressBtn.setTitle("Choose Payment Method".localized, for: .normal)
            return addAddressCell
            
        }else{
            
            let methodCell = tableView.dequeueReusableCell(withIdentifier: "methodCell") as! methodTableViewCell
            switch indexPath.row{
                case 0:
                    methodCell.methodico.image = UIImage(named: "methodico1")
                    methodCell.methodname.text = "الدفع عند الاستلام"
                    
                case 1:
                    methodCell.methodico.image = UIImage(named: "methodico2")
                    methodCell.methodname.text = "فيزا"

                case 2:
                    methodCell.methodico.image = UIImage(named: "methodico3")
                    methodCell.methodname.text = "تقسيط"

                default:
                  break
                }
            
            methodCell.chooseMethodSelect = {
                //func
                self.selectedMethod = indexPath.row
                
                for (index, box) in self.arrayBox.enumerated(){
                    if index == indexPath.row{
                        self.arrayBox[index] = true
                    }else{
                        self.arrayBox[index] = false
                    }
                }
                
                self.paymentMethodTableView.reloadData()
            }
            
            methodCell.methodBox.on = arrayBox[indexPath.row]
            
                  
            return methodCell
            
        }
    }
    
    
    var arrayBox: [Bool] = [false, false, false]
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 3{
            return 135.0
        }else{
            return 65.0
        }
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoConfirmVC"{
            let destCont = segue.destination as! confirmationViewController
            destCont.orderId = self.orderId ?? -1
        }
    }
    @IBAction func saveBtnClicked(_ sender: Any) {
        
     
        UIView.animate(withDuration: 1.5, animations: {
            self.dimmedView.isHidden = true
            self.alertView.isHidden = true
        }) { (isSuccess) in
            //
            self.performSegue(withIdentifier: "gotoConfirmVC", sender: self)
        }
        //self.textViewLbl.isHidden = true
        
        //self.saveBtn.isHidden = true

        //self.cancelBtn.isHidden = true

        //self.checkico.isHidden = false
    }
    
    @IBAction func cancelBtnClicked(_ sender: Any) {
        self.dimmedView.isHidden = true
        self.alertView.isHidden = true
    }
    
    @IBAction func goBacktoAddress(_ sender: Any) {
        print("Ok")
        self.navigationController?.popViewController(animated: true)
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
