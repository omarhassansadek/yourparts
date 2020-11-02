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
    
    @IBOutlet weak var activityind: NVActivityIndicatorView!
    
    @IBOutlet weak var productinfoTableView: UITableView!
    
    @IBOutlet weak var addToCartBtn: UIButton!
    
    @IBOutlet weak var favContainer: UIView!
    
    var vcTitle: String?
    
    var product: product?
    
    var productDetailsArr : [detailProduct] = []
    
    @IBOutlet weak var productDetailsVM: productDetailsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()

        self.navigationController?.navigationBar.barTintColor = anotherGreyColor

        
        self.addToCartBtn.layer.cornerRadius = 12.5
        
        self.favContainer.layer.cornerRadius = 12.5

        self.addToCartBtn.setTitle("Add to Cart".localized, for: .normal)
        self.addToCartBtn.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 12 )
        
        self.parseDicDetails(DicDetails: self.product?.specific_detail ?? [:])

        //self.product?.sep
//
//        productDetailsArr.append(detailProduct(dname: "العرض", dvalue: "201"))
//        productDetailsArr.append(detailProduct(dname: "الارتفاع", dvalue: "50"))
//        productDetailsArr.append(detailProduct(dname: "النوع", dvalue: "R"))
//        productDetailsArr.append(detailProduct(dname: "القطر", dvalue: "16"))
//        productDetailsArr.append(detailProduct(dname: "مؤشر الحمل", dvalue: "91 = to 615 kg"))
//        productDetailsArr.append(detailProduct(dname: "معدل السرعة", dvalue: "H = to 210km/h"))
//
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


        // Do any additional setup after loading the view.
    }
    

    
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
                          // set the placeholder image here
                          cell.productImage.image = UIImage(named: "goodTire")
                      } else {
                          // success ... use the image
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
                      //cell3.rightLbl.text = "More".localized
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
                      //cell3.rightLbl.font = UIFont(name: "Cairo-SemiBold", size: 12 )
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
    
    
    @IBAction func addToCartPressed(_ sender: Any) {
        
        self.activityind.startAnimating()
        var paramsDic : [String: Any] = [:]
        //paramsDic["product_code"] = String(self.product?.id ?? -1)
        paramsDic["quantity"] = 1
        //paramsDic["cart"] = UserDefaults.standard.integer(forKey: "cartid")
        paramsDic["sparepart_id"] = self.product?.id ?? ""
        //paramsDic["extra"] = ""
        
        let isLogged = UserDefaults.standard.bool(forKey: "isLogged")
        
        if isLogged{
            self.productDetailsVM.addProductToCart(apiParameters: paramsDic, onSuccess: { (isSuccess) in
                if isSuccess{
                    self.activityind.stopAnimating()
                    
                    self.addToCartBtn.setTitle("Added to cart".localized, for: .normal)
                    
                    if let tabItems = self.tabBarController?.tabBar.items {
                        // In this case we want to modify the badge number of the third tab:
                        let tabItem = tabItems[2]
                        tabItem.badgeValue = String((Int(tabItem.badgeValue ?? "0") ?? 0) + 1)
                    }


                    self.addToCartBtn.backgroundColor = UIColor(displayP3Red: 138/255, green: 209/255, blue: 97/255, alpha: 1.0)
                    
                }
            }) { (errMsg) in
                //
                AlertViewer().showAlertView(withMessage: errMsg , onController: self)

            }
        }else{
            //
            
            self.performSegue(withIdentifier: "gotoLoginVC", sender: self)
        }

    }
    
    func parseDicDetails(DicDetails : [String: Any]) {
        for (key,value) in DicDetails {
            print("\(key) = \(value)")
            var oneDetail = detailProduct(dname: key, dvalue: value)
            //oneDetail.name
            self.productDetailsArr.append(oneDetail)
        }
        
        self.productinfoTableView.reloadData()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //
        if segue.identifier == "gotoLoginVC"{
            let destCont = segue.destination as! loginViewController
            destCont.isDismissLoginVC = true
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
