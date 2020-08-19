//
//  menuViewController.swift
//  yourparts
//
//  Created by iMac1 on 6/25/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import MOLH

class menuViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{


    
    @IBOutlet weak var meneuTableView: UITableView!
    @IBOutlet var menuVM: menuViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.meneuTableView.dataSource = self
        self.meneuTableView.delegate = self

        //adding logo to navbar
        let logo = UIImage(named: "navLogo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        //registering cells
        let nib = UINib(nibName: String(describing: menuTitleTableViewCell.self), bundle: nil)
        self.meneuTableView.register(nib, forCellReuseIdentifier: "titleCell")
        
        let nib2 = UINib(nibName: String(describing: profileInfoTableViewCell.self), bundle: nil)
        self.meneuTableView.register(nib2, forCellReuseIdentifier: "profileInfoCell")
        
        let nib3 = UINib(nibName: String(describing: plainTableViewCell.self), bundle: nil)
        self.meneuTableView.register(nib3, forCellReuseIdentifier: "plainCell")
        
     
        self.menuVM.populateArrMenu { (isSuccess) in
            if isSuccess{
                self.meneuTableView.reloadData()
            }
        }
       
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 24
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0,6,9,11:
            let titleCell = tableView.dequeueReusableCell(withIdentifier: "titleCell") as! menuTitleTableViewCell
            if indexPath.row == 0 {
                titleCell.contentView.backgroundColor = UIColor.white
                titleCell.titleCell.textColor = UIColor.black

            }else{
                titleCell.titleCell.textColor = UIColor.white
                titleCell.contentView.backgroundColor = primaryColor

            }
            titleCell.imgThumb.image = UIImage(named: self.menuVM.menuListArr[indexPath.row].image ?? "")
            titleCell.titleCell.text = self.menuVM.menuListArr[indexPath.row].mainTitle
            return titleCell
            
        case 1,2,3,4,5,7,8,10:
            let cell = tableView.dequeueReusableCell(withIdentifier: "profileInfoCell") as! profileInfoTableViewCell
            
            cell.profileName.text = self.menuVM.menuListArr[indexPath.row].mainTitle
            
            cell.profileDate.textColor = UIColor(displayP3Red: 0/255, green: 151/255, blue: 255/55, alpha: 1.0)
            
            cell.profileDate.text = self.menuVM.menuListArr[indexPath.row].secondaryTitle
            
            cell.cellThumb.image = UIImage(named: self.menuVM.menuListArr[indexPath.row].image ?? "")
            
            cell.cellThumb.backgroundColor = UIColor.clear
            
            cell.separator.isHidden = false
            
            return cell
            
//        case 12:
//            let plaincell = tableView.dequeueReusableCell(withIdentifier: "plainCell") as! plainTableViewCell
            
            
            //plaincell.textLabel?.text = self.menuVM.menuListArr[indexPath.row].mainTitle

        
//            return plaincell
            
        case 12,13,14,15,16,17,18,19,20,21,22,23:
            let plaincell = tableView.dequeueReusableCell(withIdentifier: "plainCell") as! plainTableViewCell

            plaincell.cellLbl.text = self.menuVM.menuListArr[indexPath.row].mainTitle
            plaincell.cellLbl.textColor = UIColor.black
            plaincell.cellSeparator.backgroundColor = UIColor.lightGray
            plaincell.contentView.backgroundColor = UIColor.white

            if indexPath.row == 12{
                plaincell.cellSeparator.isHidden = true

            }else{
                plaincell.cellSeparator.isHidden = false

            }
            if indexPath.row == 18 || indexPath.row == 19 || indexPath.row == 20 || indexPath.row == 21 || indexPath.row == 22 || indexPath.row == 23{
                plaincell.cellLbl.textColor = UIColor.white
                plaincell.cellSeparator.backgroundColor = UIColor.white
                plaincell.contentView.backgroundColor = primaryColor


            }
            
            
            return plaincell
            
            
  
            
        default:
            return UITableViewCell()

      
        
            
            

        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            self.performSegue(withIdentifier: "gotoSparts", sender: self)
        case 2:
            self.performSegue(withIdentifier: "gotoItems", sender: self)
        case 3:
            self.performSegue(withIdentifier: "gotoTires", sender: self)
        case 5:
            self.performSegue(withIdentifier: "gotoOils", sender: self)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0,6,9,11:
            return 60.0
        case 1,2,3,4,5,7,8,10:
            return 60.0
        case 12,13,14,15,16,17,18,19,20,21,22,23:
            return 50.0
        default:
            return 0
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
