//
//  loginClient.swift
//  yourparts
//
//  Created by iMac1 on 9/4/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class loginClient: ParentClient {
    
    func requestLoginUser(url: String, apiMethod: HTTPMethod, parametersOfCall: [String: Any]? , apiEncoding: ParameterEncoding , completionSuccess: @escaping (JSON) -> Void , completionFailure: @escaping (JSON) -> Void ){
        
        
        self.communicateWithApi(url: url, pagingUrl: nil, method: .post, parameters: parametersOfCall, onSuccess: { (responseSuccess) in
            //
            completionSuccess(responseSuccess)
        }) { (responseFailure) in
            //
            completionFailure(responseFailure)
        }
    }
}
