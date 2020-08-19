//
//  detailItemsViewController.swift
//  yourparts
//
//  Created by iMac1 on 7/28/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class detailItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var detailVCTitle: UILabel!
    @IBOutlet weak var detailItemsTableView: UITableView!
    
    var tableArr = ["1" , "3" , "3" , "3" , "3" , "3" , "3"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.detailItemsTableView.delegate = self
        self.detailItemsTableView.dataSource = self
        //
        self.detailVCTitle.font = UIFont(name: "TheMixArab-Bold", size: 16)
        self.detailVCTitle.text = "Accessories".localized
        //registering cells
        let nib = UINib(nibName: String(describing: searchtiresTableViewCell.self), bundle: nil)
        self.detailItemsTableView.register(nib, forCellReuseIdentifier: "searchTireCell")
        
        let nib2 = UINib(nibName: String(describing: filterItemsTableViewCell.self), bundle: nil)
        self.detailItemsTableView.register(nib2, forCellReuseIdentifier: "itemFilterCell")
        
        let nib3 = UINib(nibName: String(describing: detailOilTableViewCell.self), bundle: nil)
        self.detailItemsTableView.register(nib3, forCellReuseIdentifier: "detailOilCell")

        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        self.navigationController?.navigationBar.tintColor = primaryColor

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch tableArr[indexPath.row] {
        case "1":
            let cell = tableView.dequeueReusableCell(withIdentifier: "searchTireCell") as! searchtiresTableViewCell
            return cell
            
        case "2":
            let cell = tableView.dequeueReusableCell(withIdentifier: "itemFilterCell") as! filterItemsTableViewCell
            return cell
            
        case "3":
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailOilCell") as! detailOilTableViewCell
            cell.cellImage.contentMode = .center
            cell.cellImage.image = UIImage(named: "accico")
            return cell
            
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //self.performSegue(withIdentifier: "gotoDetailOil", sender: self)
        
        if self.tableArr[indexPath.row] == "1"{
            self.tableArr[indexPath.row] = "2"
        }else if self.tableArr[indexPath.row] == "2"{
            self.tableArr[indexPath.row] = "1"
        }else{
            self.performSegue(withIdentifier: "gotoPartProduct", sender: self)
        }
        

       
        
        self.detailItemsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch tableArr[indexPath.row] {
        case "1":
            return 60.0
            
        case "2":
            return 515.0
            
        case "3":
            return 110.0
            
        default:
            return 0.0
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
