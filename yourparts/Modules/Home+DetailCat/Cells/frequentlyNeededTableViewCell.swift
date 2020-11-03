//
//  frequentlyNeededTableViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/28/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class frequentlyNeededTableViewCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var frequentlyCollectionView: UICollectionView!
    @IBOutlet weak var frequentlyNeededLbl: UILabel!
    
    //MARK:- Variables
    var collectionDataSourceDelegate : frequentlyCollectionDelegate?
    var row: Int?
    
    //MARK:- Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.frequentlyNeededLbl.text = "Frequently Needed".localized
        self.frequentlyNeededLbl.font = UIFont(name: "Cairo-Bold", size: 18)
        let nib1 = UINib.init(nibName: String(describing: frequentCollectionViewCell.self), bundle: nil)
        frequentlyCollectionView.register(nib1, forCellWithReuseIdentifier: "frequentCell")
    }
    
}

//MARK:- Frequently Needed TableView Cell Extension
extension frequentlyNeededTableViewCell{
    
    func setCollectionViewDataSourceDelegate(_ dataSourceDelegate: frequentlyCollectionDelegate , forRow row:Int ){
        self.collectionDataSourceDelegate = dataSourceDelegate
        self.row = row
        frequentlyCollectionView.delegate = self.collectionDataSourceDelegate
        frequentlyCollectionView.dataSource = self.collectionDataSourceDelegate
        frequentlyCollectionView.reloadData()
    }
    
}

