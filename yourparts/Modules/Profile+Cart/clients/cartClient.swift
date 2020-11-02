//
//  cartClient.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/17/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class cartClient: ParentClient {

    
    func requestCartData(url: String, apiMethod: HTTPMethod, parametersOfCall: [String: Any]? , apiEncoding: ParameterEncoding, headers: [String: String]? , completionSuccess: @escaping (JSON) -> Void , completionFailure: @escaping (JSON) -> Void ){
        
        let cartHeaders: [String: String] = ["Authorization" : "JWT \(UserDefaults.standard.string(forKey: "authToken") ?? "")"]

        
        self.communicateWithApi(url: url, pagingUrl: nil, method: apiMethod, parameters: parametersOfCall, headers: cartHeaders, onSuccess: { (responseSuccess) in
            //
            completionSuccess(responseSuccess)
        }) { (responseFailure) in
            //
            completionFailure(responseFailure)
        }
    }
    
    func patchToCart(url: String, apiMethod: HTTPMethod, parametersOfCall: [String: Any]? , apiEncoding: ParameterEncoding , completionSuccess: @escaping (JSON) -> Void , completionFailure: @escaping (JSON) -> Void ){
          
          let cartHeaders: [String: String] = ["Authorization" : "JWT \(UserDefaults.standard.string(forKey: "authToken") ?? "")"]

          
          self.communicateWithApi(url: url, pagingUrl: nil, method: apiMethod, parameters: parametersOfCall, headers: cartHeaders, onSuccess: { (responseSuccess) in
              //
              completionSuccess(responseSuccess)
          }) { (responseFailure) in
              //
              completionFailure(responseFailure)
          }
          
      }
    
    func calculateCartTotal(url: String, apiMethod: HTTPMethod, parametersOfCall: [String: Any]? , apiEncoding: ParameterEncoding , completionSuccess: @escaping (JSON) -> Void , completionFailure: @escaping (JSON) -> Void ){
          
          let cartHeaders: [String: String] = ["Authorization" : "JWT \(UserDefaults.standard.string(forKey: "authToken") ?? "")"]

          
          self.communicateWithApi(url: url, pagingUrl: nil, method: apiMethod, parameters: nil, headers: cartHeaders, onSuccess: { (responseSuccess) in
              //
              completionSuccess(responseSuccess)
          }) { (responseFailure) in
              //
              completionFailure(responseFailure)
          }
          
      }
    
    func addToCart(url: String, apiMethod: HTTPMethod, parametersOfCall: [String: Any]? , apiEncoding: ParameterEncoding , completionSuccess: @escaping (JSON) -> Void , completionFailure: @escaping (JSON) -> Void ){
          
          let cartHeaders: [String: String] = ["Authorization" : "JWT \(UserDefaults.standard.string(forKey: "authToken") ?? "")"]

          
          self.communicateWithApi(url: url, pagingUrl: nil, method: apiMethod, parameters: parametersOfCall, headers: cartHeaders, onSuccess: { (responseSuccess) in
              //
              completionSuccess(responseSuccess)
          }) { (responseFailure) in
              //
              completionFailure(responseFailure)
          }
          
      }
    
    func createOrder(url: String, apiMethod: HTTPMethod, parametersOfCall: [String: Any]? , apiEncoding: ParameterEncoding , completionSuccess: @escaping (JSON) -> Void , completionFailure: @escaping (JSON) -> Void ){
          
          let cartHeaders: [String: String] = ["Authorization" : "JWT \(UserDefaults.standard.string(forKey: "authToken") ?? "")"]

          
          self.communicateWithApi(url: url, pagingUrl: nil, method: apiMethod, parameters: parametersOfCall, headers: cartHeaders, onSuccess: { (responseSuccess) in
              //
              completionSuccess(responseSuccess)
          }) { (responseFailure) in
              //
              completionFailure(responseFailure)
          }
          
      }

    
    
}
