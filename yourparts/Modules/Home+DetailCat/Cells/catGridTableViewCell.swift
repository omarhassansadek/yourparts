//
//  catGridTableViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 10/1/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class catGridTableViewCell: UITableViewCell {

    @IBOutlet weak var catCollection: UICollectionView!
    
    
    var catCollectionDataSourceDelegate : catCollectionDelegate?
    
    var row: Int?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
        let nib1 = UINib.init(nibName: String(describing: catGridCollectionViewCell.self), bundle: nil)
        catCollection.register(nib1, forCellWithReuseIdentifier: "catCell")

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension catGridTableViewCell{

    func setCollectionViewDataSourceDelegate(_ dataSourceDelegate: catCollectionDelegate , forRow row:Int ){
        self.catCollectionDataSourceDelegate = dataSourceDelegate
        self.row = row
        catCollection.delegate = self.catCollectionDataSourceDelegate
        catCollection.dataSource = self.catCollectionDataSourceDelegate
        catCollection.reloadData()
    }

}

