//
//  addAddressClient.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/27/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class paymentClient: ParentClient {

    
    func getAllCities(url: String, apiMethod: HTTPMethod, parametersOfCall: [String: Any]? , apiEncoding: ParameterEncoding, headers: [String: String]? , completionSuccess: @escaping (JSON) -> Void , completionFailure: @escaping (JSON) -> Void ){
          
          //let billingHeaders: [String: String] = ["Authorization" : "JWT \(UserDefaults.standard.string(forKey: "authToken") ?? "")"]

          
          self.communicateWithApi(url: url, pagingUrl: nil, method: apiMethod, parameters: parametersOfCall, headers: nil, onSuccess: { (responseSuccess) in
              //
              completionSuccess(responseSuccess)
          }) { (responseFailure) in
              //
              completionFailure(responseFailure)
          }
      }
    
    
      func addBiilingAddress(url: String, apiMethod: HTTPMethod, parametersOfCall: [String: Any]? , apiEncoding: ParameterEncoding, headers: [String: String]? , completionSuccess: @escaping (JSON) -> Void , completionFailure: @escaping (JSON) -> Void ){
          
          let billingHeaders: [String: String] = ["Authorization" : "JWT \(UserDefaults.standard.string(forKey: "authToken") ?? "")"]

          
          self.communicateWithApi(url: url, pagingUrl: nil, method: apiMethod, parameters: parametersOfCall, headers: billingHeaders, onSuccess: { (responseSuccess) in
              //
              completionSuccess(responseSuccess)
          }) { (responseFailure) in
              //
              completionFailure(responseFailure)
          }
      }
    

        func getBillingAddresses(url: String, apiMethod: HTTPMethod, parametersOfCall: [String: Any]? , apiEncoding: ParameterEncoding, headers: [String: String]? , completionSuccess: @escaping (JSON) -> Void , completionFailure: @escaping (JSON) -> Void ){
            
            let billingHeaders: [String: String] = ["Authorization" : "JWT \(UserDefaults.standard.string(forKey: "authToken") ?? "")"]

            
            self.communicateWithApi(url: url, pagingUrl: nil, method: apiMethod, parameters: parametersOfCall, headers: billingHeaders, onSuccess: { (responseSuccess) in
                //
                completionSuccess(responseSuccess)
            }) { (responseFailure) in
                //
                completionFailure(responseFailure)
            }

            
        }
    
    func patchOrderDetails(url: String, apiMethod: HTTPMethod, parametersOfCall: [String: Any]? , apiEncoding: ParameterEncoding , completionSuccess: @escaping (JSON) -> Void , completionFailure: @escaping (JSON) -> Void ){
        
        let billingHeaders: [String: String] = ["Authorization" : "JWT \(UserDefaults.standard.string(forKey: "authToken") ?? "")"]

        
        self.communicateWithApi(url: url, pagingUrl: nil, method: apiMethod, parameters: parametersOfCall, headers: billingHeaders, onSuccess: { (responseSuccess) in
            //
            completionSuccess(responseSuccess)
        }) { (responseFailure) in
            //
            completionFailure(responseFailure)
        }

        
    }
    
    func createOrder(url: String, apiMethod: HTTPMethod, parametersOfCall: [String: Any]? , apiEncoding: ParameterEncoding , completionSuccess: @escaping (JSON) -> Void , completionFailure: @escaping (JSON) -> Void ){
        
        let billingHeaders: [String: String] = ["Authorization" : "JWT \(UserDefaults.standard.string(forKey: "authToken") ?? "")"]

        
        self.communicateWithApi(url: url, pagingUrl: nil, method: apiMethod, parameters: parametersOfCall, headers: billingHeaders, onSuccess: { (responseSuccess) in
            //
            completionSuccess(responseSuccess)
        }) { (responseFailure) in
            //
            completionFailure(responseFailure)
        }

        
    }
      
}
