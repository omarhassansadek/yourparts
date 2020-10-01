//
//  addCarViewController.swift
//  yourparts
//
//  Created by iMac1 on 7/8/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class addCarViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var yearModel: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var modelLbl: UILabel!
    @IBOutlet weak var brandLbl: UILabel!
    @IBOutlet weak var addNewCarBtn: UIButton!
    @IBOutlet weak var yearManuTF: UITextField!
    @IBOutlet weak var chooseModelTF: UITextField!
    @IBOutlet weak var chooseBrandTF: UITextField!
    @IBOutlet weak var chooseType: UITextField!
    
    @IBOutlet weak var addCarVM: addCarViewModel!
    
    var carTypesPickerView = UIPickerView()
    var carMakerPickerView = UIPickerView()
    var carModelsPickerView = UIPickerView()
    var carYearsPickerView = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getTypes()
        
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
//        self.chooseBrandTF.attributedPlaceholder = NSAttributedString(string: "Choose Brand".localized , attributes: [
//            .foregroundColor: UIColor.darkGray,
//            .font: UIFont(name: "TheMixArab", size: 14 )!
//            ])
//
//        self.chooseModelTF.attributedPlaceholder = NSAttributedString(string: "Choose Model".localized , attributes: [
//            .foregroundColor: UIColor.darkGray,
//            .font: UIFont(name: "TheMixArab", size: 14 )!
//            ])
//
//        self.yearManuTF.attributedPlaceholder = NSAttributedString(string: "Manufacture Year".localized , attributes: [
//            .foregroundColor: UIColor.darkGray,
//            .font: UIFont(name: "TheMixArab", size: 14 )!
//            ])
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBOutlet var roundViews: [UIView]!
    
    var selectedTypeId: Int = -1
    
    
    func getTypes(){
        self.addCarVM.getCarTypes(onSuccess: { (isSuccess) in
            //
            if isSuccess{
                self.carTypesPickerView.reloadAllComponents()
                self.chooseType.text = self.addCarVM.carTypes[0].name ?? ""
                self.getMakers(type_id: self.addCarVM.carTypes[0].id ?? -1)
                self.selectedTypeId = self.addCarVM.carTypes[0].id ?? -1
            }
            
        }) { (errMsg) in
            //
        }
    }
    
    func getMakers(type_id: Int){
        self.addCarVM.getCarMakers(id: type_id, onSuccess: { (isSucces) in
            if isSucces{
                self.carMakerPickerView.reloadAllComponents()
                self.chooseBrandTF.text = self.addCarVM.carMakers[0].name ?? ""
                self.getModels(maker_id: self.addCarVM.carMakers[0].id ?? -1)

            }
        }) { (errMsg) in
            //
        }
    }
    
    func getModels(maker_id: Int ){
        self.addCarVM.getCarModels(id: maker_id, selectedType: self.selectedTypeId, onSuccess: { (isSucces) in
            if isSucces{
                self.carModelsPickerView.reloadAllComponents()
                self.chooseModelTF.text = self.addCarVM.carModels[0].name ?? ""

            }
        }) { (errMsg) in
            //
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
            return ""
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
                }else if pickerView == self.carMakerPickerView{
                    self.chooseBrandTF.text = self.addCarVM.carMakers[row].name ?? ""
                    self.getModels(maker_id: self.addCarVM.carMakers[row].id ?? -1)

                }else if pickerView == self.carModelsPickerView{
                    self.chooseModelTF.text = self.addCarVM.carModels[row].name ?? ""

                    //return ""
                }else{
                    
                }
        //        }else if pickerView == self.carModelsPickerView{
        //            //return self.addCarVM.carModels.count
        //        }else{
        //            //return self.addCarVM.carYears.count
        //        }
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
