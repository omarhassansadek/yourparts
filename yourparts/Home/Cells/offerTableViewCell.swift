//
//  offerTableViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/14/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class offerTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionTitle: UILabel!
    @IBOutlet weak var offerCollectionView: UICollectionView!
    var collectionDataSourceDelegate : offersCollectionDelegate?

    var row: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.collectionTitle.text = "Offers Today".localized
        self.collectionTitle.font = UIFont(name: "Cairo-Bold", size: 16)

        let nib1 = UINib.init(nibName: String(describing: homeSliderCollectionViewCell.self), bundle: nil)
        offerCollectionView.register(nib1, forCellWithReuseIdentifier: "offerSlider")
        
        self.contentView.clipsToBounds = true
        self.contentView.layer.cornerRadius = 15.0
        self.contentView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]


    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension offerTableViewCell{

    func setCollectionViewDataSourceDelegate(_ dataSourceDelegate: offersCollectionDelegate , forRow row:Int ){
        self.collectionDataSourceDelegate = dataSourceDelegate
        self.row = row
        offerCollectionView.delegate = self.collectionDataSourceDelegate
        offerCollectionView.dataSource = self.collectionDataSourceDelegate
        offerCollectionView.reloadData()
    }

}

