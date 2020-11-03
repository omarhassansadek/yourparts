
//
//  sparePartsViewController.swift
//  yourparts
//
//  Created by iMac1 on 8/13/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class sparePartsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK:- Outlets
    @IBOutlet weak var spartsCollectionView: UICollectionView!
    @IBOutlet weak var headerTableView: UITableView!
    
    //MARK:- Variables
    var sparts = ["العفشة" , "الفرامل" , "الموتور" , "الفتيس"]
    var spartName: String = ""
    
    //MARK:- Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        
        self.navigationController?.navigationBar.tintColor = primaryColor
        
        let nib = UINib(nibName: String(describing: headerTableViewCell.self), bundle: nil)
        self.headerTableView.register(nib, forCellReuseIdentifier: "headerCell")
        
        let nib2 = UINib(nibName: String(describing: SparePartCategoryTableViewCell.self), bundle: nil)
        self.headerTableView.register(nib2, forCellReuseIdentifier: "spartCartegoryCollection")
        
        self.headerTableView.delegate = self
        self.headerTableView.dataSource = self
        
    }
    
    //MARK:- TableView Delegates
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! headerTableViewCell
            cell.cellTitle.textColor = UIColor.black
            cell.spartsBg.isHidden = true
            cell.searchTf.layer.opacity = 1.0
            
            return cell
            
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "spartCartegoryCollection") as! SparePartCategoryTableViewCell
            
            let cellDelegate = spartsCollectionDelegate()
            cellDelegate.row = indexPath.row
            cell.row = indexPath.row
            cell.collectionTitle.text = sparts[indexPath.row - 1]
            cell.setCollectionViewDataSourceDelegate(cellDelegate, forRow: indexPath.row)
            cell.selectionStyle = .none
            
            return cell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 100.0
            
        }else{
            return 350.0
            
        }
    }
    
    //MARK:- Helper Methods
    func gotoDetailspart(){
        self.performSegue(withIdentifier: "gotoDetailSpart", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoDetailSpart"{
            let destVC = segue.destination as! detailSpartViewController
            destVC.spartName = self.spartName
        }
    }
    
}
