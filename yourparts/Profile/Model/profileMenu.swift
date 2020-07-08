//
//  profileMenu.swift
//  yourparts
//
//  Created by iMac1 on 6/26/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import Foundation

class profileMenu{
    
    var image: String?
    var mainTitle: String?
    var secondaryTitle: String?
    
    init( img: String, mTitle: String, sTitle: String){
        self.image = img
        self.mainTitle = mTitle
        self.secondaryTitle = sTitle
    }
}
