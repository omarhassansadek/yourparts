
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

    func registerUser(apiParameters: [String:String], onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        self.signupC.requestRegisterUser(url: signupUrl, apiMethod: .post, parametersOfCall: apiParameters, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            //
            
            onSuccess(true)
            
        }) { (resposneFailure) in
            //
        }
       

    }
}
