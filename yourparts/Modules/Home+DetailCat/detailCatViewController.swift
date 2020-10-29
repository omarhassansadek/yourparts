//
//  detailViewController.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/14/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class detailCatViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var catTableView: UITableView!
    @IBOutlet weak var detailCatVM: detailCatVM!
    
    //call level2 categories using this id
    var catId: Int?
    //call level3 categories using this id

    var subCat: Int = -1

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        
        if self.subCat != -1 {
            self.getSubDetailCat()
        }else{
            self.getDetailCat()
        }
        
        if self.finishLoad {
            self.catTableView.reloadData()
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        statusBarView.backgroundColor = UIColor.white
        view.addSubview(statusBarView)
        
        
        
        self.catTableView.delegate = self
        self.catTableView.dataSource = self
        // Do any additional setup after loading the view.
        
        
        
        let nib = UINib(nibName: String(describing: addCarTableViewCell.self), bundle: nil)
        self.catTableView.register(nib, forCellReuseIdentifier: "addCarCell")
        
        let nib2 = UINib(nibName: String(describing: searchCatTableViewCell.self), bundle: nil)
        self.catTableView.register(nib2, forCellReuseIdentifier: "searchCell")
        
        let nib3 = UINib(nibName: String(describing: detailCatTableViewCell.self), bundle: nil)
        self.catTableView.register(nib3, forCellReuseIdentifier: "detailCatCell")
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 + (self.detailCatVM.detailCategory?.detailCat.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let addCarCell = tableView.dequeueReusableCell(withIdentifier: "addCarCell") as! addCarTableViewCell
            
            let carSelected = UserDefaults.standard.bool(forKey: "carChecked")
            
            if carSelected{
                
                if let image = UserDefaults.standard.string(forKey: "image"){
                    addCarCell.carLogo.sd_setImage(with: URL(string: image) , placeholderImage: nil, completed: { (image, error, cacheType, url) -> Void in
                        if ((error) != nil) {
                            // set the placeholder image here
                            addCarCell.carLogo.image = UIImage(named: "carico")
                        } else {
                            // success ... use the image
                        }
                    })                    }
                
                
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
        case 1:
            let searchCell = tableView.dequeueReusableCell(withIdentifier: "searchCell") as! searchCatTableViewCell
            //
            searchCell.catName.text = self.detailCatVM.detailCategory?.name ?? ""
            
            //                    let cellDelegate = offersCollectionDelegate()
            //                            //cellDelegate.profilesArray = self.storiesViewModel.commonTagsphotographerResponse?.data ?? [Photographer]()
            //                            //cellDelegate.targetController = self
            //                    cellDelegate.row = indexPath.row
            //                    offerCell.row = indexPath.row
            //                            //cellDelegate.type = "t"
            //    //                offerCell.collectionTitle.text = sparts[indexPath.row - 1]
            //
            //                    offerCell.setCollectionViewDataSourceDelegate(cellDelegate, forRow: indexPath.row)
            //
            //                    offerCell.selectionStyle = .none
            
            searchCell.goBack = {
                self.navigationController?.popViewController(animated: true)
            }
            
            
            return searchCell
            
            
        default:
            let categoryCell = tableView.dequeueReusableCell(withIdentifier: "detailCatCell") as! detailCatTableViewCell
            
            
            //categoryCell.catImage.s
            categoryCell.detailImg.sd_setImage(with: URL(string: self.detailCatVM.detailCategory?.detailCat[indexPath.row - 2].image ?? "") , placeholderImage: nil, completed: { (image, error, cacheType, url) -> Void in
                if ((error) != nil) {
                    // set the placeholder image here
                    categoryCell.detailImg.image = UIImage(named: "teelFramel")
                } else {
                    // success ... use the image
                }
            })
            
            categoryCell.catName.text = self.detailCatVM.detailCategory?.detailCat[indexPath.row - 2].name
            
            return categoryCell
        }
        
    }
    
    
    var indexChoosed: Int = -1
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0{
            self.performSegue(withIdentifier: "gotoCarsVC", sender: self)
        }else{
            
            let carSelected = UserDefaults.standard.bool(forKey: "carChecked")
            
            
            if indexPath.row > 1{
                
                if self.subCat != -1{   
                    //
                    
                    if self.detailCatVM.detailCategory?.detailCat[indexPath.row - 2].category_needed_car == true{
                        if self.detailCatVM.detailCategory?.detailCat[indexPath.row - 2].user_has_car == true{
                            if carSelected{
                                self.indexChoosed = indexPath.row - 2
                                self.performSegue(withIdentifier: "gotoProductList", sender: self)

                            }else{
                                self.performSegue(withIdentifier: "gotoCarsVC", sender: self)

                            }

                        }else{
                            self.performSegue(withIdentifier: "gotoAddCarVC", sender: self)

                        }
                        
                    }else{
                        self.indexChoosed = indexPath.row - 2
                        self.performSegue(withIdentifier: "gotoProductList", sender: self)

                    }

                    
                    //start logic
//                    if self.detailCatVM.detailCategory?.detailCat[indexPath.row - 2].category_needed_car == true && self.detailCatVM.detailCategory?.detailCat[indexPath.row - 2].user_has_car == true {
//
//                        if carSelected{
//                            self.indexChoosed = indexPath.row - 2
//                            self.performSegue(withIdentifier: "gotoProductList", sender: self)
//
//                        }else{
//                            //
//                            self.performSegue(withIdentifier: "gotoCarsVC", sender: self)
//
//                        }
//
//                    }else{
//                        //gotoAddCarVC
//                        self.performSegue(withIdentifier: "gotoAddCarVC", sender: self)
//
//                    }
                    //end logic
                }else{
                    //level 2 clicked
                    if self.detailCatVM.detailCategory?.detailCat[indexPath.row - 2].category_needed_car == true{
                        if self.detailCatVM.detailCategory?.detailCat[indexPath.row - 2].user_has_car == true{
                            if carSelected{
                                self.indexChoosed = indexPath.row - 2
                                self.performSegue(withIdentifier: "gotoDetailCat", sender: self)

                            }else{
                                self.performSegue(withIdentifier: "gotoCarsVC", sender: self)

                            }

                        }else{
                            self.performSegue(withIdentifier: "gotoAddCarVC", sender: self)

                        }
                        
                    }else{
                        self.indexChoosed = indexPath.row - 2
                        self.performSegue(withIdentifier: "gotoDetailCat", sender: self)

                    }
                    
                    //start logic
//                    if self.detailCatVM.detailCategory?.detailCat[indexPath.row - 2].category_needed_car == true && self.detailCatVM.detailCategory?.detailCat[indexPath.row - 2].user_has_car == true {
//
//                        if carSelected{
//                            self.indexChoosed = indexPath.row - 2
//                            self.performSegue(withIdentifier: "gotoDetailCat", sender: self)
//
//                        }else{
//                            self.performSegue(withIdentifier: "gotoCarsVC", sender: self)
//
//                        }
//
//
//                    }else{
//                        self.performSegue(withIdentifier: "gotoAddCarVC", sender: self)
//
//                    }
                    //end logic
                    
                }
                
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 80.0
        case 1:
            return 105.0
        case 2:
            return 95.0
        default:
            return 115.0
            
        }
        
    }
    
    var finishLoad = false
    
    func getDetailCat(){
        self.finishLoad = false
        
        self.detailCatVM.getDetailCategory(id: self.catId ?? -1, apiParameters: [:], onSuccess: { (isSuccess) in
            //
            self.finishLoad = true
            
            self.catTableView.reloadData()
        }) { (errMsg) in
            //
            self.finishLoad = true
            
        }
    }
    
    func getSubDetailCat(){
        self.finishLoad = false
        
        if self.detailCat != -1 && self.subCat != -1{
            self.detailCatVM.getSubDetailCategory(id: self.detailCat, subId: self.subCat, apiParameters: [:], onSuccess: { (isSuccess) in
                self.finishLoad = true
                
                if isSuccess{
                    self.catTableView.reloadData()
                    
                }
            }) { (errMsg) in
                //
                self.finishLoad = true
                
            }
            
        }
        
        
    }
    
    
    
    var detailCat: Int = -1
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "gotoDetailCat"{
            if self.indexChoosed >= 0{
                let destCont = segue.destination as! detailCatViewController
                destCont.subCat = self.detailCatVM.detailCategory?.detailCat[self.indexChoosed].id ?? -1
                destCont.detailCat = self.detailCatVM.detailCategory?.id ?? -1
            }
            
        }else if segue.identifier == "gotoProductList"{
            let destCont = segue.destination as! productListViewController
            destCont.vcTitle = self.detailCatVM.detailCategory?.detailCat[self.indexChoosed].name ?? ""
            var subs_id = self.detailCatVM.detailCategory?.detailCat[self.indexChoosed].id ?? -1
            var pathtoGo = self.detailCatVM.path + "&subs_id=\(subs_id)"
            destCont.pathToCall = pathtoGo
        }else if segue.identifier == "gotoAddCarVC"{
            let destCont = segue.destination as! addCarViewController
            destCont.autoSelect = true
            
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
