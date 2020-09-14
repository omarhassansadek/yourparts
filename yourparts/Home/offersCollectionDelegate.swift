//
//  ImagesCollectionDelegate.swift
//  phLog
//
//  Created by Omar Taha on 2/6/19.
//  Copyright © 2019 Softmills. All rights reserved.
//

import Foundation
import UIKit

class offersCollectionDelegate : NSObject ,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
//    var campaingsArr = [Campaign]()
//    var photosArray = [Photo]()
//    var profilesArray = [Photographer]()
    var targetController : newHomeViewController?
    var row: Int?
    var type: String?
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        

            let cellCollection = collectionView.dequeueReusableCell(withReuseIdentifier: "offerSlider", for: indexPath) as! homeSliderCollectionViewCell
            
            cellCollection.roundView.backgroundColor = UIColor.white
            cellCollection.offerimg.image = UIImage(named:"offerSample")
            
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
        return 15.0
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (  (collectionView.frame.width ?? 0.0)  - 50.0 ), height: collectionView.frame.height)

    }
    
   
    
}
