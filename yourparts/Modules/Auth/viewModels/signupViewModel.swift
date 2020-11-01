
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
import FBSDKLoginKit

class signupViewModel: NSObject {
    
    //MARK:- Outlets
    @IBOutlet weak var signupC: signupClient!
    
    //MARK:- Variables
    var userDef = UserDefaults.standard
    
    //MARK:- Methods
    func registerUser(apiParameters: [String:String], onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        self.signupC.requestRegisterUser(url: baseUrl+signupUrl, apiMethod: .post, parametersOfCall: apiParameters, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            //
            if let key = responseSuccess["token"].string{
                
                print(key)
                
                self.userDef.set(key, forKey: "authToken")
                
                if let userId = responseSuccess["user"]["pk"].int{
                    self.userDef.set(userId, forKey: "userid")
                }
                
                if let userEmail = responseSuccess["user"]["email"].string{
                    self.userDef.set(userEmail, forKey: "useremail")
                }
                
                
                if let userName = responseSuccess["user"]["username"].string{
                    self.userDef.set(userName , forKey: "username")
                }
                
                self.logCompleteRegistrationEvent(registrationMethod: "iOS App Registeration")
                onSuccess(true)
                
            }
            
        }) { (resposneFailure) in
            //
            onFailure("We encountered error. Try agian later")
            
        }
        
        
    }
    
    
    func logCompleteRegistrationEvent(registrationMethod: String) {
        let parameters = [
            AppEvents.ParameterName.registrationMethod.rawValue: registrationMethod
        ]
        
        AppEvents.logEvent(.completedRegistration, parameters: parameters)
    }
    
}
