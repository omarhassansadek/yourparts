//
//  cartViewController.swift
//  yourparts
//
//  Created by iMac1 on 8/10/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import NVActivityIndicatorView


class cartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var actind: NVActivityIndicatorView!
    
    @IBOutlet weak var activityind: NVActivityIndicatorView!
    
    @IBOutlet weak var goShoppingViewPlaceholder: UIView!
    
    @IBOutlet weak var emptyCartPlaceholder: UIView!
    
    @IBOutlet weak var payBtn: UIButton!
    
    @IBOutlet weak var totalPrice: UILabel!
    
    @IBOutlet weak var totalPriceLbl: UILabel!
    
    @IBOutlet weak var deliveryPrice: UILabel!
    
    @IBOutlet weak var deliveryLbl: UILabel!
    
    @IBOutlet weak var paymentView: UIView!
    
    @IBOutlet weak var roundView1: UIView!
    
    @IBOutlet weak var goShoppingLbl: UILabel!
    
    @IBOutlet weak var placeholderLbl: UILabel!
    
    @IBOutlet weak var goShoppingBtn: UIButton!
    
    @IBOutlet weak var cartTableView: UITableView!
    
    @IBOutlet var cartVM: cartViewModel!
    
    var refreshControl = UIRefreshControl()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        
        cartTableView.addSubview(refreshControl)
        
        self.configure()
        
        
        self.placeholderLbl.text = "Your cart is empty".localized
        
        self.placeholderLbl.font = UIFont(name: "Cairo-Bold", size: 18)

        self.goShoppingLbl.text = "Check the best spare parts for your car".localized
        
        self.goShoppingLbl.font = UIFont(name: "Cairo-Regular", size: 13)

        self.goShoppingBtn.setTitle("Go Shopping".localized, for: .normal)
        
        self.goShoppingBtn.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 14)
        
        self.goShoppingBtn.layer.cornerRadius = 15.0

        let nib = UINib(nibName: String(describing: cartTableViewCell.self), bundle: nil)
        self.cartTableView.register(nib, forCellReuseIdentifier: "cartCell")

        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        self.navigationController?.navigationBar.tintColor = primaryColor

        self.navigationController?.navigationBar.shadowImage = UIImage()

        self.navigationController?.navigationBar.barTintColor = anotherGreyColor

        self.title = "Cart".localized
        
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.black,
             NSAttributedString.Key.font: UIFont(name: "Cairo-Bold", size: 18)!]

        self.cartTableView.delegate = self
        self.cartTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.getCartData()
    }

    @objc func refresh(_ sender: AnyObject) {
       // Code to refresh table view
       self.getCartData()
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
          return 1
      }
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cartVM.cartArr.count
      }
      
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
          let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell") as! cartTableViewCell
        
          cell.productName.text = self.cartVM.cartArr[indexPath.row].product_name
          cell.productDesc.text = self.cartVM.cartArr[indexPath.row].created_at
          cell.productPrice.text =  self.cartVM.cartArr[indexPath.row].unit_price
          
          
        
        
          let cellDelegate = quantityPickerDelegate()
        
          cell.quantityTf.tag = indexPath.row
        
          cell.quantityTf.inputView = cell.quantityPickerView
          cell.setPickerViewDataSourceDelegate(cellDelegate, forRow: indexPath.row)
        
          cell.quantityTf.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingDidEnd)

