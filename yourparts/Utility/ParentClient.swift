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
    
    //let storedToken = UserDefaults.standard.string(forKey: PHOTOGRAPHER_TOKEN)
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
            //"x-auth-token" :   self.storedToken ?? "",
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
    
    func communicateWithApi(url: String?, pagingUrl:String?, method: HTTPMethod, parameters: [String:Any]?, onSuccess: @escaping (JSON) -> Void, onFailure: @escaping (JSON) -> Void) {
        
        var apiURL: URL?
        if url != nil {
            apiURL = URL(string: url!)
        }else{
            apiURL = URL(string: pagingUrl!)
        }
        
        //print(self.headers as Any)
        //print(parameters as Any)
        Alamofire.request(apiURL!, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: self.headers).responseJSON { (response) in
            
            
            print("Request: \(String(describing: response.request))")
            print("Response: \(String(describing: response.response))")
            print("Result: \(response.result)")
            
            
            if response.response?.statusCode == 200 {
                
                do{
                    let responseJson = try JSON(data: response.data!)
                    //print(responseJson)
                    onSuccess(responseJson)
                }catch _{
                    //print(error)
                    onSuccess(JSON.null)
                }
                
            }else if response.response?.statusCode == 400{
                do{
                    let responseJsonFailure = try JSON(data: response.data!)
                    //print(responseJson)
                    onFailure(responseJsonFailure)
                }catch _{
                    //print(error)
                    onFailure(JSON.null)
                }
                
                //ErrorHandler.sharedInstance().handleClientError(response: response, onFailure: onFailure)
            }else{
                
                //var dicStatusCode: [String: Any] = [ "statusCode" : "\(response.response?.statusCode)"]
                //let statusCodeJSON = JSON(dicStatusCode)
                //onFailure(statusCodeJSON)
            }
        }
    }
    
    
}

