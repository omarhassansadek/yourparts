//
//  myCarsViewController.swift
//  yourparts
//
//  Created by iMac1 on 6/28/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
import BEMCheckBox

class myCarsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var addCarBtnView: UIView!
    
    @IBOutlet weak var myCarsPlaceholder: UIView!
    
    @IBOutlet weak var actind: NVActivityIndicatorView!
    
    @IBOutlet weak var carsTableView: UITableView!
    @IBOutlet weak var noCarsLbl: UILabel!
    
    @IBOutlet weak var addCarLbl: UILabel!
    @IBOutlet weak var addCarBtn: UIButton!
    
    @IBOutlet weak var myCarsVM: myCarsViewModel!
    
    override func viewWillAppear(_ animated: Bool) {
        self.fetchCars()
        self.navigationController?.navigationBar.isHidden = false

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        //setting the back button style and navigation controller
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        self.navigationController?.navigationBar.tintColor = primaryColor
        
        
        self.noCarsLbl.font = UIFont(name: "Cairo-Bold", size: 18)
        self.noCarsLbl.text = "There is no added cars".localized

        self.addCarLbl.font = UIFont(name: "Cairo-Regular", size: 13)
        self.addCarLbl.text = "Add car to browse its spare parts".localized

        //registering cells
        let nib = UINib(nibName: String(describing: addAddressTableViewCell.self), bundle: nil)
        self.carsTableView.register(nib, forCellReuseIdentifier: "AddAddressCell")

        let nib2 = UINib(nibName: String(describing: myCarTableViewCell.self), bundle: nil)
        self.carsTableView.register(nib2, forCellReuseIdentifier: "myCarCell")
        
        self.addCarBtn.layer.cornerRadius = 15.0
        self.addCarBtn.setTitle("Add Car".localized, for: .normal)
        self.addCarBtn.titleLabel?.font = UIFont(name: "Cairo-Bold", size: 16)

        
        self.carsTableView.delegate = self
        self.carsTableView.dataSource = self
        // Do any additional setup after loading the view.
        
        

        self.navigationController?.navigationBar.shadowImage = UIImage()

        self.navigationController?.navigationBar.barTintColor = anotherGreyColor

        self.title = "My Cars".localized
               
        self.navigationController?.navigationBar.titleTextAttributes =
                   [NSAttributedString.Key.foregroundColor: UIColor.black,
                    NSAttributedString.Key.font: UIFont(name: "Cairo-Bold", size: 18)!]

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + self.myCarsVM.myCars.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == self.myCarsVM.myCars.count{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddAddressCell") as! addAddressTableViewCell
            
            //cell.editingStyle = cell.editingStyle.rawValue
            
            cell.addAddressBtn.setTitle("Add new car".localized, for: .normal)

            cell.addAddress = {
                self.performSegue(withIdentifier: "gotoAddCarVC", sender: self)
               // AlertViewer().showAlertView(withMessage: "This feauture isn't available right now", onController: self)
            }
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCarCell") as! myCarTableViewCell
            cell.carNameLbl!.text = self.myCarsVM.myCars[indexPath.row].vehicle_name ?? ""
            cell.carYearModel.text = self.myCarsVM.myCars[indexPath.row].model_name ?? ""
            cell.carYear.text = String( self.myCarsVM.myCars[indexPath.row].year ?? Int() ) ?? ""
            
            cell.carImage.sd_setImage(with: URL(string: self.myCarsVM.myCars[indexPath.row].image ?? "") , placeholderImage: nil, completed: { (image, error, cacheType, url) -> Void in
                if ((error) != nil) {
                    // set the placeholder image here
                    cell.carImage.image = UIImage(named: "carico")
                } else {
                    // success ... use the image
                }
            })

            
            if let vehicle_id = UserDefaults.standard.string(forKey: "vehicle"){
                //addCarCell.addCarLbl.text = vehicle_name
                if self.myCarsVM.myCars[indexPath.row].vehicle == Int(vehicle_id) {
                    cell.carCheckbox.on = true
                    self.myCarsVM.myCars[indexPath.row].isChecked = true
                }else{
                    cell.carCheckbox.on = false

                }
            }else{
                cell.carCheckbox.on = false

            }
            return cell

            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != self.myCarsVM.myCars.count{

            self.myCarsVM.myCars[indexPath.row].isChecked = true
            
            UserDefaults.standard.set(true, forKey: "carChecked")
            
            if let vehicle_id = self.myCarsVM.myCars[indexPath.row].id{
                UserDefaults.standard.set(vehicle_id, forKey: "vehicle_id")
            }

            if let vehicle_name = self.myCarsVM.myCars[indexPath.row].vehicle_name{
                UserDefaults.standard.set(vehicle_name, forKey: "vehicle_name")
            }
            
            if let model_name = self.myCarsVM.myCars[indexPath.row].model_name{
                UserDefaults.standard.set(model_name, forKey: "model_name")
            }

            if let year = self.myCarsVM.myCars[indexPath.row].year{
                UserDefaults.standard.set(year, forKey: "year")
            }

            if let vehicle = self.myCarsVM.myCars[indexPath.row].vehicle{
                UserDefaults.standard.set(vehicle, forKey: "vehicle")
            }

            if let image = self.myCarsVM.myCars[indexPath.row].image{
                UserDefaults.standard.set(image, forKey: "image")
            }else{
                UserDefaults.standard.set("", forKey: "image")
            }

//            for (index, oneCar) in self.myCarsVM.myCars.enumerated(){
//                //if oneCar.isChecked
//                if index != indexPath.row{
//                    oneCar.isChecked = false
//                }
//            }
            self.carsTableView.reloadData()
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2{
            //last cell
            return 135.0
        }else{
            return 110.0
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.row == self.myCarsVM.myCars.count{
            return false
        }else{
            return true
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.row != self.myCarsVM.myCars.count{
            if (editingStyle == .delete)   {
                
              
                    self.myCarsVM.deleteMyVehicle(id: self.myCarsVM.myCars[indexPath.row].id ?? -1, onSuccess: { (isSuccess) in
                        //
                        if isSuccess{
                            if self.myCarsVM.myCars[indexPath.row].isChecked == true{
                                UserDefaults.standard.set(false, forKey: "carChecked")
                                UserDefaults.standard.removeObject(forKey: "vehicle")
                                //vehicle
                                self.myCarsVM.myCars.remove(at: indexPath.row)

                            }
                            self.fetchCars()
                            
                        }
                        
                    }) { (errMsg) in
                        //
                        AlertViewer().showAlertView(withMessage: errMsg, onController: self)
                    }
                    
                
            }
        }

    }
    
    
    var firstLoad = false


    func fetchCars(){
        
        if !self.firstLoad {
            
            self.actind.startAnimating()
        }

        
        self.myCarsVM.getMyVehicles(onSuccess: { (isSuccess) in
            //
            if self.myCarsVM.myCars.count != 0{
                //cars loaded not empty
                self.carsTableView.isHidden = false
                self.myCarsPlaceholder.isHidden = true
                self.addCarBtnView.isHidden = true
                self.firstLoad = true

            }else{
                //remove from
                self.carsTableView.isHidden = true
                self.myCarsPlaceholder.isHidden = false
                self.addCarBtnView.isHidden = false
                UserDefaults.standard.set(false, forKey: "carChecked")
                UserDefaults.standard.removeObject(forKey: "vehicle")
                //vehicle
                self.firstLoad = true

            }
            self.carsTableView.reloadData()
            self.actind.stopAnimating()

        }) { (errMsg) in
            
            //
            self.actind.stopAnimating()
            
            //UserDefaults.standard.set(false, forKey: "carChecked")

            let isLogged = UserDefaults.standard.bool(forKey: "isLogged")
            
            if isLogged{
                AlertViewer().showAlertView(withMessage: errMsg, onController: self)

                //self.performSegue(withIdentifier: "gotoHomeScreen", sender: self)
            }else{
                self.carsTableView.isHidden = true
                self.myCarsPlaceholder.isHidden = false
                self.addCarBtnView.isHidden = false
                UserDefaults.standard.set(false, forKey: "carChecked")
                UserDefaults.standard.removeObject(forKey: "vehicle")
                //vehicle
                self.firstLoad = true

                //self.performSegue(withIdentifier: "gotoLogin", sender: self)
            }
        }
    }
    
    @IBAction func addCarBtnClicked(_ sender: Any) {
        
        let isLogged = UserDefaults.standard.bool(forKey: "isLogged")

        if isLogged{
            self.performSegue(withIdentifier: "gotoAddCarVC", sender: self)
        }else{

            self.performSegue(withIdentifier: "gotoLoginVC", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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
