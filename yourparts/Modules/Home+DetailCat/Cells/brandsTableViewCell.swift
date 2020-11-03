//
//  brandsTableViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/28/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class brandsTableViewCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var brandCollectionView: UICollectionView!
    @IBOutlet weak var titleLbl: UILabel!
    
    //MARK:- Variables
    var collectionDataSourceDelegate : brandsCollectionDelegate?
    var row: Int?
    
    //MARK:- Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.titleLbl.font = UIFont(name: "Cairo-Bold", size: 18)
        let nib1 = UINib.init(nibName: String(describing: brandimgCollectionViewCell.self), bundle: nil)
        brandCollectionView.register(nib1, forCellWithReuseIdentifier: "brandCollectionCell")
        
    }
    
}

//MARK:- Brands TableView Cell Extension
extension brandsTableViewCell{
    
    func setCollectionViewDataSourceDelegate(_ dataSourceDelegate: brandsCollectionDelegate , forRow row:Int ){
        self.collectionDataSourceDelegate = dataSourceDelegate
        self.row = row
        brandCollectionView.delegate = self.collectionDataSourceDelegate
        brandCollectionView.dataSource = self.collectionDataSourceDelegate
        brandCollectionView.reloadData()
    }
    
}