//          cellDelegate.carMakersArr = self.carMakersArr
//          cellDelegate.carBrandsArr = self.carBrandsArr
       
          cellDelegate.targetController = self
          cellDelegate.row = indexPath.row
          cell.row = indexPath.row
          //cellDelegate.type = "m"
          cell.quantityTf.text = String( self.cartVM.cartArr[indexPath.row].quantity ?? -1 )

        
          cell.checkBoxView.isHidden = true

          return cell
        
     }
      
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 195.0
     }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            self.cartVM.deleteFromCart(id: self.cartVM.cartArr[indexPath.row].id ?? -1, onSuccess: { (isSuccess) in
                if isSuccess{
                    self.cartVM.cartArr.remove(at: indexPath.row)
                    self.getCartData()
                }
            }) { (errorMsg) in
                //
            }
        }
    }
    
    var firstLoad = false
    
    func getCartData(){
        
        if !self.firstLoad {
            self.activityind.startAnimating()
            self.firstLoad = true
        }
        
        
        self.cartVM.getCartProducts(onSuccess: { (isSuccess) in
            //

            self.activityind.stopAnimating()

            if isSuccess{
                if self.cartVM.cartArr.count > 0 {
                    self.cartTableView.isHidden = false
                    self.paymentView.isHidden = false
                    
                    self.emptyCartPlaceholder.isHidden = true
                    self.goShoppingViewPlaceholder.isHidden = true
                    self.deliveryPrice.text = self.cartVM.amount
                    self.totalPrice.text = self.cartVM.total

                    
                }else{
                    self.cartTableView.isHidden = true
                    self.paymentView.isHidden = true
                    self.emptyCartPlaceholder.isHidden = false
                    self.goShoppingViewPlaceholder.isHidden = false

                }
                
                self.refreshControl.endRefreshing()

                self.cartTableView.reloadData()
            }
        }) { (errMsg) in
            //
            self.activityind.stopAnimating()

        }
    }
    
    func configure(){
        
        self.paymentView.layer.cornerRadius = 20.0
        self.paymentView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        self.paymentView.clipsToBounds = true
        
        self.paymentView.layer.shadowColor = UIColor.black.cgColor
        self.paymentView.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.paymentView.layer.shadowOpacity = 0.7
        self.paymentView.layer.shadowRadius = 4.0

        self.roundView1.layer.cornerRadius = 5.0
        
        self.deliveryLbl.font = UIFont(name: "Cairo-Regular", size: 13)

        self.deliveryLbl.text = "Vat".localized
        
        self.deliveryPrice.font = UIFont(name: "Cairo-Regular", size: 13)
        

        
        self.totalPriceLbl.font = UIFont(name: "Cairo-Bold", size: 13)

        self.totalPriceLbl.text = "Total Price".localized
               
        self.totalPrice.font = UIFont(name: "Cairo-Bold", size: 13)
        

        self.payBtn.setTitle("Pay".localized, for: .normal)
        
        self.payBtn.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 14)
        
        self.payBtn.layer.cornerRadius = 15.0


    }
    
    
    @IBAction func goShppoingBtnClicked(_ sender: Any) {
        tabBarController?.selectedIndex = 0
    }   
    
    var paramsDic: [String: Any] = [:]

    
    @IBAction func paymentBtnClicked(_ sender: Any) {
        
        self.payBtn.setTitle("", for: .normal)
        
        self.actind.startAnimating()
        
        var orderDic: [String: Any] = [:]
        orderDic["status"] = "new"
        self.cartVM.total = self.cartVM.total.replacingOccurrences(of:  "ج.م", with: "", options: NSString.CompareOptions.literal, range: nil)
        self.cartVM.total = self.cartVM.total.replacingOccurrences(of:  ",", with: "", options: NSString.CompareOptions.literal, range: nil)

        orderDic["_subtotal"] = self.cartVM.total
        orderDic["_total"] = self.cartVM.total
        orderDic["customer"] = UserDefaults.standard.integer(forKey: "userid")
        self.paramsDic["order"] = orderDic
        
        self.cartVM.createOrder(apiParameters: self.paramsDic, onSuccess: { (isSuccess) in
            if isSuccess{
                self.actind.stopAnimating()

                self.payBtn.setTitle("Pay".localized, for: .normal)

                self.performSegue(withIdentifier: "gotoPayment", sender: self)
            }
        }) { (errMsg) in
            //
            self.payBtn.setTitle("Pay".localized, for: .normal)

            self.actind.stopAnimating()

        }
        
    }
    
    func reloadTableData(){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoPayment"{
            let destCont = segue.destination as! addressPaymentViewController
            destCont.orderId =  self.cartVM.orderId ?? -1
            destCont.orderDic = self.paramsDic
            destCont.cartId = self.cartVM.cartId ?? -1
            //var cartId: Int?
        }
    }

    
    @objc func textFieldDidChange(_ textField: UITextField) {
        print("End Editing")
        var index = textField.tag
        var params: [String: Any] = [:]
        //params["id"] = self.cartVM.cartArr[index].id
        params["quantity"] = self.cartVM.cartArr[index].quantity
        self.cartVM.addToCart(id: self.cartVM.cartArr[index].id ?? -1, apiParameters: params, onSuccess: { (isSuccess) in
            //
            if isSuccess{
                self.firstLoad = false
                self.getCartData()
            }
            
        }) { (error) in
            //
        }
        //self.cartTableView.reloadData()
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
