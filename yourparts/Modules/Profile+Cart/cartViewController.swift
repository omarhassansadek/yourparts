//
//  cartViewController.swift
//  yourparts
//
//  Created by iMac1 on 8/10/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import FINNBottomSheet
import BEMCheckBox

class cartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, BottomSheetPresentationControllerDelegate {
    
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
    
    
    private lazy var bottomSheetTransitioningDelegate = BottomSheetTransitioningDelegate(
        contentHeights: [.bottomSheetAutomatic, UIScreen.main.bounds.size.height - 200],
        presentationDelegate: self
    )

    var bottomSheetView: BottomSheetView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let height = self.tabBarController?.tabBar.frame.height ?? 49.0
        print(height)

        self.bottomSheetView = BottomSheetView(
            contentView: self.paymentView,
               //125 + 50
               contentHeights: [height + 140, height + 150]
        )

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
        if let tabItems = tabBarController?.tabBar.items {
            // In this case we want to modify the badge number of the third tab:
            let tabItem = tabItems[2]
            tabItem.badgeValue = nil
        }

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
        
        let neededHeight = self.getHeight(text: self.cartVM.cartArr[indexPath.row].product_name as! NSString, width: cell.productName.frame.width, font: UIFont(name: "Cairo-Bold", size: 14)!)
        
        if neededHeight > 75.0 {
            cell.lblTopConstraint.constant = -12.5
        }else if neededHeight > 50 {
            cell.lblTopConstraint.constant = -7.5
        }else {
            cell.lblTopConstraint.constant = 2.5
        }
        
        cell.lblHeightConstraint.constant =  CGFloat(neededHeight)
        print(cell.lblHeightConstraint.constant)
        cell.productName.layoutIfNeeded()

        cell.productDesc.text = self.cartVM.cartArr[indexPath.row].created_at
        cell.productPrice.text =  "\(self.cartVM.cartArr[indexPath.row].unit_price ?? "") جنيه "
        
        if self.cartVM.cartArr[indexPath.row].brand != nil{
            
             if self.cartVM.cartArr[indexPath.row].brand?.image != nil{
                 
                 cell.imgViewConstraint.constant = 40.0
                
                cell.brandimg.sd_setImage(with: URL(string: self.cartVM.cartArr[indexPath.row].brand?.image ?? "") , placeholderImage: nil, completed: { (image, error, cacheType, url) -> Void in
                        if ((error) != nil) {
                            // set the placeholder image here
                            cell.productimage.image = UIImage(named: "brandSample")
                        } else {
                            // success ... use the image
                        }
                 })

                
             
             }else{
             
                 cell.imgViewConstraint.constant = 0.0

             }
         
        }else{
         
             cell.imgViewConstraint.constant = 0.0
         
        }

        
        cell.productimage.sd_setImage(with: URL(string: self.cartVM.cartArr[indexPath.row].image ?? "") , placeholderImage: nil, completed: { (image, error, cacheType, url) -> Void in
            if ((error) != nil) {
                // set the placeholder image here
                cell.productimage.image = UIImage(named: "goodTire")
            } else {
                // success ... use the image
            }
        })
        
        
        let cellDelegate = quantityPickerDelegate()
        
        cell.quantityTf.tag = indexPath.row
        
        cell.quantityTf.inputView = cell.quantityPickerView
        cell.setPickerViewDataSourceDelegate(cellDelegate, forRow: indexPath.row)
        
        //cell.quantityTf.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .valueChanged)
        
        //          cellDelegate.carMakersArr = self.carMakersArr
        //          cellDelegate.carBrandsArr = self.carBrandsArr
        
        cellDelegate.targetController = self
        cellDelegate.row = indexPath.row
        cell.row = indexPath.row
        //cellDelegate.type = "m"
        cell.quantityTf.text = String( self.cartVM.cartArr[indexPath.row].quantity ?? -1 )
        cell.ratingView.rating = Double(self.cartVM.cartArr[indexPath.row].average_rating ?? 5)

