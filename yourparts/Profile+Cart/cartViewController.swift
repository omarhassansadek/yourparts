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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configure()
        
        self.getCartData()
        
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
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
          return 1
      }
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cartVM.cartArr.count
      }
      
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell") as! cartTableViewCell
          cell.productName.text = "Bridgestone Run Flat كاوتش"
          cell.productDesc.text = "205/60/16"
          cell.productPrice.text =  "3433 جنيه"
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
                    self.cartTableView.reloadData()
                }
            }) { (errorMsg) in
                //
            }
        }
    }

    
    func getCartData(){
        
        self.activityind.startAnimating()
        
        self.cartVM.getCartProducts(onSuccess: { (isSuccess) in
            //

            self.activityind.stopAnimating()

            if isSuccess{
                if self.cartVM.cartArr.count > 0 {
                    self.cartTableView.isHidden = false
                    self.paymentView.isHidden = false
                    
                    self.emptyCartPlaceholder.isHidden = true
                    self.goShoppingBtn.isHidden = true
                    
                }else{
                    self.cartTableView.isHidden = true
                    self.paymentView.isHidden = true
                    self.emptyCartPlaceholder.isHidden = false
                    self.goShoppingBtn.isHidden = false

                }
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

        self.deliveryLbl.text = "Charge Cost".localized
        
        self.deliveryPrice.font = UIFont(name: "Cairo-Regular", size: 13)
        
        self.deliveryPrice.text = "50 جنيه".localized

        
        self.totalPriceLbl.font = UIFont(name: "Cairo-Bold", size: 13)

        self.totalPriceLbl.text = "Total Price".localized
               
        self.totalPrice.font = UIFont(name: "Cairo-Bold", size: 13)
        
        self.totalPrice.text = "3483 جنيه"

        self.payBtn.setTitle("Pay".localized, for: .normal)
        
        self.payBtn.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 14)
        
        self.payBtn.layer.cornerRadius = 15.0


    }
    
    
    @IBAction func goShppoingBtnClicked(_ sender: Any) {
        tabBarController?.selectedIndex = 0
    }
    
    
    
    @IBAction func paymentBtnClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "gotoPayment", sender: self)
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
