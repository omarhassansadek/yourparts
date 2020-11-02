//
//  productListViewController.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/16/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import Spring
import FBSDKLoginKit

class productListViewController: UIViewController, UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate , UITableViewDataSource {
    
    //MARK:- Outlets
    @IBOutlet weak var emptyStateView: UIView!
    @IBOutlet weak var callView: UIView!
    @IBOutlet weak var numberLbl: UILabel!
    @IBOutlet weak var emptyStatetextView: UITextView!
    @IBOutlet weak var doneFilterBtn: UIButton!
    @IBOutlet weak var deleteFilterBtn: UIButton!
    @IBOutlet weak var view2Btn: UIView!
    @IBOutlet weak var view1Btn: UIView!
    @IBOutlet weak var optionalRequirementsBtn: UIButton!
    @IBOutlet weak var speedRateBtn: UIButton!
    @IBOutlet weak var filterView: SpringView!
    @IBOutlet weak var brandViewConstant: NSLayoutConstraint!
    @IBOutlet weak var brandView: UIView!
    @IBOutlet weak var brandCollectionView: UICollectionView!
    @IBOutlet weak var productsTableView: UITableView!
    @IBOutlet weak var productVM: productViewModel!
    @IBOutlet weak var activityindicator: NVActivityIndicatorView!
    @IBOutlet weak var filterTitleLbl: UILabel!
    
    //MARK:- Variables
    var vcTitle: String?
    var pathToCall: String?
    var indexChoosed = 0
    
    //MARK:- Methods
    override func viewWillDisappear(_ animated: Bool) {
        //stops paging please find another solution
        self.loadMoreProducts = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if self.pathToCall != nil {
            self.brandViewConstant.constant = 0
            self.brandView.layoutIfNeeded()
        }else{
            self.brandViewConstant.constant = 55
            self.brandView.layoutIfNeeded()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
        self.getProducts()
        //        let button1 = UIBarButtonItem(image: UIImage(named: "filter"), style: .plain, target: self, action: Selector("filterProducts")) // action:#selector(Class.MethodName) for swift 3
        //        self.navigationItem.rightBarButtonItem  = button1
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.barTintColor = anotherGreyColor
        self.navigationController?.navigationBar.tintColor = primaryColor
        
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.darkGray,
             NSAttributedString.Key.font: UIFont(name: "Cairo-SemiBold", size: 16)!]
        
        self.title = vcTitle 
        self.brandCollectionView.delegate = self
        self.brandCollectionView.dataSource = self
        self.productsTableView.delegate = self
        self.productsTableView.dataSource = self
        
        let nib = UINib(nibName: String(describing: brandCollectionViewCell.self), bundle: nil)
        self.brandCollectionView.register(nib, forCellWithReuseIdentifier: "brandCell")
        
        let nib2 = UINib(nibName: String(describing: productCellTableViewCell.self), bundle: nil)
        self.productsTableView.register(nib2, forCellReuseIdentifier: "dataCell")
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        
    }
    
    func logAddToCartEvent(contentData: String, contentId: String, contentType: String, currency: String, price: Double) {
        let parameters = [
            AppEvents.ParameterName.content.rawValue: contentData,
            AppEvents.ParameterName.contentID.rawValue: contentId,
            AppEvents.ParameterName.contentType.rawValue: contentType,
            AppEvents.ParameterName.currency.rawValue: currency
        ]
        
        AppEvents.logEvent(.addedToCart, valueToSum: price, parameters: parameters)
    }
    
