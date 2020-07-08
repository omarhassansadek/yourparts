//
//  profileViewModel.swift
//  yourparts
//
//  Created by iMac1 on 6/26/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class profileViewModel: NSObject {

    
    var profileListArr : [profileMenu] = []
    
    
    func populateArr(){
        let obj1 = profileMenu(img: "profileico1", mTitle: "Main Information", sTitle: "Edit your profile")
        self.profileListArr.append(obj1)
        
        let obj2 = profileMenu(img: "profileico2", mTitle: "Favourite Cars" , sTitle: "Add car now")
        self.profileListArr.append(obj2)

        let obj3 = profileMenu(img: "profileico3", mTitle: "Your Addresses", sTitle: "Add address now")
        self.profileListArr.append(obj3)

        let obj4 = profileMenu(img: "profileico4", mTitle: "Favourite", sTitle: "x items in favourite")
        self.profileListArr.append(obj4)

        let obj5 = profileMenu(img: "profileico5", mTitle: "Cart", sTitle: "Add items to cart")
        self.profileListArr.append(obj5)

        let obj6 = profileMenu(img: "profileico5", mTitle: "Requested items", sTitle: "Check your requested items")
        self.profileListArr.append(obj6)

        
    }
}
