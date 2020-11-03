//
//  SparePartCategoryTableViewCell.swift
//  yourparts
//
//  Created by iMac1 on 8/13/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class SparePartCategoryTableViewCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var partsCollectionView: UICollectionView!
    @IBOutlet weak var collectionTitle: UILabel!
    
    //MARK:- Variables
    var collectionDataSourceDelegate : spartsCollectionDelegate?
    var row: Int?
    
    //MARK:- Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionTitle.font = UIFont(name: "Cairo-SemiBold", size: 14)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        let nib1 = UINib.init(nibName: String(describing: seeMoreCollectionViewCell.self), bundle: nil)
        partsCollectionView.register(nib1, forCellWithReuseIdentifier: "seeMoreCollection")
        let nib2 = UINib.init(nibName: String(describing: productCollectionViewCell.self), bundle: nil)
        partsCollectionView.register(nib2, forCellWithReuseIdentifier: "productCollection")
    }
    
}

//MARK:- SpareParts TableViewCell Extension
extension SparePartCategoryTableViewCell{
    
    func setCollectionViewDataSourceDelegate(_ dataSourceDelegate: spartsCollectionDelegate , forRow row:Int ){
        self.collectionDataSourceDelegate = dataSourceDelegate
        self.row = row
        partsCollectionView.delegate = self.collectionDataSourceDelegate
        partsCollectionView.dataSource = self.collectionDataSourceDelegate
        partsCollectionView.reloadData()
    }
    
}

