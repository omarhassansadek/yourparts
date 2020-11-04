//
//  addCarViewController.swift
//  yourparts
//
//  Created by iMac1 on 7/8/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class addCarViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    var autoSelect: Bool?

    @IBOutlet weak var yearModel: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var brandLbl: UILabel!
    @IBOutlet weak var addNewCarBtn: UIButton!
    @IBOutlet weak var yearManuTF: UITextField!
    @IBOutlet weak var chooseModelTF: UITextField!
    @IBOutlet weak var chooseBrandTF: UITextField!
    @IBOutlet weak var chooseType: UITextField!
    
    @IBOutlet weak var chooseTypeView: UIView!
    @IBOutlet weak var chooseBrandView: UIView!
    @IBOutlet weak var chooseModelsView: UIView!
    @IBOutlet weak var chooseYearView: UIView!
    
    @IBOutlet weak var addCarVM: addCarViewModel!
    
    var carTypesPickerView = UIPickerView()
    var carMakerPickerView = UIPickerView()
    var carModelsPickerView = UIPickerView()
    var carYearsPickerView = UIPickerView()

    @IBOutlet weak var activityind: NVActivityIndicatorView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getTypes()
        
        self.chooseType.attributedPlaceholder = NSAttributedString(string: "Choose Type".localized , attributes: [
                     .foregroundColor: UIColor.black,
                     .font: UIFont(name: "Cairo-Semibold", size: 14 )!
                 ])


        self.chooseType.font = UIFont(name: "Cairo-Semibold", size: 14 )
        self.chooseBrandTF.font = UIFont(name: "Cairo-Semibold", size: 14 )
        self.chooseModelTF.font = UIFont(name: "Cairo-Semibold", size: 14 )
        self.yearManuTF.font = UIFont(name: "Cairo-Semibold", size: 14 )


        self.chooseType.tintColor = .clear
        self.chooseModelTF.tintColor = .clear
        self.chooseBrandTF.tintColor = .clear
        self.yearManuTF.tintColor = .clear

//        self.chooseType.delegate = self
//        self.chooseModelTF.delegate = self
//        self.chooseBrandTF.delegate = self
//        self.yearManuTF.delegate = self
//

        self.chooseType.inputView = self.carTypesPickerView
        self.chooseBrandTF.inputView = self.carMakerPickerView
        self.chooseModelTF.inputView = self.carModelsPickerView
        self.yearManuTF.inputView = self.carYearsPickerView

        self.carTypesPickerView.delegate = self
        self.carTypesPickerView.dataSource = self

        self.carMakerPickerView.delegate = self
        self.carMakerPickerView.dataSource = self

        self.carModelsPickerView.delegate = self
        self.carModelsPickerView.dataSource = self

        self.carYearsPickerView.delegate = self
        self.carYearsPickerView.dataSource = self

        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        self.navigationController?.navigationBar.tintColor = primaryColor
        
        
        self.navigationController?.navigationBar.shadowImage = UIImage()

        self.navigationController?.navigationBar.barTintColor = anotherGreyColor

        self.title = "Add your car".localized
               
        self.navigationController?.navigationBar.titleTextAttributes =
                   [NSAttributedString.Key.foregroundColor: UIColor.black,
                    NSAttributedString.Key.font: UIFont(name: "Cairo-Bold", size: 18)!]
        
        
        self.addNewCarBtn.layer.cornerRadius = 15.0
        self.addNewCarBtn.setTitle("Add Car".localized, for: .normal)
        self.addNewCarBtn.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 16)
        
        self.modelLbl.text = "Choose Model".localized
        self.modelLbl.font = UIFont(name: "Cairo-SemiBold", size: 14 )
        
        self.typeLbl.text = "Choose Type".localized
        self.typeLbl.font = UIFont(name: "Cairo-SemiBold", size: 14 )

        
        self.brandLbl.text = "Choose Brand".localized
        self.brandLbl.font = UIFont(name: "Cairo-SemiBold", size: 14 )

        
        self.yearModel.text = "Manufacture Year".localized
        self.yearModel.font = UIFont(name: "Cairo-SemiBold", size: 14 )


        for oneView in roundViews{
            oneView.layer.cornerRadius = 12.5
        }
        
