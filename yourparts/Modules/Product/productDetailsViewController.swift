//
//  productDetailsViewController.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/16/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class productDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK:- Outlets
    @IBOutlet weak var activityind: NVActivityIndicatorView!
    @IBOutlet weak var productinfoTableView: UITableView!
    @IBOutlet weak var addToCartBtn: UIButton!
    @IBOutlet weak var favContainer: UIView!
    @IBOutlet weak var productDetailsVM: productDetailsViewModel!
    
    //MARK:- Variables
    var vcTitle: String?
    var product: product?
    var productDetailsArr : [detailProduct] = []
    
    //MARK:- Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.barTintColor = anotherGreyColor
        
        self.addToCartBtn.layer.cornerRadius = 12.5
        self.addToCartBtn.setTitle("Add to Cart".localized, for: .normal)
        self.addToCartBtn.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 12 )
        if self.product?.is_in_cart == true{
            self.addToCartBtn.backgroundColor = SuccessPrimaryColor
        }else{
            self.addToCartBtn.backgroundColor = primaryColor
        }
        self.favContainer.layer.cornerRadius = 12.5
        
        self.parseDicDetails(DicDetails: self.product?.specific_detail ?? [:])
        
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.black,
             NSAttributedString.Key.font: UIFont(name: "Cairo-Bold", size: 18)!]
        
        self.title = vcTitle
        
        self.productinfoTableView.delegate = self
        self.productinfoTableView.dataSource = self
        
        let nib2 = UINib(nibName: String(describing: detailProductCellTableViewCell.self), bundle: nil)
        self.productinfoTableView.register(nib2, forCellReuseIdentifier: "detailDataCell")
        
        let nib3 = UINib(nibName: String(describing: detailProductTitleTableViewCell.self), bundle: nil)
        self.productinfoTableView.register(nib3, forCellReuseIdentifier: "detailsTitleCell")
        
        let nib4 = UINib(nibName: String(describing: detailRowTableViewCell.self), bundle: nil)
        self.productinfoTableView.register(nib4, forCellReuseIdentifier: "detailRow")
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        
    }
    
    //MARK:- TableView Delegates
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 + self.productDetailsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailDataCell") as! detailProductCellTableViewCell
            cell.contentView.backgroundColor = anotherGreyColor
            cell.productName.text = self.product?.product_name
            cell.productDesc.text = self.product?.created_at
            cell.productPrice.text =  "\(self.product?.unit_price ?? "") جنيه"
            cell.productPriceDesc.text = "Price for unit".localized
            cell.productDeliveryDesc.text = "Price delivery and spare part price is different from each city".localized
            cell.productImage.sd_setImage(with: URL(string: self.product?.image ?? "") , placeholderImage: nil, completed: { (image, error, cacheType, url) -> Void in
                if ((error) != nil) {
                    cell.productImage.image = UIImage(named: "productPlaceholder")
                } else {
                }
            })
            
            return cell
            
        }else if indexPath.row == 1{
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "detailsTitleCell") as! detailProductTitleTableViewCell
            cell2.roundView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            cell2.roundView.clipsToBounds = true
            
            return cell2
            
        }else  if indexPath.row ==  ( self.productDetailsArr.count + 3 - 1){
            let cell22 = tableView.dequeueReusableCell(withIdentifier: "detailsTitleCell") as! detailProductTitleTableViewCell
            cell22.roundView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            cell22.roundView.clipsToBounds = true
            cell22.topConstraint.constant = 0
            cell22.roundView.layoutIfNeeded()
            
            return cell22
            
        }else{
            let cell3 = tableView.dequeueReusableCell(withIdentifier: "detailRow") as! detailRowTableViewCell
            if indexPath.row == 2{
                cell3.leftLbl.text = "Product Details".localized
                cell3.leftLbl.font = UIFont(name: "Cairo-Bold", size: 12 )
                cell3.rightLbl.text = ""
                cell3.separator.isHidden = true
            }else{
                cell3.leftLbl.text = self.productDetailsArr[indexPath.row - 3].name
                if let val = self.productDetailsArr[indexPath.row - 3].value as? String{
                    cell3.rightLbl.text = val as? String
                }else if let val = self.productDetailsArr[indexPath.row - 3].value as? Int{
                    cell3.rightLbl.text = "\(val)"
                }
                cell3.leftLbl.font = UIFont(name: "Cairo-Regular", size: 12 )
                cell3.separator.isHidden = false
            }
            
            return cell3
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 268.0
        }else if indexPath.row == 1{
            return 35.0
        }else if indexPath.row ==  ( self.productDetailsArr.count + 3 - 1){
            return 25.0
        }else{
            return 35.0
        }
    }
    
    //MARK:- Actions
    @IBAction func addToCartPressed(_ sender: Any) {
        
        self.activityind.startAnimating()
        var paramsDic : [String: Any] = [:]
        paramsDic["quantity"] = 1
        paramsDic["sparepart_id"] = self.product?.id ?? ""
        
        let isLogged = UserDefaults.standard.bool(forKey: "isLogged")
        if isLogged{
            self.productDetailsVM.addProductToCart(apiParameters: paramsDic, onSuccess: { (isSuccess) in
                if isSuccess{
                    self.activityind.stopAnimating()
                    self.addToCartBtn.setTitle("Added to cart".localized, for: .normal)
                    if let tabItems = self.tabBarController?.tabBar.items {
                        let tabItem = tabItems[2]
                        tabItem.badgeValue = String((Int(tabItem.badgeValue ?? "0") ?? 0) + 1)
                    }
                    self.addToCartBtn.backgroundColor = SuccessPrimaryColor
                }
            }) { (errMsg) in
                AlertViewer().showAlertView(withMessage: errMsg , onController: self)
            }
        }else{
            self.performSegue(withIdentifier: "gotoLoginVC", sender: self)
        }
        
    }
    
    //MARK:- Helper Methods
    func parseDicDetails(DicDetails : [String: Any]) {
        for (key,value) in DicDetails {
            print("\(key) = \(value)")
            let oneDetail = detailProduct(dname: key, dvalue: value)
            self.productDetailsArr.append(oneDetail)
        }
        self.productinfoTableView.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoLoginVC"{
            let destCont = segue.destination as! loginViewController
            destCont.isDismissLoginVC = true
        }
        
    }
    
}
