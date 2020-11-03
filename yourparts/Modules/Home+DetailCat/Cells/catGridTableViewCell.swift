//
//  catGridTableViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 10/1/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class catGridTableViewCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var catCollection: UICollectionView!
    
    //MARK:- Variables
    var catCollectionDataSourceDelegate : catCollectionDelegate?
    var row: Int?
    
    //MARK:- Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let nib1 = UINib.init(nibName: String(describing: catGridCollectionViewCell.self), bundle: nil)
        catCollection.register(nib1, forCellWithReuseIdentifier: "catCell")
        
    }
    
}

//MARK:- Grid Category TableView Cell Extension
extension catGridTableViewCell{
    
    func setCollectionViewDataSourceDelegate(_ dataSourceDelegate: catCollectionDelegate , forRow row:Int ){
        self.catCollectionDataSourceDelegate = dataSourceDelegate
        self.row = row
        catCollection.delegate = self.catCollectionDataSourceDelegate
        catCollection.dataSource = self.catCollectionDataSourceDelegate
        catCollection.reloadData()
    }
    
}

