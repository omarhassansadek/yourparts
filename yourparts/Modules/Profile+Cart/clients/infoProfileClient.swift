//
//  infoProfileClient.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/10/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class infoProfileClient: ParentClient {
    

    func requestProfileInfo(url: String, apiMethod: HTTPMethod, parametersOfCall: [String: Any]? , apiEncoding: ParameterEncoding, headers: [String: String]? , completionSuccess: @escaping (JSON) -> Void , completionFailure: @escaping (JSON) -> Void ){
        
        var profileHeaders = ["Authorization" : "JWT \(UserDefaults.standard.string(forKey: "authToken")!)"]

        
        self.communicateWithApiSetHeaders(url: url, method: apiMethod, parameters: parametersOfCall, headers: profileHeaders, onSuccess: { (responseSuccess) in
            //
            
            
        }) { (responseFailure) in
            //
        }
        
        
        self.communicateWithApi(url: url, pagingUrl: nil, method: apiMethod, parameters: parametersOfCall, headers: headers, onSuccess: { (responseSuccess) in
            //
            completionSuccess(responseSuccess)
        }) { (responseFailure) in
            //
            completionFailure(responseFailure)
        }
    }
}
