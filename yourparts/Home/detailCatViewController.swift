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
    override func viewDidLoad() {
        super.viewDidLoad()

        self.catTableView.delegate = self
        self.catTableView.dataSource = self
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.isHidden = true

        
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
            return 2 + 2
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            switch indexPath.row {
                case 0:
                    let addCarCell = tableView.dequeueReusableCell(withIdentifier: "addCarCell") as! addCarTableViewCell
                    return addCarCell
                case 1:
                    let searchCell = tableView.dequeueReusableCell(withIdentifier: "searchCell") as! searchCatTableViewCell
//
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
//                categoryCell.catImage.sd_setImage(with: URL(string: self.homeVm.categoriesArr[indexPath.row - 3].image ?? "") , placeholderImage: nil, completed: { (image, error, cacheType, url) -> Void in
//                    if ((error) != nil) {
//                        // set the placeholder image here
//                        categoryCell.catImage.image = UIImage(named: "teelFramel")
//                    } else {
//                        // success ... use the image
//                    }
//                })
//
//                categoryCell.catName.text = self.homeVm.categoriesArr[indexPath.row - 3].name
                
                return categoryCell
            }

        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
            switch indexPath.row {
                case 0:
                    return 80.0
                case 1:
                    return 80.0
                case 2:
                    return 95.0
            default:
                return 115.0
            
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
