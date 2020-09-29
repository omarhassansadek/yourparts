//
//  frequentlyNeededTableViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/28/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class frequentlyNeededTableViewCell: UITableViewCell {

    @IBOutlet weak var frequentlyCollectionView: UICollectionView!
    @IBOutlet weak var frequentlyNeededLbl: UILabel!
    
    var collectionDataSourceDelegate : frequentlyCollectionDelegate?

    var row: Int?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.frequentlyNeededLbl.text = "Frequently Needed".localized
        self.frequentlyNeededLbl.font = UIFont(name: "Cairo-Bold", size: 18)

        let nib1 = UINib.init(nibName: String(describing: frequentCollectionViewCell.self), bundle: nil)
        frequentlyCollectionView.register(nib1, forCellWithReuseIdentifier: "frequentCell")

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension frequentlyNeededTableViewCell{

    func setCollectionViewDataSourceDelegate(_ dataSourceDelegate: frequentlyCollectionDelegate , forRow row:Int ){
        self.collectionDataSourceDelegate = dataSourceDelegate
        self.row = row
        frequentlyCollectionView.delegate = self.collectionDataSourceDelegate
        frequentlyCollectionView.dataSource = self.collectionDataSourceDelegate
        frequentlyCollectionView.reloadData()
    }

}

