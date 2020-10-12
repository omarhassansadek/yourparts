//
//  frequentCollectionViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/28/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class frequentCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var topConstraintView: NSLayoutConstraint!
    @IBOutlet weak var imgBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var imgTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imgLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imgTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var roundView: UIView!
    @IBOutlet weak var catLbl: UILabel!
    @IBOutlet weak var catImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.roundView.layer.cornerRadius = 17.5
        self.catLbl.font = UIFont(name: "Cairo-Bold", size: 12)

    }

}
