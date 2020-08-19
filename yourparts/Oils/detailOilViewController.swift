//
//  detailOilViewController.swift
//  yourparts
//
//  Created by iMac1 on 7/28/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class detailOilViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var detailOilTableView: UITableView!
    @IBOutlet weak var vcTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailOilTableView.delegate = self
        self.detailOilTableView.dataSource = self
        
        self.vcTitle.font = UIFont(name: "TheMixArab-Bold", size: 16)
        
        //registering cells
        let nib = UINib(nibName: String(describing: detailOilTableViewCell.self), bundle: nil)
        self.detailOilTableView.register(nib, forCellReuseIdentifier: "detailOilCell")
        
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailOilCell") as! detailOilTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "gotoProductDetails", sender: self)
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