        cell.fixPrice.text = "\(self.cartVM.cartArr[indexPath.row].installation_cost ?? "") جنيه"
        cell.fixPrice.setLineSpacing(lineSpacing: 0.5, lineHeightMultiple: 0.5)
        cell.fixPrice.textAlignment = .center
        //cell.checkBoxView.isHidden = true
        
        //remove shipping in the same day
        //cell.shippingViewHeightConstraint.constant = 0.0
        if let isInstallation =  self.cartVM.cartArr[indexPath.row].is_installation_cost{
            if isInstallation{
                cell.fixCheckBox.on = true
            }else{
                cell.fixCheckBox.on = false

            }
        }

        cell.addInstallation = {
            if let isInstall =  self.cartVM.cartArr[indexPath.row].is_installation_cost{
                
                self.payBtn.setTitle("".localized, for: .normal)

                self.actind.startAnimating()
                
                var patchDic : [String: Any] = [:]

                var is_add = false
                
                if isInstall{
                    
                    if let installation_cost = self.cartVM.cartArr[indexPath.row].installation_cost{
                        print(Double(installation_cost)!)
                        patchDic["extra"] = ["installation_cost" : 0.0]
                    }

                    is_add = false
                }else{
                    //checkbox
                    
                    if let installation_cost = self.cartVM.cartArr[indexPath.row].installation_cost{
                        print(Double(installation_cost)!)
                        patchDic["extra"] = ["installation_cost" : Double(installation_cost)!]
                    }
                    
                    is_add = true
                }
                
                self.cartVM.patchOnCartItem(id: self.cartVM.cartArr[indexPath.row].id ?? -1, apiParameters: patchDic , onSuccess: { (isSuccess) in
                    //
                    if isSuccess{
                        //call calculate cart
                        if is_add{
                            cell.fixCheckBox.on = true
                            self.cartVM.cartArr[indexPath.row].is_installation_cost = true
                        }else{
                            cell.fixCheckBox.on = false
                            self.cartVM.cartArr[indexPath.row].is_installation_cost = false

                        }
                        
                        self.cartVM.calculateCart(id: self.cartVM.cartId ?? -1, apiParameters: [:], onSuccess: { (isSuccess) in
                            if isSuccess{
                        
                                self.actind.stopAnimating()
                                
                                self.payBtn.setTitle("Continue to checkout".localized, for: .normal)
                                
                                self.deliveryPrice.text = "\(self.cartVM.total_install)"
                            }
                        }) { (errMsg) in
                            //
                        }
                    }
                }) { (errMsg) in
                    //
                }
                
                
            }
            
        }
        cell.shippingView.isHidden = true
        cell.layoutIfNeeded()
        
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
            self.payBtn.setTitle("".localized, for: .normal)

            self.actind.startAnimating()
            
            self.cartTableView.isUserInteractionEnabled = false

