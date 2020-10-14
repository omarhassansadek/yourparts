//
//  confirmationViewController.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/21/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import FINNBottomSheet


class confirmationViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, BottomSheetPresentationControllerDelegate{
 
    @IBOutlet weak var acceptPromoBtn: UIButton!
    
    @IBOutlet weak var roundView: UIView!
    
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet var paymentVM: paymentViewModel!
    
    private lazy var bottomSheetTransitioningDelegate = BottomSheetTransitioningDelegate(
        contentHeights: [.bottomSheetAutomatic, UIScreen.main.bounds.size.height - 200],
        presentationDelegate: self
    )

    var orderId: Int?

    
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

    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        self.promoCodeTitle.text = "Enter Promo Code".localized

        self.promoCodeTitle.font = UIFont(name: "Cairo-SemiBold", size: 18)
        
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
        
        self.roundView.layer.cornerRadius = 12.5
                
            //self.view.addSubview(self.bottomView)
        let bottomSheetView = BottomSheetView(
                    contentView: bottomView,
                    contentHeights: [250, 450]
        )
        bottomSheetView.present(in: self.view )

                
        self.getOrderDetails()
        
        self.confirmTableView.delegate = self
        
        self.confirmTableView.dataSource = self

        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }

        
        self.navigationController?.navigationBar.tintColor = primaryColor
        
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
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
          return 1
      }
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 + self.paymentVM.itemsArr.count
      }
      
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
        if indexPath.row == 0{
            let confirmCell = tableView.dequeueReusableCell(withIdentifier: "confirmCell") as! confirmAddressTableViewCell

            return confirmCell

        }else if indexPath.row == 1{
            let payDetailCell = tableView.dequeueReusableCell(withIdentifier: "payDetailCell") as! paymentMethodTableViewCell

            return payDetailCell
        }else{
            let cartCell = tableView.dequeueReusableCell(withIdentifier: "cartCell") as! cartTableViewCell
            cartCell.productName.text = self.paymentVM.itemsArr[indexPath.row - 2].product_name
            cartCell.productPrice.text = self.paymentVM.itemsArr[indexPath.row - 2].unit_price
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

    
    func getOrderDetails(){
        self.paymentVM.getOrder(id: orderId ?? -1, onSuccess: { (isSuccess) in
            //
            if isSuccess{
                self.confirmTableView.reloadData()
            }
        }) { (errMsg) in
            //
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
