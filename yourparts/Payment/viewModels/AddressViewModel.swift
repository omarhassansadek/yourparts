//
//  addAddressViewModel.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/27/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AddressViewModel: NSObject {

    @IBOutlet var AddressC: AddressClient!
    
    var addressArr: [address] = []
    
    func getAllCity( onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        self.AddressC.getAllCities(url: baseUrl+getCityUrl, apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, headers: nil, completionSuccess: { (responseSuccess) in
            //
        }) { (responseFailure) in
            //
        }
    }
    
    func addUserAddress(addressParameters: [String:Any] , onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        self.AddressC.addBiilingAddress(url: baseUrl+addAddressUrl, apiMethod: .post, parametersOfCall: addressParameters, apiEncoding: JSONEncoding.default, headers: nil, completionSuccess: { (responseSuccess) in
            //
            
            print(responseSuccess)
            if responseSuccess["id"].int != nil{
                onSuccess(true)
            }
        }) { (responseFailure) in
            //
            onFailure("We encountered error")
            
        }

    }
    
    
    func getUserAddress(onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        var userId = UserDefaults.standard.integer(forKey: "userid")
        
        self.AddressC.getBillingAddresses(url: baseUrl+profileUrl+"\(userId)", apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, headers: nil, completionSuccess: { (responseJSON) in
            //
            
            print(responseJSON)
            
            addressParser().parseAddresses(fromJSON: responseJSON) { (arrAddresses) in
                self.addressArr = arrAddresses
                
                onSuccess(true)
            }

        }) { (responseFailure) in
            //
            
            print(responseFailure)

        }
    }
    
    
}
