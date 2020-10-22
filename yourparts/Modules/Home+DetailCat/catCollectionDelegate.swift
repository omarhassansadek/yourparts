//
//  catCollectionDelegate.swift
//  yourparts
//
//  Created by Yourparts #1 on 10/1/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import Foundation
import UIKit

class catCollectionDelegate: NSObject ,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var targetController : newHomeViewController?
    var row: Int?
    var type: String?

    //var brands1Arr = ["brand1" , "brand2" , "brand3" , "brand4"]
    
    //var brands2Arr = ["brand5" , "brand6" , "brand7" , "brand8"]

        func numberOfSections(in collectionView: UICollectionView) -> Int {
              return 1
         }
          
         func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return self.targetController?.homeVm.categoriesArr.count ?? 0
          }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            

                let cellCollection = collectionView.dequeueReusableCell(withReuseIdentifier: "catCell", for: indexPath) as! catGridCollectionViewCell
            
                    cellCollection.catimage.contentMode = .center
                    cellCollection.catimage.clipsToBounds = true
            
            cellCollection.catimage.image = UIImage(named: self.targetController?.homeVm.categoriesArr[indexPath.row].image ?? "")
//                    cellCollection.catimage.sd_setImage(with: URL(string: self.targetController?.homeVm.categoriesArr[indexPath.row].image ?? "") , placeholderImage: nil, completed: { (image, error, cacheType, url) -> Void in
//                        if ((error) != nil) {
//                            // set the placeholder image here
//                            cellCollection.catimage.image = UIImage(named: "cat1")
//                        } else {
//                            // success ... use the image
//                        }
//                    })
            
                    cellCollection.catLbl.text = self.targetController?.homeVm.categoriesArr[indexPath.row].name ?? ""
           
                    //cellCollection.layoutIfNeeded()
            

                    return cellCollection

        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            //if indexPath.row == 5{
            //}
            //if indexPath.row != 13 && indexPath.row != 12{
            self.targetController?.catIdToGo = self.targetController?.homeVm.categoriesArr[indexPath.row].id
                           
             if self.targetController?.catIdToGo == 85{
                self.targetController?.performSegue(withIdentifier: "gotoTires", sender: self)
             }else{
                self.targetController?.performSegue(withIdentifier: "gotoDetailCat", sender: self)
            }
            
        }
 
        
     
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0.0
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0.0
        }
        
        
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            if self.type == "f"{
            return CGSize(width: (  ( (collectionView.frame.width / 2.0) ?? 0.0) ), height: (collectionView.frame.width / 2.0) * 0.55 )
//            }else{
//                return CGSize(width: (  (collectionView.frame.width ?? 0.0)  / 2.9), height: collectionView.frame.height)
//            }

        }
        
        func ResizeImage(with image: UIImage, scaledToFill newSize: CGSize) -> UIImage? {
            var ratio: CGFloat = 0
            var delta: CGFloat = 0
            var drawRect = CGRect()

            if newSize.width > newSize.height {

                ratio = newSize.width / image.size.width
                delta = (ratio * image.size.height) - newSize.height
                drawRect = CGRect(x: 0, y: -delta / 2, width: newSize.width, height: newSize.height + delta)

            } else {

                ratio = newSize.height / image.size.height
                delta = (ratio * image.size.width) - newSize.width
                drawRect = CGRect(x: -delta / 2, y: 0, width: newSize.width + delta, height: newSize.height)

            }

            UIGraphicsBeginImageContextWithOptions(newSize, true, 0.0)
            image.draw(in: drawRect)
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            return newImage

        }


}
