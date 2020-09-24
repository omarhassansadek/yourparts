//
//  loginViewModel.swift
//  yourparts
//
//  Created by iMac1 on 9/4/20.
//  Copyright © 2020 yourparts. All rights reserved.
//


import UIKit
import Alamofire
import SwiftyJSON

class loginViewModel: NSObject {
    
    @IBOutlet weak var loginC: loginClient!
    
    var usrDef = UserDefaults.standard
    
    func loginUsr(apiParameters: [String:String], onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        
        
        self.loginC.requestLoginUser(url: baseUrl+loginUrl, apiMethod: .post, parametersOfCall: apiParameters, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            //
            print(responseSuccess)
            
            if let key = responseSuccess["token"].string{
    
                print(key)
                
                self.usrDef.set(key, forKey: "authToken")
                
                if let userId = responseSuccess["user"]["id"].int{
                    self.usrDef.set(userId, forKey: "userid")
                }

                if let userEmail = responseSuccess["user"]["email"].string{
                    self.usrDef.set(userEmail, forKey: "useremail")
                }

                
                if let firstName = responseSuccess["user"]["first_name"].string{
                    if let lastName = responseSuccess["user"]["last_name"].string{
                        self.usrDef.set(firstName + " " + lastName , forKey: "username")
                    }
                }


    
                onSuccess(true)
                
            }
        }) { (responseFailure) in
            //
            print(responseFailure)
            
            onFailure("We encountered error. Try agian later")
            
        }
        
    }
}
