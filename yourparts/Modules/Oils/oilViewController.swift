//
//  oilViewController.swift
//  yourparts
//
//  Created by iMac1 on 7/28/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class oilViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var vcLabel: UILabel!
    @IBOutlet weak var oilTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.oilTableView.delegate = self
        self.oilTableView.dataSource = self
        
        self.vcLabel.font = UIFont(name: "TheMixArab-Bold", size: 16)
        
        //registering cells
        let nib = UINib(nibName: String(describing: oilTableViewCell.self), bundle: nil)
        self.oilTableView.register(nib, forCellReuseIdentifier: "oilLevel1Cell")
        
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "oilLevel1Cell") as! oilTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "gotoDetailOil", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95.0
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
