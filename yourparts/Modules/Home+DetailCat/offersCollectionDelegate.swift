//
//  ImagesCollectionDelegate.swift
//  phLog
//
//  Created by Omar Taha on 2/6/19.
//  Copyright © 2019 Softmills. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class offersCollectionDelegate : NSObject ,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK:- Variables
    var targetController : newHomeViewController?
    var row: Int?
    var type: String?
    var offersArr: [offer]?
    
    //MARK:- CollectionView Delegates
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.offersArr?.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellCollection = collectionView.dequeueReusableCell(withReuseIdentifier: "offerSlider", for: indexPath) as! homeSliderCollectionViewCell
        
        cellCollection.roundView.backgroundColor = UIColor.white
        cellCollection.offerimg.sd_setImage(with: URL(string: self.offersArr?[indexPath.row].image ?? "") , placeholderImage: nil, completed: { (image, error, cacheType, url) -> Void in
            if ((error) != nil) {
                cellCollection.offerimg.image = UIImage(named: "offer2")
            } else {
            }
        })
        
        return cellCollection
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.offersArr?[indexPath.row].offer_type == "1"{
            if self.offersArr?[indexPath.row].categories_included?.count ?? 0 > 0{
                var selectedLevel3Id = self.offersArr?[indexPath.row].categories_included?[0] ?? Int()
                self.targetController?.selectedLevel3Cat = selectedLevel3Id
                self.targetController?.titleToGo = "Offers Today".localized
                self.targetController?.pathToGo = baseUrl+catLevel3Url+"\(selectedLevel3Id)"
                self.targetController?.performSegue(withIdentifier: "gotoProductListVC", sender: self.targetController)
            }
        }else{
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (  (collectionView.frame.width ?? 0.0)  - 50.0 ), height: collectionView.frame.height)
        
    }
    
}
