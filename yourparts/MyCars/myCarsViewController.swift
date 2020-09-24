//
//  myCarsViewController.swift
//  yourparts
//
//  Created by iMac1 on 6/28/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class myCarsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var carsTableView: UITableView!
    @IBOutlet weak var noCarsLbl: UILabel!
    
    @IBOutlet weak var addCarLbl: UILabel!
    @IBOutlet weak var addCarBtn: UIButton!
    
    @IBOutlet weak var myCarsVM: myCarsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.fetchCars()

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
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddAddressCell") as! addAddressTableViewCell
            
            cell.addAddressBtn.setTitle("Add new car".localized, for: .normal)

            cell.addAddress = {
                self.performSegue(withIdentifier: "gotoAddCarVC", sender: self)
               // AlertViewer().showAlertView(withMessage: "This feauture isn't available right now", onController: self)
            }
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCarCell") as! myCarTableViewCell
            //cell.carNameLbl!.text = self.myCarsVM?.myCars[indexPath.row].model?.maker?.name ?? "" + " " + (self.myCarsVM.myCars[indexPath.row].model?.name)! ?? ""
            return cell
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
    

    func fetchCars(){
        self.myCarsVM.getMyVehicles(onSuccess: { (isSuccess) in
            //
            self.carsTableView.reloadData()
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
