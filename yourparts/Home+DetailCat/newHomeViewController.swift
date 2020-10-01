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
    
    
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = primaryColor
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        statusBarView.backgroundColor = UIColor.white
        view.addSubview(statusBarView)
    
        self.tableView.delegate = self
        self.tableView.dataSource = self


        
        // Do any additional setup after loading the view.
        
        self.setNeedsStatusBarAppearanceUpdate()

    
        
        //registering cells
        let nib = UINib(nibName: String(describing: addCarTableViewCell.self), bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "addCarCell")

        let nib2 = UINib(nibName: String(describing: CategoryTitleTableViewCell.self), bundle: nil)
        self.tableView.register(nib2, forCellReuseIdentifier: "categoryTitleCell")
                
        let nib3 = UINib(nibName: String(describing: categoryTableViewCell.self), bundle: nil)
        self.tableView.register(nib3, forCellReuseIdentifier: "catCell")
        
        let nib4 = UINib(nibName: String(describing: offerTableViewCell.self), bundle: nil)
        self.tableView.register(nib4, forCellReuseIdentifier: "offerCell")

        let nib5 = UINib(nibName: String(describing: frequentlyNeededTableViewCell.self), bundle: nil)
        self.tableView.register(nib5, forCellReuseIdentifier: "frequentCell")
        
        let nib6 = UINib(nibName: String(describing: brandsTableViewCell.self), bundle: nil)
        self.tableView.register(nib6, forCellReuseIdentifier: "brandCell")
        
        let nib7 = UINib(nibName: String(describing: catGridTableViewCell.self), bundle: nil)
        self.tableView.register(nib7, forCellReuseIdentifier: "catGridCell")


        
        self.getOffers()
        //

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + self.catCount
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
                cellDelegate.offersArr = self.homeVm.offersArr
                offerCell.row = indexPath.row
                        //cellDelegate.type = "t"
//                offerCell.collectionTitle.text = sparts[indexPath.row - 1]
                        
                offerCell.setCollectionViewDataSourceDelegate(cellDelegate, forRow: indexPath.row)
                      
                offerCell.selectionStyle = .none
                      
                        
                return offerCell
                
            case 2,3:
                
                let frequentCell = tableView.dequeueReusableCell(withIdentifier: "frequentCell") as! frequentlyNeededTableViewCell
                

                                           
                               let cellDelegate = frequentlyCollectionDelegate()
                                                   //cellDelegate.profilesArray = self.storiesViewModel.commonTagsphotographerResponse?.data ?? [Photographer]()
                                                   //cellDelegate.targetController = self
                               cellDelegate.row = indexPath.row
                               frequentCell.row = indexPath.row
                                if indexPath.row == 2
                                {
                                    cellDelegate.type = "c"
                                    frequentCell.frequentlyNeededLbl.text = "What your car needs".localized
                                    frequentCell.frequentlyNeededLbl.font = UIFont(name: "Cairo-Bold", size: 18)


                                }else{
                                    cellDelegate.type = "f"
                                    frequentCell.frequentlyNeededLbl.text = "Frequently Needed".localized
                                    frequentCell.frequentlyNeededLbl.font = UIFont(name: "Cairo-Bold", size: 18)

                                }
                           //                offerCell.collectionTitle.text = sparts[indexPath.row - 1]
                                                   
                               frequentCell.setCollectionViewDataSourceDelegate(cellDelegate, forRow: indexPath.row)
                                                 
                               frequentCell.selectionStyle = .none
                                                 
                                                   
                return frequentCell
            
                
            case 4:
               let catCell = tableView.dequeueReusableCell(withIdentifier: "categoryTitleCell") as! CategoryTitleTableViewCell
                           return catCell
            
        case self.catCount - 1 ,self.catCount :
                
                let brandCell = tableView.dequeueReusableCell(withIdentifier: "brandCell") as! brandsTableViewCell
                

                                           
                    let cellDelegate = brandsCollectionDelegate()
                                                   //cellDelegate.profilesArray = self.storiesViewModel.commonTagsphotographerResponse?.data ?? [Photographer]()
                                                   //cellDelegate.targetController = self
                    cellDelegate.row = indexPath.row
                    brandCell.row = indexPath.row
                    if indexPath.row == self.catCount
                    {
                        cellDelegate.type = "c"
                        brandCell.titleLbl.text = "Spare Parts Brand".localized


                    }else{
                        cellDelegate.type = "f"
                        brandCell.titleLbl.text = "Cars Brand".localized
                        
                    }
                                                   
                    brandCell.setCollectionViewDataSourceDelegate(cellDelegate, forRow: indexPath.row)
                                                 
                    brandCell.selectionStyle = .none
                                                 
                                                   
                return brandCell
            
        default:
            let categoryCell = tableView.dequeueReusableCell(withIdentifier: "catGridCell") as! catGridTableViewCell
