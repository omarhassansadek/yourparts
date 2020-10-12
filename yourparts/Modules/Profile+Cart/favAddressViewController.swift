//
//  favAddressViewController.swift
//  yourparts
//
//  Created by iMac1 on 6/27/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class favAddressViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var favAddresVM: favAddressViewModel!
    
    @IBOutlet weak var vcTitleLbl: UILabel!
    @IBOutlet weak var addressTableView: UITableView!
    @IBOutlet weak var vcDetailLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addressTableView.dataSource = self
        self.addressTableView.delegate = self
        
        //registering cells
        let nib = UINib(nibName: String(describing: addTableViewCell.self), bundle: nil)
        self.addressTableView.register(nib, forCellReuseIdentifier: "addBtnCell")
        
//        let nib2 = UINib(nibName: String(describing: addressTableViewCell.self), bundle: nil)
//        self.addressTableView.register(nib2, forCellReuseIdentifier: "addressCell")
//
        self.configure()
        // Do any additional setup after loading the view.
    }

    
    func configure(){
        //setting the back button style and navigation controller
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        self.navigationController?.navigationBar.tintColor = primaryColor
    

        
        self.vcTitleLbl.text = "Favourite Addresses".localized
        self.vcDetailLbl.text = "You have x added addresses".localized
        self.vcTitleLbl.font = UIFont(name: "TheMixArab-Bold", size: 17)
        self.vcDetailLbl.font = UIFont(name: "TheMixArab", size: 13)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.favAddresVM.addressArr.count + 1
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.row == self.favAddresVM.addressArr.count{
            let cell = tableView.dequeueReusableCell(withIdentifier: "addBtnCell") as! addTableViewCell
            cell.addAddress = {
                self.favAddresVM.addressArr.append("s")
                self.addressTableView.reloadData()
            }
            return cell
//        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == self.favAddresVM.addressArr.count{
            //last cell
            return 75.0
        }else{
            return 140.0
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
