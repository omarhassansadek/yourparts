//
//  tiresViewController.swift
//  yourparts
//
//  Created by iMac1 on 7/28/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class tiresViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    
    @IBOutlet weak var tiresVM: tiresViewModel!
    
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var rightView: UIView!
    @IBOutlet weak var leftView: UIView!
    //    var tableArr = ["1" , "3" , "3" , "3" , "3" , "3" , "3"]
//    
//    @IBOutlet weak var vcTitle: UILabel!
//    @IBOutlet weak var tiresTableView: UITableView!
    
    @IBOutlet var roundViews: [UIView]!
    @IBOutlet weak var type1Btn: UIButton!
    @IBOutlet weak var type2Btn: UIButton!
    
    @IBOutlet weak var modelTireTf: UITextField!
    @IBOutlet weak var widthTf: UITextField!
    @IBOutlet weak var heightTf: UITextField!
    @IBOutlet weak var radiusTf: UITextField!
    
    @IBOutlet weak var radiusLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var widthLbl: UILabel!
    
    
    var yearPickerView = UIPickerView()

    var rimSizePickerView = UIPickerView()

    var tireSizePickerView = UIPickerView()
    
    var rachoSizePickerView = UIPickerView()

    var yearsArr = ["2020" , "2019" , "2018" , "2017" , "2016"]

    @IBOutlet weak var modelYearLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.modelTireTf.inputView = yearPickerView
        
        self.widthTf.inputView = rimSizePickerView

        self.heightTf.inputView = tireSizePickerView

        self.radiusTf.inputView = rachoSizePickerView

        self.yearPickerView.dataSource = self
        self.yearPickerView.delegate = self

        self.rimSizePickerView.dataSource = self
        self.rimSizePickerView.delegate = self

        self.tireSizePickerView.dataSource = self
        self.tireSizePickerView.delegate = self

        self.rachoSizePickerView.dataSource = self
        self.rachoSizePickerView.delegate = self


        self.searchBtn.layer.cornerRadius = 12.5
        
        self.searchBtn.setTitle("Search Tyres".localized, for: .normal)
        
        self.searchBtn.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 16)
        
        
        self.navigationController?.navigationBar.titleTextAttributes =
        [NSAttributedString.Key.foregroundColor: UIColor.darkGray,
         NSAttributedString.Key.font: UIFont(name: "Cairo-SemiBold", size: 16)!]

        self.title = "Enter Elements".localized
        
        self.navigationController?.navigationBar.isHidden = false

        self.navigationController?.navigationBar.shadowImage = UIImage()

        self.navigationController?.navigationBar.barTintColor = anotherGreyColor
        
        self.widthLbl.text = "Radius".localized

        self.heightLbl.text = "Height".localized
        
        self.radiusLbl.text = "Width".localized

        self.widthLbl.font = UIFont(name: "Cairo-Regular", size: 12)
        
        self.heightLbl.font = UIFont(name: "Cairo-Regular", size: 12)
        
        self.radiusLbl.font = UIFont(name: "Cairo-Regular", size: 12)

                
        self.leftView.clipsToBounds = true
        self.leftView.layer.cornerRadius = 25.0
        self.leftView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        self.rightView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        self.rightView.clipsToBounds = true
        self.rightView.layer.cornerRadius = 25.0

        self.type1Btn.setTitle("Light Truck".localized
            , for: .normal)
        self.type2Btn.setTitle("Passenger Car".localized
            , for: .normal)

        self.type1Btn.titleLabel?.font = UIFont(name: "Cairo-SemiBold", size: 14)
        self.type2Btn.titleLabel?.font = UIFont(name: "Cairo-SemiBold", size: 14)


        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        
        self.navigationController?.navigationBar.tintColor = primaryColor

        
        for oneView in roundViews{
            oneView.layer.cornerRadius = 7.5
        }
              
        self.modelYearLbl.text = "Manufacture Year".localized
        self.modelYearLbl.font = UIFont(name: "Cairo-Regular", size: 12 )!
        
        self.getPickerData()
        // Do any additional setup after loading the view.
    }
    
    func getPickerData(){
        
        self.modelTireTf.text = self.yearsArr[0]
        
        self.tiresVM.getRimSize( apiParameters: [:], onSuccess: { (isSuccess) in
            //
            if isSuccess{
                self.rimSizePickerView.reloadAllComponents()
                self.widthTf.text = self.tiresVM.rimSizes[0].size ?? ""
                self.selectedRimSize = 0
            }
            
        }) { (errMsg) in
            //
        }
        
        self.tiresVM.getTireSize( apiParameters: [:], onSuccess: { (isSuccess) in
            //
            if isSuccess{
                self.tireSizePickerView.reloadAllComponents()
                self.heightTf.text = self.tiresVM.tireSizes[0].size ?? ""
                self.selectedTireSize = 0
            }
            
        }) { (errMsg) in
            //
        }

        
        self.tiresVM.getRachoSize( apiParameters: [:], onSuccess: { (isSuccess) in
            //
            if isSuccess{
                self.rachoSizePickerView.reloadAllComponents()
                self.radiusTf.text = self.tiresVM.rachoSizes[0].size ?? ""
                self.selectedRachoSize = 0

            }
            
        }) { (errMsg) in
            //
        }
        
        
    }
    
    var type = 1
    @IBAction func typesBtnClicked(_ sender: UIButton) {
        let dimmedColor = UIColor(displayP3Red: 122/255, green: 122/255, blue: 122/255, alpha: 1.0)
        
        if sender.tag == 11{
            //Na2l
            self.type = 0
            self.type1Btn.setTitleColor(primaryColor, for: .normal)
            self.type2Btn.setTitleColor(dimmedColor, for: .normal)
        }else{
            //Malaky
            self.type = 1
            self.type1Btn.setTitleColor(dimmedColor, for: .normal)
            self.type2Btn.setTitleColor(primaryColor, for: .normal)
        }
    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == yearPickerView{
            return self.yearsArr.count
        }else if pickerView == rimSizePickerView{
            return self.tiresVM.rimSizes.count
        }else if pickerView == rachoSizePickerView{
            return self.tiresVM.rachoSizes.count
        }else if pickerView == tireSizePickerView{
            return self.tiresVM.tireSizes.count
        }else{
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == yearPickerView{
            return self.yearsArr[row]
        }else if pickerView == rimSizePickerView{
            return self.tiresVM.rimSizes[row].size ?? ""
        }else if pickerView == rachoSizePickerView{
            return self.tiresVM.rachoSizes[row].size ?? ""
        }else if pickerView == tireSizePickerView{
            return self.tiresVM.tireSizes[row].size ?? ""
        }else{
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == yearPickerView{
            self.modelTireTf.text = self.yearsArr[row]
        }else if  pickerView == rimSizePickerView{
            self.selectedRimSize = row
            self.widthTf.text = self.tiresVM.rimSizes[row].size ?? ""
        }else if pickerView == rachoSizePickerView{
            self.selectedRachoSize = row
            self.radiusTf.text = self.tiresVM.rachoSizes[row].size ?? ""
        }else if pickerView == tireSizePickerView{
            self.selectedTireSize = row
            self.heightTf.text = self.tiresVM.tireSizes[row].size ?? ""
        }
    }
    
    var selectedTireSize = -1
    
    var selectedRimSize = -1
    
    var selectedRachoSize = -1
 
    var tyresUrlToBeCalled = ""
    
    @IBAction func searchBtnClicked(_ sender: Any) {
        
        let isLogged = UserDefaults.standard.bool(forKey: "isLogged")
        
        if isLogged{
            self.tyresUrlToBeCalled = baseUrl + filterTyresUrl + "?tyre_size=\(self.tiresVM.tireSizes[selectedTireSize].id ?? -1)&rim_size=\(self.tiresVM.rimSizes[selectedRimSize].id ?? -1)&racho_size=\(self.tiresVM.rachoSizes[selectedRachoSize].id ?? -1)&year=\(self.modelTireTf.text!)&types=1"
            
            self.performSegue(withIdentifier: "gotoTireProduct", sender: self)

        }else{
            self.performSegue(withIdentifier: "gotoLoginVC", sender: self)
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoTireProduct"{
            let destCont = segue.destination as! productListViewController
            destCont.vcTitle = "Tires".localized
            destCont.pathToCall = self.tyresUrlToBeCalled
        }else if segue.identifier == "gotoLoginVC"{
            let destCont = segue.destination as! loginViewController
            destCont.isDismissLoginVC = true
        }
    }
    
//
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
