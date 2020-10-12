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
            
            if self.myCarsVM.myCars[indexPath.row].isChecked == true{
                cell.carCheckbox.on = true
            }else{
                cell.carCheckbox.on = false
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row != self.myCarsVM.myCars.count{

            self.myCarsVM.myCars[indexPath.row].isChecked = true
            for (index, oneCar) in self.myCarsVM.myCars.enumerated(){
                //if oneCar.isChecked
                if index != indexPath.row{
                    oneCar.isChecked = false
                }
            }
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
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {

            self.myCarsVM.deleteMyVehicle(id: self.myCarsVM.myCars[indexPath.row].id ?? -1, onSuccess: { (isSuccess) in
                //
                if isSuccess{
                  self.myCarsVM.myCars.remove(at: indexPath.row)
                  self.fetchCars()
                    
                }

            }) { (errMsg) in
                //
                AlertViewer().showAlertView(withMessage: errMsg, onController: self)
            }
        }
    }

    func fetchCars(){
        
        self.actind.startAnimating()
        self.myCarsVM.getMyVehicles(onSuccess: { (isSuccess) in
            //
            if self.myCarsVM.myCars.count != 0{
                self.carsTableView.isHidden = false
                self.myCarsPlaceholder.isHidden = true
                self.addCarBtnView.isHidden = true
            }else{
                self.carsTableView.isHidden = true
                self.myCarsPlaceholder.isHidden = false
                self.addCarBtnView.isHidden = false

            }
            self.carsTableView.reloadData()
            self.actind.stopAnimating()

        }) { (errMsg) in
            //
            self.actind.stopAnimating()

            AlertViewer().showAlertView(withMessage: errMsg, onController: self)
        }
    }
    
    @IBAction func addCarBtnClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "gotoAddCarVC", sender: self)
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
