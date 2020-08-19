//
//  tiresViewController.swift
//  yourparts
//
//  Created by iMac1 on 7/28/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class tiresViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var tableArr = ["1" , "3" , "3" , "3" , "3" , "3" , "3"]
    
    @IBOutlet weak var vcTitle: UILabel!
    @IBOutlet weak var tiresTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tiresTableView.delegate = self
        self.tiresTableView.dataSource = self
//
        self.vcTitle.font = UIFont(name: "TheMixArab-Bold", size: 16)
        self.vcTitle.text = "Tires".localized
        //registering cells
        let nib = UINib(nibName: String(describing: searchtiresTableViewCell.self), bundle: nil)
        self.tiresTableView.register(nib, forCellReuseIdentifier: "searchTireCell")
        
        let nib2 = UINib(nibName: String(describing: searchDetailsTireTableViewCell.self), bundle: nil)
        self.tiresTableView.register(nib2, forCellReuseIdentifier: "searchDetailCell")
        
        let nib3 = UINib(nibName: String(describing: detailOilTableViewCell.self), bundle: nil)
        self.tiresTableView.register(nib3, forCellReuseIdentifier: "detailOilCell")
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "searchDetailCell") as! searchDetailsTireTableViewCell
            return cell
            
        case "3":
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailOilCell") as! detailOilTableViewCell
            cell.cellImage.image = UIImage(named: "goodTire")
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
            self.performSegue(withIdentifier: "gotoTireProduct", sender: self)
        }
        
        self.tiresTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch tableArr[indexPath.row] {
        case "1":
            return 60.0
            
        case "2":
            return 438.0
            
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
