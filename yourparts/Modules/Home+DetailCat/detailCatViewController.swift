//
//  detailViewController.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/14/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class detailCatViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    //MARK:- Outlets
    @IBOutlet weak var catTableView: UITableView!
    @IBOutlet weak var detailCatVM: detailCatVM!
    
    //MARK:- Variables
    var catId: Int?
    var subCat: Int = -1
    var catTitle: String?
    var indexChoosed: Int = -1
    var titleCatToGo = ""
    var finishLoad = false
    var detailCat: Int = -1
    
    //MARK:- Methods
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
        
        //MARK:- Cells Registration
        let nib = UINib(nibName: String(describing: addCarTableViewCell.self), bundle: nil)
        self.catTableView.register(nib, forCellReuseIdentifier: "addCarCell")
        
        let nib2 = UINib(nibName: String(describing: searchCatTableViewCell.self), bundle: nil)
        self.catTableView.register(nib2, forCellReuseIdentifier: "searchCell")
        
        let nib3 = UINib(nibName: String(describing: detailCatTableViewCell.self), bundle: nil)
        self.catTableView.register(nib3, forCellReuseIdentifier: "detailCatCell")
        
    }
    
    //MARK:- TableView Delegates
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
            
        case 1:
            let searchCell = tableView.dequeueReusableCell(withIdentifier: "searchCell") as! searchCatTableViewCell
            searchCell.catName.text = self.catTitle ?? ""
            searchCell.goBack = {
                self.navigationController?.popViewController(animated: true)
            }
            
            return searchCell
            
        default:
            let categoryCell = tableView.dequeueReusableCell(withIdentifier: "detailCatCell") as! detailCatTableViewCell
            
            categoryCell.detailImg.sd_setImage(with: URL(string: self.detailCatVM.detailCategory?.detailCat[indexPath.row - 2].image ?? "") , placeholderImage: nil, completed: { (image, error, cacheType, url) -> Void in
                if ((error) != nil) {
                    categoryCell.detailImg.image = UIImage(named: "catPlaceholder")
                } else {
                }
            })
            categoryCell.catName.text = self.detailCatVM.detailCategory?.detailCat[indexPath.row - 2].name
            
            return categoryCell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0{
            self.performSegue(withIdentifier: "gotoCarsVC", sender: self)
        }else{
            
            let carSelected = UserDefaults.standard.bool(forKey: "carChecked")
            
            if indexPath.row > 1{
                if self.subCat != -1{
                    
                    if self.detailCatVM.detailCategory?.detailCat[indexPath.row - 2].category_needed_car == true{
                        if self.detailCatVM.detailCategory?.detailCat[indexPath.row - 2].user_has_car == true{
                            if carSelected{
                                self.indexChoosed = indexPath.row - 2
                                self.performSegue(withIdentifier: "gotoProductList", sender: self)
                                
                            }else{
                                self.performSegue(withIdentifier: "gotoCarsVC", sender: self)
                                
                            }
                        }else{
                            let isLogged = UserDefaults.standard.bool(forKey: "isLogged")
                            
                            if isLogged{
                                self.performSegue(withIdentifier: "gotoAddCarVC", sender: self)
                                
                            }else{
                                self.indexChoosed = indexPath.row - 2
                                self.performSegue(withIdentifier: "gotoProductList", sender: self)
                            }
                            
                        }
                    }else{
                        self.indexChoosed = indexPath.row - 2
                        self.performSegue(withIdentifier: "gotoProductList", sender: self)
                    }
                }else{
                    if self.detailCatVM.detailCategory?.detailCat[indexPath.row - 2].category_needed_car == true{
                        if self.detailCatVM.detailCategory?.detailCat[indexPath.row - 2].user_has_car == true{
                            if carSelected{
                                self.indexChoosed = indexPath.row - 2
                                self.titleCatToGo = self.detailCatVM.detailCategory?.detailCat[indexPath.row - 2].name ?? ""
                                self.performSegue(withIdentifier: "gotoDetailCat", sender: self)
                                
                            }else{
                                self.performSegue(withIdentifier: "gotoCarsVC", sender: self)
                                
                            }
                        }else{
                            let isLogged = UserDefaults.standard.bool(forKey: "isLogged")
                            if isLogged{
                                self.performSegue(withIdentifier: "gotoAddCarVC", sender: self)
                            }else{
                                self.indexChoosed = indexPath.row - 2
                                self.titleCatToGo = self.detailCatVM.detailCategory?.detailCat[indexPath.row - 2].name ?? ""
                                self.performSegue(withIdentifier: "gotoDetailCat", sender: self)
                            }
                        }
                    }else{
                        self.indexChoosed = indexPath.row - 2
                        self.titleCatToGo = self.detailCatVM.detailCategory?.detailCat[indexPath.row - 2].name ?? ""
                        self.performSegue(withIdentifier: "gotoDetailCat", sender: self)
                    }
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
    
    //MARK:- Category Details Methods
    func getDetailCat(){
        self.finishLoad = false
        
        self.detailCatVM.getDetailCategory(id: self.catId ?? -1, apiParameters: [:], onSuccess: { (isSuccess) in
            self.finishLoad = true
            self.catTableView.reloadData()
        }) { (errMsg) in
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
                self.finishLoad = true
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "gotoDetailCat"{
            if self.indexChoosed >= 0{
                let destCont = segue.destination as! detailCatViewController
                destCont.subCat = self.detailCatVM.detailCategory?.detailCat[self.indexChoosed].id ?? -1
                destCont.detailCat = self.detailCatVM.detailCategory?.id ?? -1
                destCont.catTitle = self.titleCatToGo
            }
        }else if segue.identifier == "gotoProductList"{
            let destCont = segue.destination as! productListViewController
            destCont.vcTitle = self.detailCatVM.detailCategory?.detailCat[self.indexChoosed].name ?? ""
            let subs_id = self.detailCatVM.detailCategory?.detailCat[self.indexChoosed].id ?? -1
            let pathtoGo = self.detailCatVM.path + "&subs_id=\(subs_id)"
            destCont.pathToCall = pathtoGo
        }else if segue.identifier == "gotoAddCarVC"{
            let destCont = segue.destination as! addCarViewController
            destCont.autoSelect = true
        }
    }
    
}
