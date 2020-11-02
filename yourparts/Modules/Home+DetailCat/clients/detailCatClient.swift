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
//        /let detailCatHeaders: [String: String] = ["Authorization" : "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozNjk5LCJ1c2VybmFtZSI6ImlicmFoaW0uYWJkZWxheml6MTAwMEBnbWFpbC5jb20iLCJleHAiOjE2Mjk2NTMxNDAsImVtYWlsIjoiaWJyYWhpbS5hYmRlbGF6aXoxMDAwQGdtYWlsLmNvbSIsIm9yaWdfaWF0IjoxNjAzNzMzMTQwfQ.zFCMgjly4Oypdw8Je40zoK0hVMS-r9IbO9ThuYechKU"]
//
        var productHeaders: [String: String] = [:]
        
        let isLogged = UserDefaults.standard.bool(forKey: "isLogged")
        
        if isLogged{
            print(UserDefaults.standard.string(forKey: "authToken") ?? "")
            productHeaders = ["Authorization" : "JWT \(UserDefaults.standard.string(forKey: "authToken") ?? "")"]

        }
        //print(detailCatHeaders)

        
        self.communicateWithApi(url: url, pagingUrl: nil, method: .get, parameters: parametersOfCall, headers: productHeaders, onSuccess: { (responseSuccess) in
            //
            completionSuccess(responseSuccess)
        }) { (responseFailure) in
            //
            completionFailure(responseFailure)
        }
    }

}
