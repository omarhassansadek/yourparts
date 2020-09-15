//
//  newHomeViewController.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/13/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import SDWebImage
import NVActivityIndicatorView

class newHomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var activityind: NVActivityIndicatorView!
    @IBOutlet weak var homeVm: homeViewModel!
    @IBOutlet weak var tableView: UITableView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        statusBarView.backgroundColor = UIColor.white
        view.addSubview(statusBarView)
    

        self.navigationController?.navigationBar.isHidden = true
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        self.setNeedsStatusBarAppearanceUpdate()

    
        self.reqHomeCats()
        //registering cells
        let nib = UINib(nibName: String(describing: addCarTableViewCell.self), bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "addCarCell")

        let nib2 = UINib(nibName: String(describing: CategoryTitleTableViewCell.self), bundle: nil)
        self.tableView.register(nib2, forCellReuseIdentifier: "categoryTitleCell")
                
        let nib3 = UINib(nibName: String(describing: categoryTableViewCell.self), bundle: nil)
        self.tableView.register(nib3, forCellReuseIdentifier: "catCell")
        
        let nib4 = UINib(nibName: String(describing: offerTableViewCell.self), bundle: nil)
        self.tableView.register(nib4, forCellReuseIdentifier: "offerCell")
        
        //

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 + self.homeVm.categoriesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
            case 0:
                let addCarCell = tableView.dequeueReusableCell(withIdentifier: "addCarCell") as! addCarTableViewCell
                return addCarCell
            case 1:
                let offerCell = tableView.dequeueReusableCell(withIdentifier: "offerCell") as! offerTableViewCell
                
                let cellDelegate = offersCollectionDelegate()
                        //cellDelegate.profilesArray = self.storiesViewModel.commonTagsphotographerResponse?.data ?? [Photographer]()
                        //cellDelegate.targetController = self
                cellDelegate.row = indexPath.row
                offerCell.row = indexPath.row
                        //cellDelegate.type = "t"
//                offerCell.collectionTitle.text = sparts[indexPath.row - 1]
                        
                offerCell.setCollectionViewDataSourceDelegate(cellDelegate, forRow: indexPath.row)
                      
                offerCell.selectionStyle = .none
                      
                        
                return offerCell
                
            case 2:
                let catCell = tableView.dequeueReusableCell(withIdentifier: "categoryTitleCell") as! CategoryTitleTableViewCell
                return catCell
                
        default:
            let categoryCell = tableView.dequeueReusableCell(withIdentifier: "catCell") as! categoryTableViewCell
            
            
            //categoryCell.catImage.s
            categoryCell.catImage.sd_setImage(with: URL(string: self.homeVm.categoriesArr[indexPath.row - 3].image ?? "") , placeholderImage: nil, completed: { (image, error, cacheType, url) -> Void in
                if ((error) != nil) {
                    // set the placeholder image here
                    categoryCell.catImage.image = UIImage(named: "teelFramel")
                } else {
                    // success ... use the image
                }
            })

            categoryCell.catName.text = self.homeVm.categoriesArr[indexPath.row - 3].name
            
            return categoryCell
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
            case 0:
                return 80.0
            case 1:
                return 205.0
            case 2:
                return 45.0
        default:
            return 115.0
        
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.catIdToGo = self.homeVm.categoriesArr[indexPath.row - 3].id
        
        if self.catIdToGo == 1 || self.catIdToGo == 737 || self.catIdToGo == 58{
            self.performSegue(withIdentifier: "gotoDetailCat", sender: self)
        }else if self.catIdToGo == 85{
            self.performSegue(withIdentifier: "gotoTires", sender: self)
        }
        
    }
    
    
    func reqHomeCats(){
        
        self.activityind.startAnimating()
        self.homeVm.getHomeCategories(apiParameters: [:], onSuccess: { isSuccess in
            //
            self.activityind.stopAnimating()

            if isSuccess{
                self.tableView.reloadData()
            }
            
        }) { (errorMsg) in
            //
            //self.activityind.startAnimating()

        }
    }
    
    var catIdToGo: Int?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "gotoDetailCat"{
            var destVC = segue.destination as! detailCatViewController
            destVC.catId = self.catIdToGo
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
