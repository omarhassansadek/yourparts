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
    
    //MARK:- Outlets
    @IBOutlet weak var activityind: NVActivityIndicatorView!
    @IBOutlet weak var homeVm: homeViewModel!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Variables
    var catCount = 0
    var finishLoad = false
    var catIdToGo: Int?
    var selectedLevel2Cat: Int?
    var selectedLevel3Cat: Int?
    var titleToGo = ""
    var pathToGo = ""
    
    //MARK:- Methods
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.barTintColor = primaryColor
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isHidden = true
        self.selectedLevel2Cat = -1
        self.titleToGo = ""
        if finishLoad{
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        statusBarView.backgroundColor = UIColor.white
        view.addSubview(statusBarView)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.setNeedsStatusBarAppearanceUpdate()
        
        //MARK:- Registering Cells
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
        
    }
    
    //MARK:- TableView Delegates
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.homeVm.homeCards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self.homeVm.homeCards[indexPath.row] {
        case "0":
            let addCarCell = tableView.dequeueReusableCell(withIdentifier: "addCarCell") as! addCarTableViewCell
            
            let carSelected = UserDefaults.standard.bool(forKey: "carChecked")
            
            if carSelected{
                
                if let image = UserDefaults.standard.string(forKey: "image"){
                    addCarCell.carLogo.sd_setImage(with: URL(string: image) , placeholderImage: nil, completed: { (image, error, cacheType, url) -> Void in
                        if ((error) != nil) {
                            addCarCell.carLogo.image = UIImage(named: "carico")
                        } else {
                        }
                    })
                    
                }
                
                if let vehicle_name = UserDefaults.standard.string(forKey: "vehicle_name"){
                    addCarCell.addCarLbl.text = vehicle_name
                }
                
                if let model_name = UserDefaults.standard.string(forKey: "model_name"){
                    if let year = UserDefaults.standard.string(forKey: "year"){
                        addCarCell.detailAddCarLbl.text = model_name + " " + year
                    }
                }
                
            }else{
                addCarCell.carLogo.image = UIImage(named: "add")
                addCarCell.addCarLbl.text = "Add car now".localized
                addCarCell.detailAddCarLbl.text = "Add car to see parts for your car".localized
            }
            
            return addCarCell
            
        case "a":
            let offerCell = tableView.dequeueReusableCell(withIdentifier: "offerCell") as! offerTableViewCell
            
            let cellDelegate = offersCollectionDelegate()
            
            cellDelegate.targetController = self
            cellDelegate.row = indexPath.row
            cellDelegate.offersArr = self.homeVm.offersArr
            offerCell.row = indexPath.row
            offerCell.setCollectionViewDataSourceDelegate(cellDelegate, forRow: indexPath.row)
            offerCell.selectionStyle = .none
            
            return offerCell
            
        case "b" , "c":
            let frequentCell = tableView.dequeueReusableCell(withIdentifier: "frequentCell") as! frequentlyNeededTableViewCell
            
            let cellDelegate = frequentlyCollectionDelegate()
            
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
            frequentCell.setCollectionViewDataSourceDelegate(cellDelegate, forRow: indexPath.row)
            frequentCell.selectionStyle = .none
            
            return frequentCell
            
        case "d":
            let catCell = tableView.dequeueReusableCell(withIdentifier: "categoryTitleCell") as! CategoryTitleTableViewCell
            
            return catCell
            
        case "e":
            let categoryCell = tableView.dequeueReusableCell(withIdentifier: "catGridCell") as! catGridTableViewCell
            
            categoryCell.layoutIfNeeded()
            
            let cellDelegate = catCollectionDelegate()
            
            cellDelegate.targetController = self
            cellDelegate.row = indexPath.row
            categoryCell.row = indexPath.row
            categoryCell.setCollectionViewDataSourceDelegate(cellDelegate, forRow: indexPath.row)
            categoryCell.selectionStyle = .none
            
            return categoryCell
            
        case "f" , "g":
            let brandCell = tableView.dequeueReusableCell(withIdentifier: "brandCell") as! brandsTableViewCell
            let cellDelegate = brandsCollectionDelegate()
            
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
            return 185.0
            
        case "d":
            return 45.0
            
        case "f" , "g":
            return 120.0
            
        default:
            let countOfRows =  CGFloat(Double(self.homeVm.homeCategoryResponse.data?.count ?? 0) / 2.0)
            return ((self.view.frame.width / 2.0) * 0.60 ) * countOfRows
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print(indexPath.row)
        
        if self.homeVm.homeCards[indexPath.row] == "0"{
            self.performSegue(withIdentifier: "gotoAddCarVC", sender: self)
        }
        
    }
    
    //MARK:- Home Methods
    func reqHomeCats(){
        
        self.homeVm.getHomeCategories(apiParameters: [:], onSuccess: { isSuccess in
            self.activityind.stopAnimating()
            
            if isSuccess{
                self.finishLoad = true
                self.tableView.reloadData()
            }
            
        }) { (errorMsg) in
            self.finishLoad = true
            self.tableView.reloadData()
        }
    }
    
    func getMostCats(){
        
        self.homeVm.getMostCategories(onSuccess: { (isSuccess) in
            self.tableView.reloadData()
            self.activityind.stopAnimating()
            self.reqHomeCats()
        }) { (errMsg) in
            self.reqHomeCats()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "gotoDetailCat"{
            let destVC = segue.destination as! detailCatViewController
            destVC.catId = self.catIdToGo
            destVC.detailCat = self.catIdToGo ?? -1
            destVC.subCat = self.selectedLevel2Cat ?? -1
            destVC.catTitle = self.titleToGo
        }else if segue.identifier == "gotoProductListVC"{
            let destCont = segue.destination as! productListViewController
            destCont.vcTitle = self.titleToGo
            destCont.pathToCall = self.pathToGo
        }
    }
    
    func getFreqNeeded(){
        self.homeVm.getFreqNeededFromApi(onSuccess: { (isSuccess) in
            if isSuccess{
                self.getMostCats()
            }
        }) { (errMsg) in
            self.getMostCats()
        }
    }
    
    func getOffers(){
        
        self.activityind.startAnimating()
        self.homeVm.getOffersFromApi(onSuccess: { (isSuccess) in
            
            print(isSuccess)
            
            self.getFreqNeeded()
        }) { (errorMsg) in
            self.getFreqNeeded()
        }
    }
    
}
