
//
//  signupViewModel.swift
//  yourparts
//
//  Created by iMac1 on 8/19/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class signupViewModel: NSObject {

    @IBOutlet weak var signupC: signupClient!

    var userDef = UserDefaults.standard
    
    func registerUser(apiParameters: [String:String], onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        self.signupC.requestRegisterUser(url: baseUrl+signupUrl, apiMethod: .post, parametersOfCall: apiParameters, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            //
            
            if let token = responseSuccess["token"].string{
                self.userDef.set(token, forKey: "authToken")
            }
            
            if let userId = responseSuccess["user"]["id"].int{
                self.userDef.set(userId, forKey: "userid")
            }
            
            onSuccess(true)
            
        }) { (resposneFailure) in
            //
            onFailure("We encountered error. Try agian later")

        }
       

    }
}