//
//        self.chooseType.attributedPlaceholder = NSAttributedString(string: "Choose Type".localized , attributes: [
//            .foregroundColor: UIColor.darkGray,
//            .font: UIFont(name: "TheMixArab", size: 14 )!
//            ])
//
        self.chooseBrandTF.attributedPlaceholder = NSAttributedString(string: "Choose Brand".localized , attributes: [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "TheMixArab", size: 14 )!
            ])

        self.chooseModelTF.attributedPlaceholder = NSAttributedString(string: "Choose Model".localized , attributes: [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "TheMixArab", size: 14 )!
            ])

        self.yearManuTF.attributedPlaceholder = NSAttributedString(string: "Manufacture Year".localized , attributes: [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "TheMixArab", size: 14 )!
            ])
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBOutlet var roundViews: [UIView]!
    
    var selectedTypeId: Int = 1
    
    var selectedMakerId: Int = -1

    var selectedModelId: Int = -1

    var selectedCarId: Int = -1

    
    func getTypes(){
        self.addCarVM.getCarTypes(onSuccess: { (isSuccess) in
            //
            if isSuccess{
                self.carTypesPickerView.reloadAllComponents()
                //self.chooseType.text = self.addCarVM.carTypes[0].name ?? ""
                //self.getMakers(type_id: self.addCarVM.carTypes[0].id ?? -1)
                //self.selectedTypeId = self.addCarVM.carTypes[0].id ?? -1
            }
            
        }) { (errMsg) in
            //
        }
    }
    
    func getMakers(type_id: Int){
        self.addCarVM.getCarMakers(id: type_id, onSuccess: { (isSucces) in
            if isSucces{
                self.carMakerPickerView.reloadAllComponents()
                //self.chooseBrandTF.text = self.addCarVM.carMakers[0].name ?? ""
                //self.getModels(maker_id: self.addCarVM.carMakers[0].id ?? -1)

            }
        }) { (errMsg) in
            //
        }
    }
    
    func getModels(maker_id: Int ){
        self.addCarVM.getCarModels(id: maker_id, selectedType: self.selectedTypeId, onSuccess: { (isSucces) in
            if isSucces{
                self.carModelsPickerView.reloadAllComponents()
                //self.chooseModelTF.text = self.addCarVM.carModels[0].name ?? ""
            }
        }) { (errMsg) in
            //
        }
    }
    
    func getyears(model_id: Int ){
        
        self.addCarVM.getCarYears(id: model_id, selectedType: selectedTypeId, selectedMaker: self.selectedMakerId, onSuccess: { (isSuccess) in
            //
            self.carYearsPickerView.reloadAllComponents()

        }) { (errMsg) in
            //
        }

    }

    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == chooseType{
            //self.chooseBrandView.backgroundColor = UIColor.white
            //self.chooseBrandTF.attributedPlaceholder = NSAttributedString(string: "Choose Brand".localized , attributes: [
                                         //   .foregroundColor: UIColor.black,
                                         //   .font: UIFont(name: "Cairo-Semibold", size: 14 )!
                                        //])
            self.chooseModelTF.attributedPlaceholder = NSAttributedString(string: "Choose Model".localized , attributes: [
                                     .foregroundColor: UIColor.white,
                                     .font: UIFont(name: "Cairo-Semibold", size: 14 )!
                                 ])
            self.yearManuTF.attributedPlaceholder = NSAttributedString(string: "Manufacture Year".localized , attributes: [
                                                        .foregroundColor: UIColor.white,
                                                        .font: UIFont(name: "Cairo-Semibold", size: 14 )!
                                                ])
            self.chooseBrandTF.text = ""
            self.chooseModelTF.text = ""
            self.yearManuTF.text = ""
            self.chooseBrandTF.isUserInteractionEnabled = true
            self.chooseModelTF.isUserInteractionEnabled = false
            self.yearManuTF.isUserInteractionEnabled = false
            self.chooseModelsView.backgroundColor = UIColor.lightGray
            self.chooseYearView.backgroundColor = UIColor.lightGray
            self.addNewCarBtn.backgroundColor = UIColor.lightGray
            
        }else if textField == chooseBrandTF{
            //self.chooseModelsView.backgroundColor = UIColor.lightGray
            //self.chooseModelsView.backgroundColor = UIColor.white
            //self.chooseModelTF.attributedPlaceholder = NSAttributedString(string: "Choose Model".localized , attributes: [
                 // .foregroundColor: UIColor.black,
                 // .font: UIFont(name: "Cairo-Semibold", size: 14 )!
              //])
            self.yearManuTF.attributedPlaceholder = NSAttributedString(string: "Manufacture Year".localized , attributes: [
                    .foregroundColor: UIColor.white,
                    .font: UIFont(name: "Cairo-Semibold", size: 14 )!
            ])
            self.chooseModelTF.isUserInteractionEnabled = true
            self.yearManuTF.isUserInteractionEnabled = false
            //self.chooseModelsView.backgroundColor = UIColor.white
            self.chooseYearView.backgroundColor = UIColor.lightGray
            self.chooseModelTF.text = ""
            self.yearManuTF.text = ""
            self.addNewCarBtn.backgroundColor = UIColor.lightGray
        }else if textField == chooseModelTF{
            //self.yearManuTF.attributedPlaceholder = NSAttributedString(string: "Manufacture Year".localized , attributes: [
                         //  .foregroundColor: UIColor.black,
                         //  .font: UIFont(name: "Cairo-Semibold", size: 14 )!
                   //])
                   
            self.yearManuTF.text = ""
                   
            self.yearManuTF.isUserInteractionEnabled = true
                   
            self.addNewCarBtn.backgroundColor = UIColor.lightGray
            //self.chooseYearView.backgroundColor = UIColor.lightGray
        }else{
            //print("Ok")
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == self.carTypesPickerView{
            return self.addCarVM.carTypes.count
        }else if pickerView == self.carMakerPickerView{
            return self.addCarVM.carMakers.count
        }else if pickerView == self.carModelsPickerView{
            return self.addCarVM.carModels.count
        }else{
            return self.addCarVM.carYears.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == self.carTypesPickerView{
            return self.addCarVM.carTypes[row].name ?? ""
        }else if pickerView == self.carMakerPickerView{
            return self.addCarVM.carMakers[row].name ?? ""
        }else if pickerView == self.carModelsPickerView{
            return self.addCarVM.carModels[row].name ?? ""
        }else{
            return String(self.addCarVM.carYears[row].year ?? Int())
        }
//        }else if pickerView == self.carModelsPickerView{
//            //return self.addCarVM.carModels.count
//        }else{
//            //return self.addCarVM.carYears.count
//        }

    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
                if pickerView == self.carTypesPickerView{
                    self.chooseType.text = self.addCarVM.carTypes[row].name ?? ""
                    self.getMakers(type_id: self.addCarVM.carTypes[row].id ?? -1)
                    self.selectedTypeId = self.addCarVM.carTypes[row].id ?? -1
                    self.chooseBrandView.backgroundColor = UIColor.white
                    self.chooseBrandTF.attributedPlaceholder = NSAttributedString(string: "Choose Brand".localized , attributes: [
                                 .foregroundColor: UIColor.black,
                                 .font: UIFont(name: "Cairo-Semibold", size: 14 )!
                             ])
                    self.chooseModelTF.attributedPlaceholder = NSAttributedString(string: "Choose Model".localized , attributes: [
                          .foregroundColor: UIColor.white,
                          .font: UIFont(name: "Cairo-Semibold", size: 14 )!
                      ])
                    self.yearManuTF.attributedPlaceholder = NSAttributedString(string: "Manufacture Year".localized , attributes: [
                                             .foregroundColor: UIColor.white,
                                             .font: UIFont(name: "Cairo-Semibold", size: 14 )!
                                     ])
                    self.chooseBrandTF.text = ""
                    self.chooseModelTF.text = ""
                    self.yearManuTF.text = ""
                    self.chooseBrandTF.isUserInteractionEnabled = true
                    self.chooseModelTF.isUserInteractionEnabled = false
                    self.yearManuTF.isUserInteractionEnabled = false
                    self.chooseModelsView.backgroundColor = UIColor.lightGray
                    self.chooseYearView.backgroundColor = UIColor.lightGray

                    self.addNewCarBtn.backgroundColor = UIColor.lightGray

                }else if pickerView == self.carMakerPickerView{
                    self.chooseBrandTF.text = self.addCarVM.carMakers[row].name ?? ""
                    self.getModels(maker_id: self.addCarVM.carMakers[row].id ?? -1)
                    self.selectedMakerId = self.addCarVM.carMakers[row].id ?? -1
                    self.chooseModelsView.backgroundColor = UIColor.white
                    self.chooseModelTF.attributedPlaceholder = NSAttributedString(string: "Choose Model".localized , attributes: [
                          .foregroundColor: UIColor.black,
                          .font: UIFont(name: "Cairo-Semibold", size: 14 )!
                      ])
                    self.yearManuTF.attributedPlaceholder = NSAttributedString(string: "Manufacture Year".localized , attributes: [
                            .foregroundColor: UIColor.white,
                            .font: UIFont(name: "Cairo-Semibold", size: 14 )!
                    ])
                    self.chooseModelTF.isUserInteractionEnabled = true
                    self.yearManuTF.isUserInteractionEnabled = false
                    self.chooseModelsView.backgroundColor = UIColor.white
                    self.chooseYearView.backgroundColor = UIColor.lightGray
                    self.chooseModelTF.text = ""
                    self.yearManuTF.text = ""
                    self.addNewCarBtn.backgroundColor = UIColor.lightGray


                }else if pickerView == self.carModelsPickerView{
                    self.selectedModelId = self.addCarVM.carModels[row].id ?? -1
                    self.chooseModelTF.text = self.addCarVM.carModels[row].name ?? ""
                    self.chooseYearView.backgroundColor = UIColor.white
                    self.getyears(model_id: self.addCarVM.carModels[row].id ?? -1)

                      self.yearManuTF.attributedPlaceholder = NSAttributedString(string: "Manufacture Year".localized , attributes: [
                            .foregroundColor: UIColor.black,
                            .font: UIFont(name: "Cairo-Semibold", size: 14 )!
                    ])
                    
                    self.yearManuTF.text = ""
                    
                    self.yearManuTF.isUserInteractionEnabled = true
                    
                    self.addNewCarBtn.backgroundColor = UIColor.lightGray


                    //return ""
                }else{
                    
                    print(self.selectedTypeId)
                    print(self.selectedMakerId)
                    print(self.selectedModelId)
                    print(self.addCarVM.carYears[row].year ?? Int())
                    self.selectedCarId = self.addCarVM.carYears[row].id ?? Int()
                    self.yearManuTF.text = String(self.addCarVM.carYears[row].year ?? Int())
                    self.addNewCarBtn.backgroundColor = primaryColor
                    
                }
        
        
        //self.view.endEditing(true)
        //        }else if pickerView == self.carModelsPickerView{
        //            //return self.addCarVM.carModels.count
        //        }else{
        //            //return self.addCarVM.carYears.count
        //        }
    }
    
    
    @IBAction func addNewCarBtnClicked(_ sender: Any) {
        
        
        self.addNewCarBtn.setTitle("", for: .normal)
        self.activityind.startAnimating()
        var paramsDic: [String: Any] = [:]

        if let userId = UserDefaults.standard.string(forKey: "userid"){
            paramsDic["customer"] = Int(userId)
        }
        paramsDic["vehicle"] = self.selectedCarId

        
        self.addCarVM.addCar(params: paramsDic, onSuccess: { (vehicleDic) in
            //
            self.activityind.stopAnimating()
            self.addNewCarBtn.setTitle("Add Car Successfully".localized, for: .normal)
            self.addNewCarBtn.backgroundColor = SuccessPrimaryColor
            Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(self.carAddedSuccess), userInfo: nil, repeats: false)
            //let carSelected = UserDefaults.standard.bool(forKey: "carChecked")
            

            if self.autoSelect ?? false{
                UserDefaults.standard.set(true, forKey: "carChecked")
                
                if let vehicle_id = vehicleDic["id"]{
                    UserDefaults.standard.set(vehicle_id, forKey: "vehicle_id")
                }

                if let vehicle_name = vehicleDic["vehicle_name"]{
                    UserDefaults.standard.set(vehicle_name, forKey: "vehicle_name")
                }

                if let model_name = vehicleDic["model_name"]{
                    UserDefaults.standard.set(model_name, forKey: "model_name")
                }

                if let year = vehicleDic["year"]{
                    UserDefaults.standard.set(year, forKey: "year")
                }

                if let vehicle = vehicleDic["vehicle"]{
                    UserDefaults.standard.set(vehicle, forKey: "vehicle")
                }

                if let image = vehicleDic["image"]{
                    UserDefaults.standard.set(image, forKey: "image")
                }else{
                    UserDefaults.standard.set("", forKey: "image")
                }
            }
        }) { (errMsg) in
            //
            self.activityind.stopAnimating()
            self.addNewCarBtn.setTitle("Add Car".localized, for: .normal)
            AlertViewer().showAlertView(withMessage: errMsg, onController: self)

        }
      
    }
    
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    
    @objc func carAddedSuccess() {
        
        //NotificationCenter.default.post(name: Notification.Name("finishAddAddress"), object: nil)
        self.navigationController?.popViewController(animated: true)

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
