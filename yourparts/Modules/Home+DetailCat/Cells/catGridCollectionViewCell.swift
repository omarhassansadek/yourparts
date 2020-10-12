//
//  catGridCollectionViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 10/1/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class catGridCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var catView: UIView!
    @IBOutlet weak var catLbl: UILabel!
    @IBOutlet weak var catimage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.catimage.layer.cornerRadius = 15.0
        self.catView.layer.cornerRadius = 15.0
        
        self.catLbl.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.catLbl.numberOfLines = 0

        
        self.catLbl.font = UIFont(name: "Cairo-Bold", size: 17.0)
    }
   

}


