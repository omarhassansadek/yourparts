//
//  productDetailsViewController.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/16/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class productDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var productinfoTableView: UITableView!
    
    @IBOutlet weak var addToCartBtn: UIButton!
    
    @IBOutlet weak var favContainer: UIView!
    
    var vcTitle: String?
    
    var product: product?
    
    var productDetailsArr : [detailProduct] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()

        self.navigationController?.navigationBar.barTintColor = anotherGreyColor

        
        self.addToCartBtn.layer.cornerRadius = 12.5
        
        self.favContainer.layer.cornerRadius = 12.5

        self.addToCartBtn.setTitle("Add to Cart".localized, for: .normal)
        self.addToCartBtn.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 12 )


        productDetailsArr.append(detailProduct(dname: "العرض", dvalue: "201"))
        productDetailsArr.append(detailProduct(dname: "الارتفاع", dvalue: "50"))
        productDetailsArr.append(detailProduct(dname: "النوع", dvalue: "R"))
        productDetailsArr.append(detailProduct(dname: "القطر", dvalue: "16"))
        productDetailsArr.append(detailProduct(dname: "مؤشر الحمل", dvalue: "91 = to 615 kg"))
        productDetailsArr.append(detailProduct(dname: "معدل السرعة", dvalue: "H = to 210km/h"))
        
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

                          cell3.rightLbl.text = self.productDetailsArr[indexPath.row - 3].value

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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
