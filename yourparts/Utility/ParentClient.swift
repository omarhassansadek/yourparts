//
//  ParentClient.swift
//  phLog
//
//  Created by Omar Taha on 11/21/18.
//  Copyright © 2018 Softmills. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ParentClient: NSObject {
    
    let storedToken = UserDefaults.standard.string(forKey: "token")
    //let storedToken = Optional("3475c5b5e69807e37c56f40636a1ce95")
    
    let headers: HTTPHeaders?
    let urlHeaders : HTTPHeaders?
    
    var isSend = ""
    
    override init() {
        
        var langCode = "en-us"
        let langStr = Locale.current.languageCode
        if langStr == "ar"{
            langCode = "ar"
        }
        
        let env = Bundle.main.infoDictionary!
        //self.isSend = env["DevOrProduction"] as! String
        
        
        
        self.headers = [
            "Content-Type" : "application/json",
            //"x-lang-code" : langCode,
            //"Authorization" :   "Token \(self.storedToken ?? "")",
            //"x-auth-token" : "xxxxxxxxx",
            //"X-user-type" : "0"
        ]
        
        self.urlHeaders = [
            "Content-Type" : "application/x-www-form-urlencoded",
            //"x-lang-code" : langCode,
            //"x-auth-token" : self.storedToken ?? "",
            //"X-user-type" : "0"
        ]
    }
    
    func communicateWithApiSetHeaders(url: String?, method: HTTPMethod, parameters: [String:Any]?,headers: [String: String]?, onSuccess: @escaping (JSON) -> Void, onFailure: @escaping (JSON) -> Void){
        
        var urlRequest = URLRequest(url: URL(string: url ?? "")!)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        urlRequest = try! URLEncoding.default.encode(urlRequest, with: nil)
        urlRequest.setValue(headers?["Authorization"], forHTTPHeaderField: "Authorization")
        
        Alamofire.request(urlRequest).responseJSON(completionHandler: {
            response in
            
            print("Request: \(String(describing: response.request))")
            print("Request: \(String(describing: response.request?.allHTTPHeaderFields))")
            print("Response: \(String(describing: response.response))")
            print("Result: \(response.result)")
            
            do{
                //let responseJson = try JSON(data: response.data!)
                let responseJson = try JSON(data: response.data!, options: .allowFragments)
                
                print(responseJson)
                onSuccess(responseJson)
            }catch let error{
                print(error)
                //onSuccess(JSON.null)
            }
            //code below
        })
    }
    
    func communicateWithApi(url: String?, pagingUrl:String?, method: HTTPMethod, parameters: [String:Any]?,headers: [String: String]? , onSuccess: @escaping (JSON) -> Void, onFailure: @escaping (JSON) -> Void) {
        
        var apiURL = URL(string: "")
       if url != nil {
            print(url ?? "")
            apiURL = URL(string: url!)
        }else{
            apiURL = URL(string: pagingUrl!)
        }
        
        //print(self.headers as Any)
        //print(parameters as Any)
        
        Alamofire.request(apiURL!, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            
            print("Request: \(String(describing: response.request))")
            print("Request: \(String(describing: response.request?.allHTTPHeaderFields))")
            print("Response: \(String(describing: response.response))")
            print("Result: \(response.result)")
            
            print(response.response?.statusCode)
            
            if response.response?.statusCode == 200 ||  response.response?.statusCode == 201 || response.response?.statusCode == 204 {
                
                do{
                    //let responseJson = try JSON(data: response.data!)
                    let responseJson = try JSON(data: response.data!, options: .allowFragments)

                    //print(responseJson)
                    onSuccess(responseJson)
                }catch let error{
                    print(error)
                    onSuccess(JSON.null)
                }
                
            }else if response.response?.statusCode == 400{
                do{
                    let responseJsonFailure = try JSON(data: response.data!)
                    print(responseJsonFailure)
                    onFailure(responseJsonFailure)
                }catch _{
                    //print(error)
                    onFailure(JSON("We encountered error. Try agian later"))
                }
                
                //ErrorHandler.sharedInstance().handleClientError(response: response, onFailure: onFailure)
            }else{
                onFailure(JSON("We encountered error. Try agian later"))
                //var dicStatusCode: [String: Any] = [ "statusCode" : "\(response.response?.statusCode)"]
                //let statusCodeJSON = JSON(dicStatusCode)
                //onFailure(statusCodeJSON)
            }
        }
    }
    
    
}

