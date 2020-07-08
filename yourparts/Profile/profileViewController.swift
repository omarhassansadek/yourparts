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
        let nib = UINib(nibName: String(describing: profileInfoTableViewCell.self), bundle: nil)
        self.profileTableView.register(nib, forCellReuseIdentifier: "profileInfoCell")
        

        
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
        return 7
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "profileInfoCell") as! profileInfoTableViewCell
        
        
   
        
            if (indexPath.row == 0){

                cell.profileName.text = "Yourparts".localized
                
                cell.cellThumb.backgroundColor = UIColor.darkGray
                
                cell.profileDate.textColor = UIColor.darkGray

                cell.profileName.font = UIFont(name: "TheMixArab-Bold", size: 17)
                
                cell.profileDate.font = UIFont(name: "TheMixArab", size: 13)

                
                cell.separator.isHidden = true
            
            }else{
            
                cell.profileName.text = self.profileVM.profileListArr[indexPath.row - 1].mainTitle?.localized
                
                cell.profileDate.textColor = UIColor(displayP3Red: 0/255, green: 151/255, blue: 255/55, alpha: 1.0)
                
                cell.profileDate.text = self.profileVM.profileListArr[indexPath.row - 1].secondaryTitle?.localized
                
                cell.cellThumb.image = UIImage(named: self.profileVM.profileListArr[indexPath.row - 1].image ?? "")
                
                cell.cellThumb.backgroundColor = UIColor.clear
                
                cell.separator.isHidden = false
            }
        
            return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 85.0
        }else{
            return 60.0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 3:
            self.performSegue(withIdentifier: "gotoFavAddresses", sender: self)
            
        case 1:
            //gotoProfileinfo
            self.performSegue(withIdentifier: "gotoProfileinfo", sender: self)
            
        case 2:
            //gotoProfileinfo
            self.performSegue(withIdentifier: "gotoMyCarsVC", sender: self)
        default:
            break
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
