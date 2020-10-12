//
//  installmentsViewController.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/21/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class installmentsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var brandsCollectionView: UICollectionView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        brandsCollectionView.delegate = self
        brandsCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cellCollection = collectionView.dequeueReusableCell(withReuseIdentifier: "offerSlider", for: indexPath) as! homeSliderCollectionViewCell
            
            //cellCollection.roundView.backgroundColor = UIColor.white
            cellCollection.offerimg.image = UIImage(named:"brand")
            
            return cellCollection
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
          return 0.0
      }
      
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
          return 15.0
      }
      
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100.0 , height: 50.0)

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