            // handle delete (by removing the data from your array and updating the tableview)
            self.cartVM.deleteFromCart(id: self.cartVM.cartArr[indexPath.row].id ?? -1, onSuccess: { (isSuccess) in
                
                self.cartTableView.isUserInteractionEnabled = true

                if isSuccess{
                    self.cartVM.cartArr.remove(at: indexPath.row)

                    self.getCartData()
                }
            }) { (errorMsg) in
                self.cartTableView.isUserInteractionEnabled = true

                //self.payBtn.setTitle("Continue to checkout".localized, for: .normal)
                self.getCartData()

            }
        }
    }
    
    var firstLoad = false
    
    func getHeight(text:  NSString, width:CGFloat, font: UIFont) -> CGFloat
    {
        let rect = text.boundingRect(with: CGSize.init(width: width, height: CGFloat.greatestFiniteMagnitude), options: ([NSStringDrawingOptions.usesLineFragmentOrigin,NSStringDrawingOptions.usesFontLeading]), attributes: [NSAttributedString.Key.font:font], context: nil)
        return rect.size.height
    }

    
    
    func getCartData(){

        self.emptyCartPlaceholder.isHidden = true

        //not(true) -> (false)
        //not(false) -> (true)
        print("first load \(firstLoad), if false present view")
        if !self.firstLoad {
            
            self.activityind.startAnimating()
        }
        
        
        self.cartVM.getCartProducts(onSuccess: { (isSuccess) in
            //

            self.activityind.stopAnimating()
            self.actind.stopAnimating()

            if isSuccess{
                if self.cartVM.cartArr.count > 0 {
                    self.cartTableView.isHidden = false
                    self.paymentView.isHidden = false
                    self.bottomSheetView?.isHidden = false
                    self.emptyCartPlaceholder.isHidden = true
                    self.goShoppingViewPlaceholder.isHidden = true
                    self.deliveryPrice.text = self.cartVM.total_install
                    self.totalPrice.text = self.cartVM.total
                    self.payBtn.setTitle("Continue to checkout".localized, for: .normal)

                    if !self.firstLoad {
                        self.bottomSheetView?.present(in: self.view)
                    }
                    
                    self.firstLoad = true

                    

                    
                }else{
                    self.firstLoad = false
                    self.cartTableView.isHidden = true
                    self.paymentView.isHidden = true
                    self.bottomSheetView?.isHidden = true
                    self.emptyCartPlaceholder.isHidden = false
                    self.goShoppingViewPlaceholder.isHidden = false
                    self.payBtn.setTitle("Continue to checkout".localized, for: .normal)

                    //self.bottomSheetView!.dismiss()

                }
                
                self.refreshControl.endRefreshing()

                self.cartTableView.reloadData()
            }
        }) { (errMsg) in
            //
            
            let isLogged = UserDefaults.standard.bool(forKey: "isLogged")
            
            if isLogged{
                AlertViewer().showAlertView(withMessage: errMsg, onController: self)
                self.payBtn.setTitle("Continue to checkout".localized, for: .normal)

                self.activityind.stopAnimating()

            }else{
                self.firstLoad = false
                self.cartTableView.isHidden = true
                self.paymentView.isHidden = true
                self.bottomSheetView?.isHidden = true
                self.emptyCartPlaceholder.isHidden = false
                self.goShoppingViewPlaceholder.isHidden = false
                self.payBtn.setTitle("Continue to checkout".localized, for: .normal)
                self.activityind.stopAnimating()

            }

        }
    }
    
    func configure(){


        
//        self.paymentView.layer.cornerRadius = 20.0
//        self.paymentView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
//        self.paymentView.clipsToBounds = true
//
//        self.paymentView.layer.shadowColor = UIColor.black.cgColor
//        self.paymentView.layer.shadowOffset = CGSize(width: 3, height: 3)
//        self.paymentView.layer.shadowOpacity = 0.7
//        self.paymentView.layer.shadowRadius = 4.0

        self.roundView1.layer.cornerRadius = 5.0
        
        self.deliveryLbl.font = UIFont(name: "Cairo-Regular", size: 13)

        self.deliveryLbl.text = "Installation Service".localized
        
        self.deliveryPrice.font = UIFont(name: "Cairo-Regular", size: 13)
        

        
        self.totalPriceLbl.font = UIFont(name: "Cairo-Bold", size: 13)

        self.totalPriceLbl.text = "Total Price".localized
               
        self.totalPrice.font = UIFont(name: "Cairo-Bold", size: 13)
        

        self.payBtn.setTitle("Continue to checkout".localized, for: .normal)
        
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
        //self.paramsDic["cart"] = self.cartVM.cartId ?? -1

        self.cartVM.createOrder(apiParameters: self.paramsDic, onSuccess: { (isSuccess) in
            if isSuccess{
                self.actind.stopAnimating()

                UserDefaults.standard.set(true, forKey: "inOrder")
                
                self.payBtn.setTitle("Continue to checkout".localized, for: .normal)

                self.performSegue(withIdentifier: "gotoPayment", sender: self)
            }
        }) { (errMsg) in
            //
            self.payBtn.setTitle("Continue to checkout".localized, for: .normal)
            
            self.actind.stopAnimating()

            AlertViewer().showAlertView(withMessage: "We encountered an error. Try again later", onController: self)
        }
        
    }
    
    func reloadTableData(rowChanged: Int){
        self.cartTableView.reloadRows(at: [IndexPath(row: rowChanged, section: 0)], with: .none)
        self.updateQuantity(rowChanged: rowChanged)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoPayment"{
            let destinationNavigationController = segue.destination as! UINavigationController
            let targetController = destinationNavigationController.topViewController as! addressPaymentViewController

            targetController.orderId =  self.cartVM.orderId ?? -1
            targetController.orderItemId =  self.cartVM.orderItemId ?? -1
            //destCont.orderDic = self.paramsDic
            targetController.cartId = self.cartVM.cartId ?? -1
            //orderItemId
            //var cartId: Int?
        }
    }
    

    func updateQuantity(rowChanged: Int){
        print("change Editing")
        let index = rowChanged
        var params: [String: Any] = [:]
        self.payBtn.setTitle("".localized, for: .normal)

        self.actind.startAnimating()

        //params["id"] = self.cartVM.cartArr[index].id
        params["quantity"] = self.cartVM.cartArr[index].quantity
        self.cartVM.addToCart(id: self.cartVM.cartArr[index].id ?? -1, apiParameters: params, onSuccess: { (isSuccess) in
            //
            if isSuccess{
                //self.firstLoad = false
                self.payBtn.setTitle("Continue to checkout".localized, for: .normal)

                self.actind.stopAnimating()

                self.getCartData()
            }
            
        }) { (error) in
            //
            self.payBtn.setTitle("Continue to checkout".localized, for: .normal)

            self.actind.stopAnimating()

            self.getCartData()

        }

    }
    @objc func textFieldDidChange(_ textField: UITextField) {
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

extension cartViewController {
    
    func bottomSheetPresentationController(
        _ controller: UIPresentationController,
        shouldDismissBy action: BottomSheetView.DismissAction
    ) -> Bool {
        return true
    }

    func bottomSheetPresentationController(
        _ controller: UIPresentationController,
        didCancelDismissBy action: BottomSheetView.DismissAction
    ) {
        print("Did cancel dismiss by \(action)")
    }

    func bottomSheetPresentationController(
        _ controller: UIPresentationController,
        willDismissBy action: BottomSheetView.DismissAction?
    ) {
        print("Will dismiss dismiss by \(String(describing: action))")
    }

    func bottomSheetPresentationController(
        _ controller: UIPresentationController,
        didDismissBy action: BottomSheetView.DismissAction?
    ) {
        print("Did dismiss dismiss by \(String(describing: action))")
    }
}


extension UILabel {
    var numberOfVisibleLines: Int {
//        let maxSize = CGSize(width: frame.size.width, height: CGFloat(MAXFLOAT))
//        let textHeight = sizeThatFits(maxSize).height
//        let lineHeight = font.lineHeight
//        return Int(ceil(textHeight / lineHeight))
        let zone = CGSize(width: intrinsicContentSize.width, height: CGFloat(MAXFLOAT))
        let fittingHeight = Float(self.sizeThatFits(zone).height)
        return lroundf(fittingHeight / Float(font.lineHeight))
    }
}


extension UILabel {

    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {

        guard let labelText = self.text else { return }

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple

        let attributedString:NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }

        // (Swift 4.2 and above) Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))


        // (Swift 4.1 and 4.0) Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

        //attributedString
        self.attributedText = attributedString
    }
}
