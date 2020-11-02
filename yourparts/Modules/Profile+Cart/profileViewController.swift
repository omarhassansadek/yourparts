//
//  profileViewController.swift
//  yourparts
//
//  Created by iMac1 on 6/24/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import MOLH

class profileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var profileVM: profileViewModel!
    @IBOutlet weak var profileTableView: UITableView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.getProfileData()
        self.navigationController?.navigationBar.isHidden = true
        self.profileTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for family: String in UIFont.familyNames
        {
            print(family)
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
        
        //set tableview delegate and datasource
        self.profileTableView.delegate = self
        self.profileTableView.dataSource = self

        //registering cells
        let nib = UINib(nibName: String(describing: profileHeaderTableViewCell.self), bundle: nil)
        self.profileTableView.register(nib, forCellReuseIdentifier: "profileHeader")
        
        let nib2 = UINib(nibName: String(describing: profileMenuTableViewCell.self), bundle: nil)
        self.profileTableView.register(nib2, forCellReuseIdentifier: "profileOption")

        
        //populate Array
        self.profileVM.populateArr()
        
        let logo = UIImage(named: "navLogo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView

        // Do any additional setup after loading the view.
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + self.profileVM.profileListArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            if (indexPath.row == 0){
                let cell = tableView.dequeueReusableCell(withIdentifier: "profileHeader") as! profileHeaderTableViewCell

                if let userEmail = UserDefaults.standard.string(forKey: "useremail"){
                    cell.userEmail.text = userEmail
                }

                if let userName = UserDefaults.standard.string(forKey: "username"){
                    cell.userName.text = userName
                }
                
                cell.favNumberLbl.text = String(self.profileVM.cartCount)
                
                cell.goSettings = {
                    self.performSegue(withIdentifier: "gotoSettings", sender: self)
                }
                
                cell.cartBtnClicked = {
                    self.tabBarController?.selectedIndex = 2
                }
                return cell
                
            }else{
                let menucell = tableView.dequeueReusableCell(withIdentifier: "profileOption") as! profileMenuTableViewCell
                menucell.optionico.image = UIImage(named: self.profileVM.profileListArr[indexPath.row - 1].image ?? "")
                menucell.optionName.text = self.profileVM.profileListArr[indexPath.row - 1].mainTitle ?? ""
            
                return menucell

            }
                
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 285.0
        }else{
            return 60.0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
            case 2:
                //gotoCarsMyVC
                self.performSegue(withIdentifier: "gotoMyCarsVC", sender: self)
                
            case 1:
                //gotoProfileinfo
                self.performSegue(withIdentifier: "gotoProfileinfo", sender: self)
            
           // case 0:
                //gotoChangePassword

//        case 3:
//            // self.performSegue(withIdentifier: "gotoFavAddresses", sender: self)
//            
            case 3:
               self.performSegue(withIdentifier: "gotoPaymentView", sender: self)
//            
//        case 4:
//           // self.performSegue(withIdentifier: "gotoFavorites", sender: self)
            
            //gotoPaymentView
//            
        default:
            break
        }
      
    }
    
    func getProfileData(){
        let isLogged = UserDefaults.standard.bool(forKey: "isLogged")
        
        if isLogged{
            self.profileVM.getUserProfile(onSuccess: { (isSuccess) in
                if isSuccess{
                    self.profileTableView.reloadData()
                }
            }) { (errMsg) in
                //
            }
        }else{
            //
            self.performSegue(withIdentifier: "gotoLogoutVC", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoPaymentView"{
            let destVC = segue.destination as! addressPaymentViewController
            destVC.isComingFromProfile = true
        }else if segue.identifier == "gotoLogoutVC"{
            let destVC = segue.destination as! loginViewController
            destVC.isDismissLoginVC = false
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
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
