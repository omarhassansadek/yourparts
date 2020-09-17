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
    
    var catId: Int?
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true

    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.subCat != -1{
            self.getSubDetailCat()
        }else{
            self.getDetailCat()
        }
        
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
        
        if indexPath.row > 1{
            
            if self.subCat != -1{
                self.indexChoosed = indexPath.row - 2
                self.performSegue(withIdentifier: "gotoProductList", sender: self)
            }else{
                self.indexChoosed = indexPath.row - 2
                self.performSegue(withIdentifier: "gotoDetailCat", sender: self)
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
    
    
    func getDetailCat(){
        self.detailCatVM.getDetailCategory(id: self.catId ?? -1, apiParameters: [:], onSuccess: { (isSuccess) in
            //
            
            self.catTableView.reloadData()
        }) { (errMsg) in
            //
        }
    }
    
    func getSubDetailCat(){
        
        if self.detailCat != -1 && self.subCat != -1{
            self.detailCatVM.getSubDetailCategory(id: self.detailCat, subId: self.subCat, apiParameters: [:], onSuccess: { (isSuccess) in
                
                if isSuccess{
                    self.catTableView.reloadData()

                }
            }) { (errMsg) in
                //
            }

        }
        

    }
    
    
    var subCat: Int = -1
    
    var detailCat: Int = -1
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "gotoDetailCat"{
            if self.indexChoosed >= 0{
                let destCont = segue.destination as! detailCatViewController
                destCont.subCat = self.detailCatVM.detailCategory?.detailCat[self.indexChoosed].id ?? -1
                destCont.detailCat = self.detailCatVM.detailCategory?.id ?? -1
            }

        }else{
            let destCont = segue.destination as! productListViewController
            destCont.vcTitle = self.detailCatVM.detailCategory?.detailCat[self.indexChoosed].name ?? ""
            var subs_id = self.detailCatVM.detailCategory?.detailCat[self.indexChoosed].id ?? -1
            var pathtoGo = self.detailCatVM.path + "&subs_id=\(subs_id)"
            destCont.pathToCall = pathtoGo
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
