//
//  myCarsViewController.swift
//  yourparts
//
//  Created by iMac1 on 6/28/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class myCarsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var carsTableView: UITableView!
    
    @IBOutlet weak var myCarsVM: myCarsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchCars()

        //setting the back button style and navigation controller
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        self.navigationController?.navigationBar.tintColor = primaryColor
        
        
        self.mainTitle.font = UIFont(name: "TheMixArab-Bold", size: 17)
        self.detailTitle.font = UIFont(name: "TheMixArab", size: 13)

        
        //registering cells
        let nib = UINib(nibName: String(describing: addTableViewCell.self), bundle: nil)
        self.carsTableView.register(nib, forCellReuseIdentifier: "addBtnCell")
        
        let nib2 = UINib(nibName: String(describing: carTableViewCell.self), bundle: nil)
        self.carsTableView.register(nib2, forCellReuseIdentifier: "carCell")
        
        self.carsTableView.delegate = self
        self.carsTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myCarsVM.myCars.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "addBtnCell") as! addTableViewCell
            cell.addAddress = {
                self.performSegue(withIdentifier: "gotoAddCarVC", sender: self)
               // AlertViewer().showAlertView(withMessage: "This feauture isn't available right now", onController: self)
            }
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "carCell") as! carTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2{
            //last cell
            return 75.0
        }else{
            return 250.0
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
