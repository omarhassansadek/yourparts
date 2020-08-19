//
//  detailSpartViewController.swift
//  yourparts
//
//  Created by iMac1 on 8/16/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class detailSpartViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var detailSpartTableView: UITableView!
    var spartName: String?
    
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
        // Do any additional setup after loading the view.
    }

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
