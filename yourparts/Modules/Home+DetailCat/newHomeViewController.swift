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
        return self.homeVm.homeCards.count
    }
    
//    var homeSections = ["a" , "c" , "d"]
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self.homeVm.homeCards[indexPath.row] {
            case "0":
                let addCarCell = tableView.dequeueReusableCell(withIdentifier: "addCarCell") as! addCarTableViewCell
                return addCarCell
            case "a":
                let offerCell = tableView.dequeueReusableCell(withIdentifier: "offerCell") as! offerTableViewCell
                
                let cellDelegate = offersCollectionDelegate()
                //cellDelegate.profilesArray = self.storiesViewModel.commonTagsphotographerResponse?.data ?? [Photographer]()
                cellDelegate.targetController = self
                cellDelegate.row = indexPath.row
                cellDelegate.offersArr = self.homeVm.offersArr
                offerCell.row = indexPath.row
                //cellDelegate.type = "t"
                //                offerCell.collectionTitle.text = sparts[indexPath.row - 1]
                
                offerCell.setCollectionViewDataSourceDelegate(cellDelegate, forRow: indexPath.row)
                
                offerCell.selectionStyle = .none
                
                
                return offerCell
            case "b" , "c":
                let frequentCell = tableView.dequeueReusableCell(withIdentifier: "frequentCell") as! frequentlyNeededTableViewCell
                
                let cellDelegate = frequentlyCollectionDelegate()
                //cellDelegate.profilesArray = self.storiesViewModel.commonTagsphotographerResponse?.data ?? [Photographer]()
                cellDelegate.targetController = self
                cellDelegate.row = indexPath.row
                frequentCell.row = indexPath.row
                if self.homeVm.homeCards[indexPath.row] == "b"
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
            case "d":
                let catCell = tableView.dequeueReusableCell(withIdentifier: "categoryTitleCell") as! CategoryTitleTableViewCell
                return catCell
            case "e":
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
                
                return categoryCell
            case "f" , "g":
                
                let brandCell = tableView.dequeueReusableCell(withIdentifier: "brandCell") as! brandsTableViewCell
                
                let cellDelegate = brandsCollectionDelegate()
                //cellDelegate.profilesArray = self.storiesViewModel.commonTagsphotographerResponse?.data ?? [Photographer]()
                //cellDelegate.targetController = self
                cellDelegate.row = indexPath.row
                brandCell.row = indexPath.row
                if self.homeVm.homeCards[indexPath.row] == "g"
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
                //
                return UITableViewCell()
                
        }
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch self.homeVm.homeCards[indexPath.row] {
            case "0":
                return 80.0
            case "a":
                return 300.0
            case "b", "c" :
                return 170.0

            case "d":
                return 45.0
            
            case "f" , "g":
                return 120.0
        default:
            var countOfRows =  CGFloat(Double(self.homeVm.homeCategoryResponse.data?.count ?? 0) / 2.0)
            
            return ((self.view.frame.width / 2.0) * 0.60 ) * countOfRows
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
         if self.homeVm.homeCards[indexPath.row] == "0"{
            self.performSegue(withIdentifier: "gotoAddCarVC", sender: self)
        }
   
        
    }
    
    var catCount = 0
    
    
    func reqHomeCats(){
        
        self.homeVm.getHomeCategories(apiParameters: [:], onSuccess: { isSuccess in
            //
            self.activityind.stopAnimating()

            if isSuccess{

                //self.catCount = self.homeVm.categoriesArr.count + 2 + 4
                //self.catCount = 1 + 2 + 4
                self.tableView.reloadData()
            }
            
        }) { (errorMsg) in
            //
            //self.activityind.startAnimating()
            self.tableView.reloadData()


        }
    }
    
    var catIdToGo: Int?

    var selectedLevel3Cat: Int?

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "gotoDetailCat"{
            var destVC = segue.destination as! detailCatViewController
            destVC.catId = self.catIdToGo
        }else if segue.identifier == "gotoProductListVC"{
            let destCont = segue.destination as! productListViewController
            destCont.vcTitle = "Offers Today".localized
            //var subs_id = self.detailCatVM.detailCategory?.detailCat[self.indexChoosed].id ?? -1
            var pathtoGo = baseUrl+catLevel3Url+"\(self.selectedLevel3Cat! )"
            destCont.pathToCall = pathtoGo

        }
    }
    
    func getFreqNeeded(){
        self.homeVm.getFreqNeededFromApi(onSuccess: { (isSuccess) in
           
            if isSuccess{
                self.reqHomeCats()
            }
            
        }) { (errMsg) in
            //
            self.reqHomeCats()

        }
    }
    
    
    func getOffers(){
        self.activityind.startAnimating()

        self.homeVm.getOffersFromApi(onSuccess: { (isSuccess) in
            //
            
            print(isSuccess)
            
            self.getFreqNeeded()

        }) { (errorMsg) in
            //
            self.getFreqNeeded()

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
