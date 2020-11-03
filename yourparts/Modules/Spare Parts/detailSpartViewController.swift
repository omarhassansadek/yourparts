//
//  detailSpartViewController.swift
//  yourparts
//
//  Created by iMac1 on 8/16/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class detailSpartViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    //MARK:- Outlets
    @IBOutlet weak var detailSpartTableView: UITableView!
    
    //MARK:- Variables
    var spartName: String?
    
    //MARK:- Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        
        self.navigationController?.navigationBar.tintColor = primaryColor
        
        let nib = UINib(nibName: String(describing: headerTableViewCell.self), bundle: nil)
        self.detailSpartTableView.register(nib, forCellReuseIdentifier: "headerCell")
        
        self.detailSpartTableView.dataSource = self
        self.detailSpartTableView.delegate = self
        
    }
    
    //MARK:- TableView Delegates
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! headerTableViewCell
        cell.cellTitle.text = spartName ?? "العفشة"
        cell.cellTitle.textColor = UIColor.white
        cell.spartsBg.isHidden = false
        cell.searchTf.layer.opacity = 1.0
        
        return cell
        
    }
    
}
