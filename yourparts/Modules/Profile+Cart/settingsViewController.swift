//
//  settingsViewController.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/23/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class settingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var settingOptions: [String] = []
    
    @IBOutlet weak var settingsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.settingOptions.append("Change Password".localized)
        self.settingOptions.append("Privacy Policy".localized)
        self.settingOptions.append("About Application".localized)
        self.settingOptions.append("Logout".localized)

        //spaceCell
        //registering cells
        let nib = UINib(nibName: String(describing: settingTableViewCell.self), bundle: nil)
        self.settingsTableView.register(nib, forCellReuseIdentifier: "settingCell")

        let nib2 = UINib(nibName: String(describing: spaceTableViewCell.self), bundle: nil)
        self.settingsTableView.register(nib2, forCellReuseIdentifier: "spaceCell")


        //set tableview delegate and datasource
        self.settingsTableView.delegate = self
        self.settingsTableView.dataSource = self

        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
        self.navigationController?.navigationBar.tintColor = primaryColor

        self.navigationController?.navigationBar.shadowImage = UIImage()

        self.navigationController?.navigationBar.barTintColor = anotherGreyColor

        self.title = "Settings".localized
        
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.black,
             NSAttributedString.Key.font: UIFont(name: "Cairo-Bold", size: 18)!]


        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
      
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingOptions.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.row ==  self.settingOptions.count - 1) {
            let spaceCell = tableView.dequeueReusableCell(withIdentifier: "spaceCell") as! spaceTableViewCell
            return spaceCell
            
        }else{
            let menucell = tableView.dequeueReusableCell(withIdentifier: "settingCell") as! settingTableViewCell
            if indexPath.row == self.settingOptions.count{
                menucell.optionName.textColor = primaryColor
            }else{
                menucell.optionName.textColor = UIColor.black
            }
            
            if indexPath.row == 4{
                menucell.optionName.text = self.settingOptions[indexPath.row - 1]

            }else{
                menucell.optionName.text = self.settingOptions[indexPath.row]

            }
            return menucell

        }
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row ==  self.settingOptions.count - 1) {
            return 44.0
        }else{
            return  59.0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == settingOptions.count{
            var alertCont = UIAlertController(title: "Yourparts", message: "Are you sure you want to logout?".localized, preferredStyle: .alert)
            
            alertCont.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { _ in
                alertCont.dismiss(animated: true, completion: nil)
            }))
            
            alertCont.addAction(UIAlertAction(title: "Continue", style: .default, handler: { _ in
                //go to login
                self.performSegue(withIdentifier: "gotoAuthModule", sender: self)
            }))

            
            self.present(alertCont, animated: true, completion: nil)
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
