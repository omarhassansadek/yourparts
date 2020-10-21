//
//  confirmationViewController.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/21/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import FINNBottomSheet
import NVActivityIndicatorView

class confirmationViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, BottomSheetPresentationControllerDelegate{
    
    @IBOutlet weak var dummyWhiteView: UIView!
    
    @IBOutlet weak var payActInd: NVActivityIndicatorView!
    
    @IBOutlet weak var promoTf: UITextField!
    
    @IBOutlet weak var acceptPromoBtn: UIButton!
    
    @IBOutlet weak var roundView: UIView!
    
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet var paymentVM: paymentViewModel!
    
    private lazy var bottomSheetTransitioningDelegate = BottomSheetTransitioningDelegate(
        contentHeights: [.bottomSheetAutomatic, UIScreen.main.bounds.size.height - 200],
        presentationDelegate: self
    )

    var orderId: Int?
    
    @IBOutlet weak var promoPrice: UILabel!
    
    @IBOutlet weak var installationPrice: UILabel!
    
    @IBOutlet weak var shippingPrice: UILabel!
    
    @IBOutlet weak var totalPrice: UILabel!
    
    @IBOutlet weak var confirmTableView: UITableView!
    
    @IBOutlet weak var promoCodeTitle: UILabel!
    
    @IBOutlet weak var acceptBtn: UIButton!
    
    @IBOutlet weak var validPromoLbl: UILabel!
    
    @IBOutlet weak var orderDetailsLbl: UILabel!
    
    @IBOutlet weak var totalCartLbl: UILabel!
    
    @IBOutlet weak var shippingLbl: UILabel!
    
    @IBOutlet weak var installLbl: UILabel!
    
    @IBOutlet weak var promoLbl: UILabel!
    
    var orderItemId: Int?

    @IBOutlet weak var payBtn: UIButton!
    
    
    @IBOutlet weak var alertView: UIView!
    
    @IBOutlet weak var textViewlLbl: UITextView!
    
    @IBOutlet weak var saveBtn: UIButton!
    
    @IBOutlet weak var cancelBtn: UIButton!
    
    @IBOutlet weak var dimmedView: UIView!
    
    @IBOutlet weak var checkico: UIImageView!
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        let button1 = UIBarButtonItem(image: UIImage(named: "close-1"), style: .plain, target: self, action: Selector("dismissCheckout")) // action:#selector(Class.MethodName) for swift 3
        self.navigationItem.rightBarButtonItem  = button1

        
        self.saveBtn.setTitle("Continue".localized, for: .normal)
        
