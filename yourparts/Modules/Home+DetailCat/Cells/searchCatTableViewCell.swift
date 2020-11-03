//
//  searchCatTableViewCell.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/14/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class searchCatTableViewCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var catName: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var backView: UIView!
    
    //MARK:- Variables
    var goBack : (() -> Void)? = nil
    
    //MARK:- Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.clipsToBounds = true
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        backView.transform = CGAffineTransform(scaleX: -1, y: 1)
        catName.font = UIFont(name: "Cairo-Bold", size: 15)
        
        if #available(iOS 13.0, *) {
            searchBar.searchTextField.placeholder = "Search with part name".localized
            searchBar.searchTextField.font = UIFont(name: "Cairo-SemiBold", size: 11)
        }else{}
        
    }
    
    //MARK:- Actions
    @IBAction func goBackClicked(_ sender: Any) {
        if let addAddressClicked = self.goBack{
            addAddressClicked()
        }
    }
    
}
