//
//  infoProfileViewModel.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/10/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class infoProfileViewModel: NSObject {
    

    @IBOutlet weak var infoprofileC: infoProfileClient!
    var userDef = UserDefaults.standard
    
    var userProfile = user()
    
    func getUserProfile( onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        var headersDic : [String: String] = [:]
        headersDic["Authorization"] = "Token \(self.userDef.string(forKey: "token") ?? "")"
        
        self.infoprofileC.requestProfileInfo(url: baseUrl+profileUrl, apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, headers: headersDic, completionSuccess: { (responseSuccess) in
            //
            if let id = responseSuccess["id"].int{
                print(id)
                self.userProfile.id = id
                self.userDef.set(id, forKey: "id")
            }
            
            if let firstname = responseSuccess["firstname"].string{
                self.userProfile.firstname = firstname
            }
            
            if let lastname = responseSuccess["lastname"].string{
                self.userProfile.lastname = lastname
            }
            
            if let email = responseSuccess["email"].string{
                self.userProfile.email = email
            }
            
            if let phone_number = responseSuccess["phone_number"].string{
                self.userProfile.phone_number = phone_number
            }
            
            if let facebook_id = responseSuccess["facebook_id"].string{
                self.userProfile.facebook_id = facebook_id
            }

            if let profile_picture = responseSuccess["profile_picture"].string{
                self.userProfile.profile_picture = profile_picture
            }

            if let referred_by = responseSuccess["referred_by"].string{
                self.userProfile.referred_by = referred_by
            }
            
            if let works_from = responseSuccess["works_from"].string{
                self.userProfile.works_from = works_from
            }
            
            if let works_to = responseSuccess["works_to"].string{
                self.userProfile.works_to = works_to
            }
            
            onSuccess(true)

        }) { (responseFailure) in
            //
        }
       

    }
}
