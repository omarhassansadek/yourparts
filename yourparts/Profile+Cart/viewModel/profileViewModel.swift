//
//  profileViewModel.swift
//  yourparts
//
//  Created by iMac1 on 6/26/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class profileViewModel: NSObject {

    
    var profileListArr : [profileMenu] = []
    
    @IBOutlet weak var profileC: profileClient!
    
    func populateArr(){
        let obj1 = profileMenu(img: "profileico1", mTitle: "Main Information".localized, sTitle: "")
        self.profileListArr.append(obj1)
        
        let obj2 = profileMenu(img: "profileico2", mTitle: "Favourite Cars".localized , sTitle: "")
        self.profileListArr.append(obj2)

        let obj3 = profileMenu(img: "profileico3", mTitle: "Past Orders".localized, sTitle: "")
        self.profileListArr.append(obj3)

        let obj4 = profileMenu(img: "profileico4", mTitle: "Current Orders".localized, sTitle: "")
        self.profileListArr.append(obj4)

        let obj5 = profileMenu(img: "profileico5", mTitle: "Your Addresses".localized, sTitle: "")
        self.profileListArr.append(obj5)
    }
    
    
    func getUserProfile(onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
           var userId = UserDefaults.standard.integer(forKey: "userid")
           
           self.profileC.getProfileData(url: baseUrl+profileUrl+"\(userId)", apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, headers: nil, completionSuccess: { (responseJSON) in
               //
               
               print(responseJSON)
            
            
               
//               addressParser().parseAddresses(fromJSON: responseJSON) { (arrAddresses) in
//                   self.addressArr = arrAddresses
//
//                   onSuccess(true)
//               }

           }) { (responseFailure) in
               //
               
               print(responseFailure)

           }
       }
}
