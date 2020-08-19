//
//  userReviewCollectionViewCell.swift
//  yourparts
//
//  Created by iMac1 on 8/6/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class userReviewCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var userReview: UITextView!
    @IBOutlet weak var userName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.userName.font = UIFont(name: "Cairo-SemiBold", size: 12)
        
        self.userReview.font = UIFont(name: "Cairo-Regular", size: 12)

    }

}
