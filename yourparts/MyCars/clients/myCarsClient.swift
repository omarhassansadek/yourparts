//
//  myCarsClient.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/10/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class myCarsClient: ParentClient {

    
    func requestMyVehicle(url: String, apiMethod: HTTPMethod, parametersOfCall: [String: Any]? , apiEncoding: ParameterEncoding, headers: [String: String]? , completionSuccess: @escaping (JSON) -> Void , completionFailure: @escaping (JSON) -> Void ){
        
//            var urlRequest = URLRequest(url: URL(string: "https://new-api.yourparts.com/yourparts/api/customer/vehicles/")!)
//            urlRequest.httpMethod = HTTPMethod.get.rawValue
//            urlRequest = try! URLEncoding.default.encode(urlRequest, with: nil)
//            urlRequest.setValue("Token 12dc32fc6490bbb19ecfdf2ea7f46a0d6efb6406", forHTTPHeaderField: "Authorization")
//
//            Alamofire.request(urlRequest).responseJSON(completionHandler: {
//                response in
//
//                print("Request: \(String(describing: response.request))")
//                print("Request: \(String(describing: response.request?.allHTTPHeaderFields))")
//                print("Response: \(String(describing: response.response))")
//                print("Result: \(response.result)")
//
//                do{
//                    //let responseJson = try JSON(data: response.data!)
//                    let responseJson = try JSON(data: response.data!, options: .allowFragments)
//
//                    print(responseJson)
//                    completionSuccess(responseJson)
//                }catch let error{
//                    print(error)
//                    completionSuccess(JSON.null)
//                }
//                //code below
//            })

            self.communicateWithApiSetHeaders(url: url, method: apiMethod, parameters: parametersOfCall, headers: headers, onSuccess: { (responseSuccess) in
                //
                completionSuccess(responseSuccess)
            }) { (responseFailure) in
                //
                completionFailure(responseFailure)
            }
    }
}
