//
//  detailCatClient.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/15/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class detailCatClient: ParentClient {
    
    func requestDetailCat(url: String, apiMethod: HTTPMethod, parametersOfCall: [String: Any]? , apiEncoding: ParameterEncoding , completionSuccess: @escaping (JSON) -> Void , completionFailure: @escaping (JSON) -> Void ){
        
        var productHeaders: [String: String] = [:]
        let isLogged = UserDefaults.standard.bool(forKey: "isLogged")
        
        if isLogged{
            print(UserDefaults.standard.string(forKey: "authToken") ?? "")
            productHeaders = ["Authorization" : "JWT \(UserDefaults.standard.string(forKey: "authToken") ?? "")"]
        }
        
        self.communicateWithApi(url: url, pagingUrl: nil, method: .get, parameters: parametersOfCall, headers: productHeaders, onSuccess: { (responseSuccess) in
            completionSuccess(responseSuccess)
        }) { (responseFailure) in
            completionFailure(responseFailure)
        }
    }
    
}