    func configure(){
        self.filterTitleLbl.text = "Filter Options".localized
        self.filterTitleLbl.font = UIFont(name: "Cairo-SemiBold", size: 15)
        self.speedRateBtn.setTitle("Speed Rate".localized, for: .normal)
        self.speedRateBtn.titleLabel?.font = UIFont(name: "Cairo-SemiBold", size: 13)
        self.speedRateBtn.setTitleColor(primaryColor, for: .normal)
        self.optionalRequirementsBtn.setTitle("Optional Requirements".localized, for: .normal)
        self.optionalRequirementsBtn.titleLabel?.font = UIFont(name: "Cairo-SemiBold", size: 13)
        self.optionalRequirementsBtn.setTitleColor(UIColor.black, for: .normal)
        
        self.deleteFilterBtn.setTitle("Delete Filters".localized, for: .normal)
        self.deleteFilterBtn.titleLabel?.font = UIFont(name: "Cairo-SemiBold", size: 13)
        self.deleteFilterBtn.setTitleColor(UIColor.black, for: .normal)
        
        self.doneFilterBtn.setTitle("Done".localized, for: .normal)
        self.doneFilterBtn.titleLabel?.font = UIFont(name: "Cairo-SemiBold", size: 13)
        self.doneFilterBtn.setTitleColor(primaryColor, for: .normal)
        
        self.emptyStatetextView.text = "No product found. Please contact the call center".localized
        
        self.emptyStatetextView.font = UIFont(name: "Cairo-Bold", size: 18)
        
        self.numberLbl.font = UIFont(name: "Cairo-Bold", size: 18)
        
        self.callView.layer.cornerRadius = 15.0
    }
    
    func getProducts(){
        
        self.activityindicator.startAnimating()
        self.productVM.getProductList(url: self.pathToCall ?? "", apiParameters: [:], onSuccess: { (isSuccess) in
            //
            if isSuccess{
                self.activityindicator.stopAnimating()
                if self.productVM.productsResponse.data.count != 0 {
                    self.productsTableView.isHidden = false
                    self.productsTableView.reloadData()
                    self.emptyStatetextView.isHidden = true
                    
                    self.loadMoreProducts = true
                }else{
                    self.productsTableView.isHidden = true
                    self.emptyStateView.isHidden = false
                }
            }
        }) { (errorMsg) in
            self.loadMoreProducts = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoDetailProducts"{
            let destCont = segue.destination as! productDetailsViewController
            destCont.vcTitle = self.productVM.productsResponse.data[self.indexChoosed].product_name
            destCont.product = self.productVM.productsResponse.data[self.indexChoosed]
        }
        
    }
    
    var filterOpened = false
    
    @objc func filterProducts(){
        //print("clicked")
        if !self.filterOpened {
            self.filterOpened = true
            self.filterView.isHidden = false
            self.filterView.animation = "slideUp"
            self.filterView.animate()
            
            Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        }
    }
    
    @objc func updateCounter() {
        self.filterView.backgroundColor = UIColor(displayP3Red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
    }
    
    //MARK:- IB Actions
    @IBAction func filterBtnsClicked(_ sender: UIButton) {
        if (sender.tag == 11){
            self.speedRateBtn.setTitleColor(primaryColor, for: .normal)
            self.view1Btn.backgroundColor = primaryColor
            self.optionalRequirementsBtn.setTitleColor(UIColor.black, for: .normal)
            self.view2Btn.backgroundColor = UIColor.white
        }else{
            self.speedRateBtn.setTitleColor(UIColor.black, for: .normal)
            self.view1Btn.backgroundColor = UIColor.white
            self.optionalRequirementsBtn.setTitleColor(primaryColor, for: .normal)
            self.view2Btn.backgroundColor = primaryColor
        }
    }
    
    @IBAction func doneFilter(_ sender: Any) {
        self.filterView.animation = "fadeOut"
        self.filterView.animate()
        self.filterOpened = false
        self.filterView.backgroundColor = UIColor.clear
        
    }
    
    @IBAction func callButtonPressed(_ sender: Any) {
        guard let number = URL(string: "tel://" + "15145") else { return }
        UIApplication.shared.open(number)
    }
    
    //MARK:- Scroll View
    var loadMoreProducts = false
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let scrollViewHeight = scrollView.frame.size.height
        let scrollContentSizeHeight = scrollView.contentSize.height
        
        if (scrollView.contentOffset.y + scrollViewHeight >= scrollContentSizeHeight - 10){
            if self.productVM.productsResponse.next != "" && self.productVM.productsResponse.next != nil {
                
                if self.loadMoreProducts{
                    self.loadMoreProducts = false
                    print(self.productVM.productsResponse.next)
                    
                    self.productVM.getProductList(url: self.productVM.productsResponse.next ?? "", apiParameters: [:], onSuccess: { (isSuccess) in
                        self.loadMoreProducts = true
                        self.productsTableView.reloadData()
                    }) { (errMsg) in
                        self.loadMoreProducts = true
                    }
                }
            }
        }else{
            //self.loadMoreProducts = true
        }
    }
}