//

            categoryCell.layoutIfNeeded()
                                   
            let cellDelegate = catCollectionDelegate()
                                           //cellDelegate.profilesArray = self.storiesViewModel.commonTagsphotographerResponse?.data ?? [Photographer]()
            cellDelegate.targetController = self
            cellDelegate.row = indexPath.row
            categoryCell.row = indexPath.row
//            if indexPath.row == self.catCount
//            {
//                cellDelegate.type = "c"
//                brandCell.titleLbl.text = "Spare Parts Brand".localized
//
//
//            }else{
//                cellDelegate.type = "f"
//                brandCell.titleLbl.text = "Cars Brand".localized
//
//            }
                                           
            categoryCell.setCollectionViewDataSourceDelegate(cellDelegate, forRow: indexPath.row)
                                         
            categoryCell.selectionStyle = .none
//            switch indexPath.row {
//            case 5:
//                categoryCell.catImage.image = UIImage(named: "cat1")
//            case 6:
//                categoryCell.catImage.image = UIImage(named: "cat2")
//            case 7:
//                categoryCell.catImage.image = UIImage(named: "cat3")
//            case 8:
//                categoryCell.catImage.image = UIImage(named: "cat4")
//            case 9:
//                categoryCell.catImage.image = UIImage(named: "cat5")
//            case 10:
//                categoryCell.catImage.image = UIImage(named: "cat6")
//
//            default:
//                categoryCell.catImage.image = UIImage(named: "teelFramel")
//
//            }
            //categoryCell.catImage.s
//            categoryCell.catImage.sd_setImage(with: URL(string: self.homeVm.categoriesArr[indexPath.row - 4].image ?? "") , placeholderImage: nil, completed: { (image, error, cacheType, url) -> Void in
//                if ((error) != nil) {
//                    // set the placeholder image here
//                    categoryCell.catImage.image = UIImage(named: "teelFramel")
//                } else {
//                    // success ... use the image
//                }
//            })

//            print(indexPath.row)
//            categoryCell.catName.text = self.homeVm.categoriesArr[indexPath.row - 5].name ?? ""
//
            return categoryCell
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
            case 0:
                return 80.0
            case 1:
                return 300.0
            case 2,3:
                return 170.0

            case 4:
                return 45.0
            
            case self.catCount - 1, self.catCount:
                return 120.0
        default:
            var countOfRows =  CGFloat(Double(self.homeVm.categoriesArr.count) / 2.0)
            
            return ((self.view.frame.width / 2.0) * 0.60 ) * countOfRows
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        if indexPath.row > 4{
            if indexPath.row != 13 && indexPath.row != 12{
                self.catIdToGo = self.homeVm.categoriesArr[indexPath.row - 5].id
                           
                           if self.catIdToGo == 1 || self.catIdToGo == 737 || self.catIdToGo == 58{
                               self.performSegue(withIdentifier: "gotoDetailCat", sender: self)
                           }else if self.catIdToGo == 85{
                               self.performSegue(withIdentifier: "gotoTires", sender: self)
                           }
            }
        
        }else if indexPath.row == 0{
            self.performSegue(withIdentifier: "gotoAddCarVC", sender: self)
        }
   
        
    }
    
    var catCount = 0
    
    
    func reqHomeCats(){
        
        self.activityind.startAnimating()
        self.homeVm.getHomeCategories(apiParameters: [:], onSuccess: { isSuccess in
            //
            self.activityind.stopAnimating()

            if isSuccess{

                //self.catCount = self.homeVm.categoriesArr.count + 2 + 4
                self.catCount = 1 + 2 + 4
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
    
    func getOffers(){
        self.homeVm.getOffersFromApi(onSuccess: { (isSuccess) in
            //
            
            print(isSuccess)
            
            
            self.reqHomeCats()

        }) { (errorMsg) in
            //
            self.reqHomeCats()

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
