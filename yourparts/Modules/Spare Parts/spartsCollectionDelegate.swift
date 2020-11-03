//
//  ImagesCollectionDelegate.swift
//  phLog
//
//  Created by Omar Taha on 2/6/19.
//  Copyright © 2019 Softmills. All rights reserved.
//

import Foundation
import UIKit

class spartsCollectionDelegate : NSObject ,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    //MARK:- Variables
    var targetController : newHomeViewController?
    var row: Int?
    var type: String?
    
    //MARK:- CollectionView Delegates
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellCollection = collectionView.dequeueReusableCell(withReuseIdentifier: "productCollection", for: indexPath) as! productCollectionViewCell
        cellCollection.productimg.image = UIImage(named:"teelFramel")
        
        return cellCollection
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 5{
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print((self.targetController?.view.frame.width ?? 0.0)  - 50.0)
        return CGSize(width: (  (self.targetController?.view.frame.width ?? 0.0)  - 50.0 ), height: collectionView.frame.height )
    }
    
}
