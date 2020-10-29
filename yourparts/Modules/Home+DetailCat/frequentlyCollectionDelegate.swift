//
//  frequentlyCollectionDelegate.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/28/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class frequentlyCollectionDelegate: NSObject ,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

        var targetController : newHomeViewController?
        var row: Int?
        var type: String?
        
        var catArrs: [profileMenu] = [profileMenu(img: "f4", mTitle: "قطع غيار", sTitle: "") , profileMenu(img: "f2", mTitle: "بوجيهات", sTitle: "") , profileMenu(img: "f3", mTitle: "زيوت و سوائل", sTitle: "") , profileMenu(img: "f4", mTitle: "قطع غيار", sTitle: "") , profileMenu(img: "f1", mTitle: "قطع غيار", sTitle: "")  , profileMenu(img: "f3", mTitle: "زيوت و سوائل", sTitle: "") , profileMenu(img: "f2", mTitle: "بوجيهات", sTitle: "")  ]
    
        var cat2Arr: [profileMenu] = [profileMenu(img: "c1", mTitle: "بطاحات", sTitle: "") , profileMenu(img: "c2", mTitle: "كاوتشات", sTitle: ""), profileMenu(img: "c3", mTitle: "بوجيهات", sTitle: "") , profileMenu(img: "c4", mTitle: "بطاريات", sTitle: "") , profileMenu(img: "c1", mTitle: "بطاحات", sTitle: "") ,profileMenu(img: "c2", mTitle: "كاوتشات", sTitle: ""), profileMenu(img: "c3", mTitle: "بوجيهات", sTitle: "")  ]
    
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            if type == "f"{
                return self.targetController?.homeVm.mostWantedCategoryResponse.data?.count ?? 0
            }else{
                return self.targetController?.homeVm.homeFreqCategoryResponse.data?.count ?? 0
            }
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            

                let cellCollection = collectionView.dequeueReusableCell(withReuseIdentifier: "frequentCell", for: indexPath) as! frequentCollectionViewCell
                
                //cellCollection.roundView.backgroundColor = UIColor.white
                //cellCollection.offerimg.image = UIImage(named:"offerSample")
                
                if type == "f"{
//                    cellCollection.roundView.backgroundColor = UIColor.clear
                    cellCollection.catLbl.text = self.targetController?.homeVm.mostWantedCategoryResponse.data?[indexPath.row].name
                    cellCollection.catImage.sd_setImage(with: URL(string: self.targetController?.homeVm.mostWantedCategoryResponse.data?[indexPath.row].image ?? "") , placeholderImage: nil, completed: { (image, error, cacheType, url) -> Void in
                           if ((error) != nil) {
                               // set the placeholder image here
                               cellCollection.catImage.image = UIImage(named: "c2")
                           } else {
                               // success ... use the image
                           }
                       })
                   // cellCollection.catImage.image = UIImage(named:self.targetController?.homeVm.mostWantedCategoryResponse.data?[indexPath.row].image ?? "")
                    cellCollection.catImage.contentMode = .scaleAspectFit
                    cellCollection.imgTopConstraint.constant = 15
                    cellCollection.imgBottomConstraint.constant = 5
                    cellCollection.imgLeadingConstraint.constant = 15
                    cellCollection.imgTrailingConstraint.constant = 15
                    cellCollection.catImage.layoutIfNeeded()


                }else{
                    cellCollection.roundView.backgroundColor = UIColor.clear
                    cellCollection.catImage.layer.cornerRadius = 17.5
                        cellCollection.catLbl.text = self.targetController?.homeVm.homeFreqCategoryResponse.data?[indexPath.row].name ?? ""
                    cellCollection.catLbl.font = UIFont(name: "Cairo-Regular", size: 14)


                    // cellCollection.catLbl.font = UIFont(name: <#T##String#>, size: <#T##CGFloat#>)
                    cellCollection.catImage.sd_setImage(with: URL(string: self.targetController?.homeVm.homeFreqCategoryResponse.data?[indexPath.row].image ?? "") , placeholderImage: nil, completed: { (image, error, cacheType, url) -> Void in
                        if ((error) != nil) {
                            // set the placeholder image here
                            cellCollection.catImage.image = UIImage(named: "c2")
                        } else {
                            // success ... use the image
                        }
                    })
                    //cellCollection.catImage.image = UIImage(named:self.cat2Arr[indexPath.row].image ?? "")
                    cellCollection.imgTopConstraint.constant = 0
                    cellCollection.imgBottomConstraint.constant = -2.5
                    cellCollection.imgLeadingConstraint.constant = 0
                    cellCollection.imgTrailingConstraint.constant = 0
                    cellCollection.catImage.layoutIfNeeded()
                    cellCollection.catImage.contentMode = .scaleAspectFit
                    cellCollection.imgTopConstraint.constant = 0
                    cellCollection.roundView.layoutIfNeeded()
                }

                return cellCollection
            
            

                
            

        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            if type == "f"{
                var level = self.targetController?.homeVm.mostWantedCategoryResponse.data?[indexPath.row].category_level ?? ""
                  switch level {
                  case "1":
                      //
                      self.targetController?.catIdToGo = self.targetController?.homeVm.mostWantedCategoryResponse.data?[indexPath.row].id
                      self.targetController?.performSegue(withIdentifier: "gotoDetailCat", sender: self.targetController)
                   case "3":
                      self.targetController?.selectedLevel3Cat = self.targetController?.homeVm.mostWantedCategoryResponse.data?[indexPath.row].id
                      self.targetController?.titleToGo = self.targetController?.homeVm.mostWantedCategoryResponse.data?[indexPath.row].name ?? ""
                      self.targetController?.performSegue(withIdentifier: "gotoProductListVC", sender: self.targetController)

                  default:
                      break
                  }
            }else{
                var level = self.targetController?.homeVm.homeFreqCategoryResponse.data?[indexPath.row].category_level ?? ""
                switch level {
                case "1":
                    //
                    self.targetController?.catIdToGo = self.targetController?.homeVm.homeFreqCategoryResponse.data?[indexPath.row].id
                    self.targetController?.performSegue(withIdentifier: "gotoDetailCat", sender: self.targetController)
                 case "3":
                    self.targetController?.selectedLevel3Cat = self.targetController?.homeVm.homeFreqCategoryResponse.data?[indexPath.row].id
                    self.targetController?.titleToGo = self.targetController?.homeVm.homeFreqCategoryResponse.data?[indexPath.row].name ?? ""
                    self.targetController?.performSegue(withIdentifier: "gotoProductListVC", sender: self.targetController)

                default:
                    break
                }
            }
        }
        
        //joiningCampaign
    //    @objc func joinCampaign(button:UIButton){
    //        button.isEnabled = false
    //        let indexPath = IndexPath(row: button.tag, section: 0)
    //        let cell = self.campaignsTableView.cellForRow(at: indexPath) as? campaignTableViewCell
    //        cell?.joinBtn.setTitle("", for: .normal)
    //        cell?.joinActivityIndicator.isHidden = false
    //        cell?.joinActivityIndicator.startAnimating()
    //        self.campaignsViewModel.joinCampaign(atIndex: button.tag, onSuccess: { (success) in
    //            cell?.joinActivityIndicator.isHidden = true
    //            cell?.joinActivityIndicator.stopAnimating()
    //            if success{
    //                self.campaignsViewModel.runningCampaignsResponse.data?[button.tag].isJoined = true
    //                self.campaignsTableView.reloadRows(at: [indexPath], with: .none)
    //                self.indexSelected = indexPath.row
    //                self.performSegue(withIdentifier: "gotoDetailCampaign", sender: self)
    //
    //            }else{
    //                button.isEnabled = true
    //                cell?.joinBtn.setTitle("Join", for: .normal)
    //                ErrorHandler.sharedInstance().handleUIViewControllerError(errMsg: nil, viewController: self)
    //
    //            }
    //        }, onFailure: { (errMsg) in
    //            button.isEnabled = true
    //            cell?.joinActivityIndicator.isHidden = true
    //            cell?.joinActivityIndicator.stopAnimating()
    //            cell?.joinBtn.setTitle("Join", for: .normal)
    //            ErrorHandler.sharedInstance().handleUIViewControllerError(errMsg: errMsg, viewController: self)
    //        })
            
     //   }
        
        
     
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0.0
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0.0
        }
        
        
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            if self.type == "f"{
                return CGSize(width: (  (collectionView.frame.width ?? 0.0)  / 3.25), height: collectionView.frame.height)
            }else{
                return CGSize(width: (  (collectionView.frame.width ?? 0.0)  / 2.5), height: collectionView.frame.height)
            }

        }
        
}
