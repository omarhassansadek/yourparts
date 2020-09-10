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
        
        
        self.loginC.requestLoginUser(url: loginUrl, apiMethod: .post, parametersOfCall: apiParameters, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            //
            print(responseSuccess)
            
            if let key = responseSuccess["key"].string{
                print(key)
                self.usrDef.set(key, forKey: "token")
                onSuccess(true)
            }
        }) { (responseFailure) in
            //
            print(responseFailure)
            
            onFailure("Unable to log in with provided credentials")
            
        }
        
    }
}
