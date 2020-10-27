//
//  profileClient.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/29/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class profileClient: ParentClient {
    
    
    func getProfileData(url: String, apiMethod: HTTPMethod, parametersOfCall: [String: Any]? , apiEncoding: ParameterEncoding, headers: [String: String]? , completionSuccess: @escaping (JSON) -> Void , completionFailure: @escaping (JSON) -> Void ){
        var billingHeaders : [String: String] = [:]
        print("HEADER IS NOT EMPTY: \(UserDefaults.standard.string(forKey: "authToken"))")
        if (UserDefaults.standard.string(forKey: "authToken") != nil) {
            print("HEADER PASSED")
            billingHeaders = ["Authorization" : "JWT \(UserDefaults.standard.string(forKey: "authToken")!)"]
        }
        
//        let billingHeaders: [String: String] = ["Authorization" : "JWT \(UserDefaults.standard.string(forKey: "authToken") ?? "")"]


        print("HEADERS: \(billingHeaders)")
        
        self.communicateWithApi(url: url, pagingUrl: nil, method: apiMethod, parameters: parametersOfCall, headers: billingHeaders, onSuccess: { (responseSuccess) in
            //
            
            completionSuccess(responseSuccess)

        }) { (responseFailure) in
            //
        }
        
//        self.communicateWithApi(url: url, pagingUrl: nil, method: apiMethod, parameters: parametersOfCall, headers: billingHeaders, onSuccess: { (responseSuccess) in
//            print("SUCCESS: \(responseSuccess)")
//            completionSuccess(responseSuccess)
//        }) { (responseFailure) in
//            //
//            completionFailure(responseFailure)
//        }

        
    }
}