//MARK:- Product List View Controller Extension
extension productListViewController{
    
    //MARK:- Delegates
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellCollection = collectionView.dequeueReusableCell(withReuseIdentifier: "brandCell", for: indexPath) as! brandCollectionViewCell
        return cellCollection
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 7.5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:  UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 125.0 , height: collectionView.frame.height)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productVM.productsResponse.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell") as! productCellTableViewCell
        cell.productName.text = self.productVM.productsResponse.data[indexPath.row].product_name
        var neededHeight = self.getHeight(text: self.productVM.productsResponse.data[indexPath.row].product_name as! NSString, width: cell.productName.frame.width, font: UIFont(name: "Cairo-Bold", size: 14)!)
        //
        if neededHeight > 75.0 {
            cell.lblTopConstraint.constant = -12.5
        }else if neededHeight > 50 {
            cell.lblTopConstraint.constant = -7.5
        }else {
            cell.lblTopConstraint.constant = 2.5
        }
        //
        if self.productVM.productsResponse.data[indexPath.row].brand != nil{
            
            if self.productVM.productsResponse.data[indexPath.row].brand?.image != nil{
                
                cell.imageViewConstraint.constant = 40.0
                
                cell.brandSample.sd_setImage(with: URL(string: productVM.productsResponse.data[indexPath.row].brand?.image ?? "") , placeholderImage: nil, completed: { (image, error, cacheType, url) -> Void in
                    if ((error) != nil) {
                        // set the placeholder image here
                        cell.brandSample.image = UIImage(named: "brandSample")
                    } else {
                        // success ... use the image
                    }
                })
            }else{
                cell.imageViewConstraint.constant = 0.0
            }
        }else{
            cell.imageViewConstraint.constant = 0.0
        }
        cell.imageViewContainter.layoutIfNeeded()
        cell.lblHeightConstraint.constant =  CGFloat(neededHeight)
        //print(cell.lblHeightConstraint.constant)
        cell.productName.layoutIfNeeded()
        cell.productDesc.text = self.productVM.productsResponse.data[indexPath.row].created_at
        cell.productPrice.text =  "\(self.productVM.productsResponse.data[indexPath.row].unit_price ?? "") جنيه"
        cell.productImage.sd_setImage(with: URL(string: self.productVM.productsResponse.data[indexPath.row].image ?? "") , placeholderImage: nil, completed: { (image, error, cacheType, url) -> Void in
            if ((error) != nil) {
                // set the placeholder image here
                cell.productImage.image = UIImage(named: "goodTire")
            } else {
                // success ... use the image
            }
        })
        cell.productPriceDesc.text = "Price for unit".localized
        cell.productDeliveryDesc.text = "Price delivery and spare part price is different from each city".localized
        cell.addToCart = {
            //cell.addToCart
            cell.activityind.startAnimating()
            cell.cartimg.isHidden = true
            var paramsDic : [String: Any] = [:]
            //            paramsDic["product_code"] = String(self.productVM.productsResponse?.results[indexPath.row].id ?? -1)
            paramsDic["quantity"] = 1
            //            paramsDic["cart"] = UserDefaults.standard.integer(forKey: "cartid")
            paramsDic["sparepart_id"] = (self.productVM.productsResponse.data[indexPath.row].id)
            
            var fbDic : [String:String]=[:]
            fbDic["sparepart_id"] = "\(self.productVM.productsResponse.data[indexPath.row].id!)"
            fbDic["product_price"] = self.productVM.productsResponse.data[indexPath.row].unit_price
            fbDic["product_name"] = self.productVM.productsResponse.data[indexPath.row].product_name
            
            let jsonDt = try? JSONSerialization.data(withJSONObject: paramsDic, options: [])
            let jsonString = String(data: jsonDt!, encoding: .utf8)!
            print(jsonString)



            self.productVM.addToCart(apiParameters: paramsDic, onSuccess: { (isSuccess) in
                //
                //AlertViewer().showAlertView(withMessage: "Added to Cart" , onController: self)
                
                cell.cartimg.image = UIImage(named: "cartSuccess")
                
                cell.cartView.backgroundColor = UIColor(displayP3Red: 138/255, green: 209/255, blue: 97/255, alpha: 1.0)
                
                cell.cartimg.isHidden = false
                cell.activityind.stopAnimating()
                
                self.logAddToCartEvent(contentData: fbDic["product_name"]!, contentId: fbDic["sparepart_id"]!, contentType: "product", currency: "EGP", price: Double("") ?? 0.0)
                if let tabItems = self.tabBarController?.tabBar.items {
                    // In this case we want to modify the badge number of the third tab:
                    let tabItem = tabItems[2]
                    tabItem.badgeValue = String((Int(tabItem.badgeValue ?? "0") ?? 0) + 1)
                }

            }) { (err) in
                //
                cell.activityind.stopAnimating()
                cell.cartimg.image = UIImage(named: "cart")
                cell.cartView.backgroundColor = primaryColor
                cell.cartimg.isHidden = false
                AlertViewer().showAlertView(withMessage: err , onController: self)
            }
        }
        
        if self.productVM.productsResponse.data[indexPath.row].is_in_cart == true ?? false{
            cell.cartimg.image = UIImage(named: "cartSuccess")
            cell.cartView.backgroundColor = UIColor(displayP3Red: 138/255, green: 209/255, blue: 97/255, alpha: 1.0)
            cell.cartimg.isHidden = false
        }else{
            cell.activityind.stopAnimating()
            cell.cartimg.image = UIImage(named: "cart")
            cell.cartView.backgroundColor = primaryColor
            cell.cartimg.isHidden = false
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240.0
    }
    
    //    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    //        if indexPath.row + 1 == self.productVM.productsResponse.data.count {
    //            print("do something")
    //        }
    //
    
    func logViewContentEvent(
        contentType: String,
        contentData: String,
        contentId: String,
        currency: String,
        price: Double
    ) {
        let parameters = [
            AppEvents.ParameterName.contentType.rawValue: contentType,
            AppEvents.ParameterName.content.rawValue: contentData,
            AppEvents.ParameterName.contentID.rawValue: contentId,
            AppEvents.ParameterName.currency.rawValue: currency
        ]
        
        AppEvents.logEvent(.viewedContent, valueToSum: price, parameters: parameters)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.logViewContentEvent(contentType: "Product Content" , contentData: self.productVM.productsResponse.data[indexPath.row].product_name ?? "", contentId: "\(self.productVM.productsResponse.data[indexPath.row].id)", currency: "EGP", price: Double(self.productVM.productsResponse.data[indexPath.row].unit_price ?? "0.0") ?? 0.0)
        
        self.indexChoosed = indexPath.row
        self.performSegue(withIdentifier: "gotoDetailProducts", sender: self)
    }
    
    func getHeight(text:  NSString, width:CGFloat, font: UIFont) -> CGFloat
    {
        let rect = text.boundingRect(with: CGSize.init(width: width, height: CGFloat.greatestFiniteMagnitude), options: ([NSStringDrawingOptions.usesLineFragmentOrigin,NSStringDrawingOptions.usesFontLeading]), attributes: [NSAttributedString.Key.font:font], context: nil)
        return rect.size.height
    }
}
