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
    @IBOutlet weak var paymentMethodTableView: UITableView!
    @IBOutlet var paymentVM: paymentViewModel!
    var orderId: Int?
    var orderItemId: Int?
    var orderDic: [String: Any]?
    var cartId: Int?
    var selectedMethod = -1
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationItem.hidesBackButton = true

        self.navigationController?.navigationBar.tintColor = UIColor.black
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button1 = UIBarButtonItem(image: UIImage(named: "close-1"), style: .plain, target: self, action: Selector("dismissCheckout")) // action:#selector(Class.MethodName) for swift 3
        self.navigationItem.rightBarButtonItem  = button1

                
        self.paymentMethodTableView.delegate = self
        self.paymentMethodTableView.dataSource = self
        
        
        
        let nib = UINib(nibName: String(describing: methodTableViewCell.self), bundle: nil)
        self.paymentMethodTableView.register(nib, forCellReuseIdentifier: "methodCell")
        
        let nib2 = UINib(nibName: String(describing: addAddressTableViewCell.self), bundle: nil)
        self.paymentMethodTableView.register(nib2, forCellReuseIdentifier: "AddAddressCell")
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }

        self.navigationItem.hidesBackButton = true

        self.navigationController?.navigationBar.tintColor = UIColor.black
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationController?.navigationBar.barTintColor = anotherGreyColor
        
        self.title = "Payment Method".localized
        
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.black,
             NSAttributedString.Key.font: UIFont(name: "Cairo-Bold", size: 18)!]
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.updatePaymentMethod), name: Notification.Name("updateMethod"), object: nil)

        
        //AddAddressCell
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissCheckout(){
         print("clicked")
         self.dismiss(animated: true, completion: nil)
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
                if self.selectedMethod != -1{
                    //var params: [String: Any] = [:]
                          self.orderDic = [:]
                          self.orderDic?["payment_method"] = self.selectedMethod
                          
                          self.paymentVM.patchOrder(id: self.orderId ?? -1, apiParameters: self.orderDic ?? [:] , onSuccess: { (isSuccess) in
                              //
                              
                              var createDic: [String: Any] = [:]
                              createDic["cart_id"] = self.cartId ?? -1
                              createDic["order_id"] = self.orderItemId ?? -1
                              
                              let isInOrder = UserDefaults.standard.bool(forKey: "inOrder") ?? false
                              
                             if isInOrder{
                                
                                self.paymentVM.createOrderItem(apiParameters: createDic, onSuccess: { (isSucees) in
                                    //
                                    
                                  UserDefaults.standard.set(false, forKey: "inOrder")

                                    self.performSegue(withIdentifier: "gotoConfirmVC", sender: self)

                                }) { (errMsg) in
                                    AlertViewer().showAlertView(withMessage: errMsg, onController: self)

                                }

                             }else{
                                self.performSegue(withIdentifier: "gotoConfirmVC", sender: self)
                            }
                            

                          }) { (errMsg) in
                              //
                              AlertViewer().showAlertView(withMessage: errMsg, onController: self)
                          }
                }
      
            }
            
            addAddressCell.addAddressBtn.setTitle("Choose Payment Method".localized, for: .normal)

            if self.selectedMethod != -1{
                addAddressCell.addAddressBtn.backgroundColor = primaryColor
            }else{
                addAddressCell.addAddressBtn.backgroundColor = UIColor.lightGray
            }
            
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
                
                if indexPath.row == 2{
                    //self.performSegue(withIdentifier: "gotoInstallmentMethod", sender: self)
                //}else{
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
            destCont.orderItemId = self.orderItemId
            destCont.cartId = self.cartId ?? -1
        }
    }
    

    @IBAction func goBacktoAddress(_ sender: Any) {
        print("Ok")
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @objc func updatePaymentMethod(notification: Notification) {
        //self.getAddresses()
        //
        self.selectedMethod = 2
        self.arrayBox[2] = true
        self.paymentMethodTableView.reloadData()

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
