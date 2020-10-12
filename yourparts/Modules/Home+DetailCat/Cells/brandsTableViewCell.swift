//
//  brandsTableViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/28/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class brandsTableViewCell: UITableViewCell {

    @IBOutlet weak var brandCollectionView: UICollectionView!
    @IBOutlet weak var titleLbl: UILabel!
    
    
    var collectionDataSourceDelegate : brandsCollectionDelegate?

    var row: Int?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.titleLbl.font = UIFont(name: "Cairo-Bold", size: 18)

        let nib1 = UINib.init(nibName: String(describing: brandimgCollectionViewCell.self), bundle: nil)
        brandCollectionView.register(nib1, forCellWithReuseIdentifier: "brandCollectionCell")

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension brandsTableViewCell{

    func setCollectionViewDataSourceDelegate(_ dataSourceDelegate: brandsCollectionDelegate , forRow row:Int ){
        self.collectionDataSourceDelegate = dataSourceDelegate
        self.row = row
        brandCollectionView.delegate = self.collectionDataSourceDelegate
        brandCollectionView.dataSource = self.collectionDataSourceDelegate
        brandCollectionView.reloadData()
    }

}
