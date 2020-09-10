//
//  signupClient.swift
//  yourparts
//
//  Created by iMac1 on 8/19/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class signupClient: ParentClient {
    
    func requestRegisterUser(url: String, apiMethod: HTTPMethod, parametersOfCall: [String: Any]? , apiEncoding: ParameterEncoding , completionSuccess: @escaping (JSON) -> Void , completionFailure: @escaping (JSON) -> Void ){
        
      
        self.communicateWithApi(url: url, pagingUrl: nil, method: .post, parameters: parametersOfCall, headers: nil, onSuccess: { (responseSuccess) in
            //
            completionSuccess(responseSuccess)
        }) { (responseFailure) in
            //
            completionFailure(responseFailure)
        }
    }
    
    
}
