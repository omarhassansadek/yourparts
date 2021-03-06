//
//  addAddressViewController.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/20/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class addAddressViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var activityind: NVActivityIndicatorView!
    
    @IBOutlet weak var appartmentTf: UITextField!
    @IBOutlet weak var floorNoTf: UITextField!
    @IBOutlet weak var buildingNoTf: UITextField!
    @IBOutlet weak var streetTf: UITextField!
    @IBOutlet weak var regionTf: UITextField!
    @IBOutlet weak var cityTf: UITextField!
    
    @IBOutlet weak var addAddressLbl: UILabel!
    
    @IBOutlet weak var handlerView: UIView!
    
    @IBOutlet var roundViews: [UIView]!
    
    @IBOutlet weak var addAddressBtn: UIButton!
    
    @IBOutlet var paymentVM: paymentViewModel!
    
    var cityPickerView = UIPickerView()
    
    var regionPickerView = UIPickerView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

       // self.preferredContentSize = CGSize(width: self.view.frame.width , height: 100)
        
        self.handlerView.layer.cornerRadius = 5.0
        
        for oneView in roundViews{
            oneView.layer.cornerRadius = 15.0
        }
        
        self.cityPickerView.delegate = self
        self.cityPickerView.dataSource = self
        
        self.regionPickerView.delegate = self
        self.regionPickerView.dataSource = self
        
        self.cityTf.inputView = cityPickerView
        self.regionTf.inputView = regionPickerView

        
        self.addAddressLbl.text = "Add Address".localized
        
        self.addAddressLbl.font = UIFont(name: "Cairo-Bold", size: 16)

        
        
        self.cityTf.attributedPlaceholder = NSAttributedString(string: "City".localized , attributes: [
                  .foregroundColor: UIColor.darkGray,
                  .font: UIFont(name: "Cairo-Regular", size: 12 )!
              ])
              
        
        self.regionTf.attributedPlaceholder = NSAttributedString(string: "Region".localized , attributes: [
                  .foregroundColor: UIColor.darkGray,
                  .font: UIFont(name: "Cairo-Regular", size: 12 )!
              ])
              
        
        self.streetTf.attributedPlaceholder = NSAttributedString(string: "Street".localized , attributes: [
                  .foregroundColor: UIColor.darkGray,
                  .font: UIFont(name: "Cairo-Regular", size: 12 )!
              ])
              
        self.buildingNoTf.attributedPlaceholder = NSAttributedString(string: "Building".localized , attributes: [
                  .foregroundColor: UIColor.darkGray,
                  .font: UIFont(name: "Cairo-Regular", size: 12 )!
              ])
              
        
        self.floorNoTf.attributedPlaceholder = NSAttributedString(string: "Floor".localized , attributes: [
                        .foregroundColor: UIColor.darkGray,
                        .font: UIFont(name: "Cairo-Regular", size: 12 )!
                    ])
        
        
        self.appartmentTf.attributedPlaceholder = NSAttributedString(string: "Appartment".localized , attributes: [
                                    .foregroundColor: UIColor.darkGray,
                                    .font: UIFont(name: "Cairo-Regular", size: 12 )!
                                ])
        
        self.addAddressBtn.layer.cornerRadius = 20.0
        self.addAddressBtn.setTitle("Save Address".localized, for: .normal)
        self.addAddressBtn.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 14)

        self.getRegions()
        //self.getCities()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addBtnClicked(_ sender: Any) {
        
        self.activityind.startAnimating()
        
        self.addAddressBtn.setTitle("".localized, for: .normal)

        var parametersToBeSend: [String: Any] = [:]
        parametersToBeSend["priority"] = 1
        parametersToBeSend["name"] = "Omar"
        parametersToBeSend["zip_code"] = "11111"
        parametersToBeSend["region"] = self.cityTf.text
        parametersToBeSend["city"] = self.regionTf.text
        parametersToBeSend["address"] = self.streetTf.text
        parametersToBeSend["building"] = self.buildingNoTf.text
        parametersToBeSend["floor"] = self.floorNoTf.text
        parametersToBeSend["appartment"] = self.appartmentTf.text
    
        
        self.paymentVM.addUserAddress(addressParameters: parametersToBeSend, onSuccess: { (isSuccess) in
            //

            self.activityind.stopAnimating()
            
            self.addAddressBtn.backgroundColor = SuccessPrimaryColor

            self.addAddressBtn.setTitle("Saved Successfully".localized, for: .normal)

            Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(self.updateCounter), userInfo: nil, repeats: false)

            
        }) { (errMsg) in
            //
            AlertViewer().showAlertView(withMessage: errMsg, onController: self)
            self.activityind.stopAnimating()
            self.addAddressBtn.setTitle("Save Address".localized, for: .normal)
            self.addAddressBtn.backgroundColor = primaryColor
        }

    }
    
    @objc func updateCounter() {
        
        NotificationCenter.default.post(name: Notification.Name("finishAddAddress"), object: nil)


        self.dismiss(animated: true, completion: nil)
    }
    
    func getCities(id: Int){
        self.paymentVM.getAllCity(id: id, onSuccess: { (isSuccess) in
            //
            if isSuccess{
                self.cityPickerView.reloadAllComponents()
                if self.paymentVM.ctitiesArr.count > 0 {
                    self.cityTf.text = self.paymentVM.ctitiesArr[0].name
                    //self.getRegions(id: self.paymentVM.ctitiesArr[0].id ?? -1)
                }
            }
        }) { (errMsg) in
            //
        }
    }
    
    func getRegions(){
        self.paymentVM.getAllregions( onSuccess: { (isSuccess) in
            if isSuccess{
                self.regionPickerView.reloadAllComponents()
                if self.paymentVM.regionArr.count > 0{
                    self.regionTf.text = self.paymentVM.regionArr[0].name
                    self.getCities(id: self.paymentVM.regionArr[0].id ?? -1)
                }else{
                    self.regionTf.text = ""
                }
            }
        }) { (errMsg) in
            //
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == cityPickerView{
           return self.paymentVM.ctitiesArr.count
        }else{
           return self.paymentVM.regionArr.count

        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == cityPickerView{
            return self.paymentVM.ctitiesArr[row].name ?? ""
        }else{
            return self.paymentVM.regionArr[row].name ?? ""

        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == regionPickerView{
            self.regionTf.text = self.paymentVM.regionArr[row].name ?? ""
            self.getCities(id: self.paymentVM.regionArr[row].id ?? -1)
            
        }else{
            self.cityTf.text = self.paymentVM.ctitiesArr[row].name ?? ""
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
