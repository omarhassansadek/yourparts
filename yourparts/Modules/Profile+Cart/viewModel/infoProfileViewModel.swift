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
    
    func getUserProfile(apiMethod: HTTPMethod, parameter: [String: Any]?, onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        
        var headersDic : [String: String] = [:]
        headersDic["Authorization"] = "JWT \(self.userDef.string(forKey: "authToken") ?? "")"
        
        var id = ""
        
        if let userId = UserDefaults.standard.string(forKey: "userid"){
            id = userId
        }
        
        self.infoprofileC.requestProfileInfo(url: baseUrl+profileUrl+"\(id)/", apiMethod: apiMethod, parametersOfCall: parameter, apiEncoding: JSONEncoding.default, headers: headersDic, completionSuccess: { (responseSuccess) in
            //
            if let id = responseSuccess["id"].int{
                print(id)
                self.userProfile.id = id
                self.userDef.set(id, forKey: "id")
            }
            
            if let firstname = responseSuccess["firstname"].string{
                UserDefaults.standard.set(firstname, forKey: "username")
                self.userProfile.firstname = firstname
            }
            
            if let lastname = responseSuccess["lastname"].string{
                self.userProfile.lastname = lastname
            }
            
            if let email = responseSuccess["email"].string{
                UserDefaults.standard.set(email, forKey: "useremail")
                self.userProfile.email = email
            }
            
            if let phone_number = responseSuccess["phone_number"].string{
                self.userProfile.phone_number = phone_number
            }
            
            if let facebook_id = responseSuccess["facebook_id"].int{
                self.userProfile.facebook_id = facebook_id
            }

            if let profile_picture = responseSuccess["profile_picture"].string{
                self.userProfile.profile_picture = profile_picture
            }

            if let referred_by = responseSuccess["referred_by"].string{
                self.userProfile.referred_by = referred_by
            }
            
            if let works_from = responseSuccess["works_from"].string{
                //self.userProfile.works_from = works_from
            }
            
            if let works_to = responseSuccess["works_to"].string{
                //self.userProfile.works_to = works_to
            }
            
            onSuccess(true)

        }) { (responseFailure) in
            //
        }
       

    }
}
