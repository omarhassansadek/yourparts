//
//  brandsCollectionDelegate.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/28/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class brandsCollectionDelegate: NSObject ,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var targetController : newHomeViewController?
    var row: Int?
    var type: String?
    
    var brands1Arr = ["brand1" , "brand2" , "brand3" , "brand4"]
    
    var brands2Arr = ["brand5" , "brand6" , "brand7" , "brand8"]
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.brands1Arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        
        let cellCollection = collectionView.dequeueReusableCell(withReuseIdentifier: "brandCollectionCell", for: indexPath) as! brandimgCollectionViewCell
        
        //cellCollection.roundView.backgroundColor = UIColor.white
        //cellCollection.offerimg.image = UIImage(named:"offerSample")
        
        if type == "f"{
            
            cellCollection.brandimg.image = UIImage(named: brands1Arr[indexPath.row])
            
        }else{
            
            cellCollection.brandimg.image = UIImage(named: brands2Arr[indexPath.row])
            
        }
        
        return cellCollection
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 5{
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
        return CGSize(width: (  (collectionView.frame.width ?? 0.0)  / 3.5), height: collectionView.frame.height)
        
    }
    
}