        self.saveBtn.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 14)
        
        self.saveBtn.layer.cornerRadius = 12.5
        
        
        self.cancelBtn.setTitle("Cancel".localized, for: .normal)
        
        self.cancelBtn.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 14)
        
        self.cancelBtn.layer.cornerRadius = 12.5

        
        self.alertView.layer.cornerRadius = 15.0

        
        self.textViewlLbl.text = "Click to make sure to pay when received".localized
        self.textViewlLbl.font = UIFont(name: "Cairo-Regular", size: 14)!
        
        
        self.bottomView.isHidden = true
        
        self.payBtn.isHidden = true

        Timer.scheduledTimer(timeInterval: 0.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: false)

        
        self.promoTf.attributedPlaceholder = NSAttributedString(string: "Enter Promo Code".localized , attributes: [
            .foregroundColor: UIColor.darkGray,
            .font: UIFont(name: "Cairo-Regular", size: 12 )!
        ])

        
        self.promoCodeTitle.text = "Enter Promo Code".localized

        self.promoCodeTitle.font = UIFont(name: "Cairo-SemiBold", size: 18)
        

        self.totalPrice.font = UIFont(name: "Cairo-Regular", size: 13)

        

        self.shippingPrice.font = UIFont(name: "Cairo-Regular", size: 13)
               
        

        self.installationPrice.font = UIFont(name: "Cairo-Regular", size: 13)
               
    
        self.promoPrice.font = UIFont(name: "Cairo-Regular", size: 13)
        

        self.totalCartLbl.text = "Cart Total".localized

        self.totalCartLbl.font = UIFont(name: "Cairo-Bold", size: 12)

        
        self.shippingLbl.text = "Shipping".localized

        self.shippingLbl.font = UIFont(name: "Cairo-Bold", size: 12)
               
        
        self.installLbl.text = "Install Part".localized

        self.installLbl.font = UIFont(name: "Cairo-Bold", size: 12)
               
        
        self.promoLbl.text = "Promo Code".localized

        self.promoLbl.font = UIFont(name: "Cairo-Bold", size: 12)
               
        self.validPromoLbl.text = "xvalid".localized

        self.validPromoLbl.font = UIFont(name: "Cairo-SemiBold", size: 12)
        
        self.orderDetailsLbl.text = "Order Details".localized

        self.orderDetailsLbl.font = UIFont(name: "Cairo-SemiBold", size: 18)
               
        self.validPromoLbl.textColor = UIColor(displayP3Red: 0/255, green: 186/255, blue: 6/255, alpha: 1.0)

        self.acceptBtn.setTitle("Apply".localized, for: .normal)
        
        self.acceptBtn.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 12)
        
       

         
         self.payBtn.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 15)
        
        self.payBtn.layer.cornerRadius = 12.5
        
        self.roundView.layer.cornerRadius = 12.5
                
        
  

                
        self.getOrderDetails()
        
        self.confirmTableView.delegate = self
        
        self.confirmTableView.dataSource = self

        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }

        
        self.navigationItem.hidesBackButton = true

        
        self.navigationController?.navigationBar.tintColor = UIColor.black
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationController?.navigationBar.barTintColor = anotherGreyColor
        
        self.title = "Confirmation".localized
        
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.black,
             NSAttributedString.Key.font: UIFont(name: "Cairo-Bold", size: 18)!]

        let nib = UINib(nibName: String(describing: confirmAddressTableViewCell.self), bundle: nil)
        self.confirmTableView.register(nib, forCellReuseIdentifier: "confirmCell")

        let nib2 = UINib(nibName: String(describing: paymentMethodTableViewCell.self), bundle: nil)
        self.confirmTableView.register(nib2, forCellReuseIdentifier: "payDetailCell")
        
        let nib3 = UINib(nibName: String(describing: cartTableViewCell.self), bundle: nil)
        self.confirmTableView.register(nib3, forCellReuseIdentifier: "cartCell")

        // Do any additional setup after loading the view.
    }
    
    @objc func updateCounter() {
        
        
        
        self.bottomView.isHidden = false
        
        self.payBtn.isHidden = false

           //let height = self.tabBarController?.tabBar.frame.height ?? 49.0

             let bottomSheetView = BottomSheetView(
                    contentView: bottomView,
                    //125 + 50
                 contentHeights: [202.5,  360]
             )
             bottomSheetView.present(in: self.view )

           self.view.bringSubviewToFront(payBtn)
           self.view.bringSubviewToFront(dummyWhiteView)
           self.view.bringSubviewToFront(dimmedView)
           self.view.bringSubviewToFront(alertView)
       }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
          return 1
      }
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 + self.paymentVM.itemsArr.count
      }
      
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
        if indexPath.row == 0{
            let confirmCell = tableView.dequeueReusableCell(withIdentifier: "confirmCell") as! confirmAddressTableViewCell
            confirmCell.buildingNo.text = self.paymentVM.shippingAddress.address ?? ""
            confirmCell.region.text = "\(self.paymentVM.shippingAddress.city ?? "") - \(self.paymentVM.shippingAddress.region ?? "")"
            return confirmCell

        }else if indexPath.row == 1{
            let payDetailCell = tableView.dequeueReusableCell(withIdentifier: "payDetailCell") as! paymentMethodTableViewCell
            payDetailCell.methodLbl.text = self.paymentVM.paymentMethod
            return payDetailCell
        }else{
            let cartCell = tableView.dequeueReusableCell(withIdentifier: "cartCell") as! cartTableViewCell
            cartCell.productName.text = self.paymentVM.itemsArr[indexPath.row - 2].product_name
            cartCell.productPrice.text = self.paymentVM.itemsArr[indexPath.row - 2]._unit_price
            return cartCell

        }
     }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 195.0
        }else if indexPath.row == 1{
            return 125.0
        }else{
            return 215.0
        }
    }
    
    
    @IBAction func applyPromoClicked(_ sender: Any) {

        var doublePrice = Double(self.paymentVM.totalPrice)

        self.payActInd.startAnimating()

        self.paymentVM.applyPromoCode(code: self.promoTf.text ?? "", paymentMethod: 0, total: Int(doublePrice ?? 0.0), apiParameters: [:], onSuccess: { (isSuccess) in
            
            if isSuccess{
                self.validPromoLbl.text = "تم خصم \(self.paymentVM.discountAmount) جنيه "
                self.validPromoLbl.isHidden = false
                self.promoPrice.text = "\(self.paymentVM.discountAmount) جنيه"
                self.promoTf.isUserInteractionEnabled = false
                self.acceptBtn.setTitleColor(greyColor, for: .normal)
                self.acceptBtn.isUserInteractionEnabled = false
                
                var calculaterDic: [String:Any] = [:]
                calculaterDic["total_product"] = Int(doublePrice ?? 0.0)
                calculaterDic["shipping_fees"] = self.paymentVM.shippingValue
                calculaterDic["shipping_same_day"] = self.paymentVM.shippingSameDayValue
                calculaterDic["installation_cost"] = self.paymentVM.installationCost
                calculaterDic["promo_code"] = self.paymentVM.discountAmount
                
                self.paymentVM.calculateOrder(apiParameters: calculaterDic, onSuccess: { (isSuccess) in
                    
                    self.payActInd.stopAnimating()

                    if isSuccess{
                        self.payBtn.setTitle(" دفع \(self.paymentVM.totalPrice) جنيه", for: .normal)
                    }
                    
                }) { (errMsg) in
                    //
                    self.payActInd.stopAnimating()

                }
            }
        }) { (errorMsg) in
            //
        }
    }
    
    
    func getOrderDetails(){
        self.paymentVM.getOrder(id: orderId ?? -1, onSuccess: { (isSuccess) in
            //
            self.payBtn.setTitle(" دفع \(self.paymentVM.totalPrice) جنيه", for: .normal)
            
            self.totalPrice.text = "\(self.paymentVM.totalPrice) جنيه"
            
            self.shippingPrice.text = "\(self.paymentVM.shippingValue) جنيه"
            
            self.installationPrice.text = "\(self.paymentVM.installationCost) جنيه"

            
            self.promoPrice.text = "0 جنيه"

            if isSuccess{
                self.confirmTableView.reloadData()
            }
        }) { (errMsg) in
            //
        }
    }
    
    @objc func dismissCheckout(){
         print("clicked")
         self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goBacktoPaymentVC(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func payBtnClicked(_ sender: Any) {
        if self.paymentVM.paymentMethodKey != 0{
            self.paymentVM.payOnline(paymentMethod: Int(self.paymentVM.paymentMethodKey) ?? 0, id: self.orderItemId ?? -1, onSuccess: { (isSuccess) in
                self.performSegue(withIdentifier: "gotoPaymentOnline", sender: self)
            }) { (errMsg) in
                AlertViewer().showAlertView(withMessage: errMsg, onController: self)
            }

        }else{
            self.dimmedView.isHidden = false
            self.alertView.isHidden = false
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoPaymentOnline"{
            let destCont = segue.destination as! paymentOnlineViewController
            destCont.urlToCall = self.paymentVM.paymentUrl
            destCont.orderId = self.orderId ?? -1
        }else if segue.identifier == "gotoThankyouVC"{
            let destCont = segue.destination as! thankyouViewController
            destCont.success = true

        }
    }
    
    
    @IBAction func saveBtnClicked(_ sender: Any) {
        //self.alertView.isHidden = true
        //self.dimmedView.isHidden = true
        DispatchQueue.main.async {
            UIView.animate(withDuration: 10.5, animations: {
                self.textViewlLbl.isHidden = true
                self.saveBtn.isHidden = true
                self.cancelBtn.isHidden = true
                self.checkico.isHidden = false
                //self.alertView.isHidden = true
            }) { (isSuccess) in
                //
                self.alertView.isHidden = true
                self.dimmedView.isHidden = true
                self.performSegue(withIdentifier: "gotoThankyouVC", sender: self)
            }
        }
    }
    
    @IBAction func cancelBtnClicked(_ sender: Any) {
         self.alertView.isHidden = true
         self.dimmedView.isHidden = true
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

extension confirmationViewController {
    
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
