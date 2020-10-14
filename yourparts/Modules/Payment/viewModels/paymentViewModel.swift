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

class paymentViewModel: NSObject {

    @IBOutlet weak var paymentC: paymentClient!
    
    var addressArr: [address] = []
    var ctitiesArr: [city] = []
    var regionArr: [city] = []
    var itemsArr: [product] = []

    func getAllCity( onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        self.paymentC.getAllCities(url: baseUrl+getCityUrl, apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, headers: nil, completionSuccess: { (responseSuccess) in
            //
            cityParser().parseCities(fromJSON: responseSuccess, onSuccess: { (cityArr) in
                //
                self.ctitiesArr = cityArr
                onSuccess(true)
            })
        }) { (responseFailure) in
            //
        }
    }
    
    func getAllregions(id: Int, onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        self.paymentC.getAllCities(url: baseUrl+getCityUrl+"?region_id=\(id)", apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, headers: nil, completionSuccess: { (responseSuccess) in
            //
            cityParser().parseCities(fromJSON: responseSuccess, onSuccess: { (cityArr) in
                //
                self.regionArr = cityArr
                onSuccess(true)

            })
        }) { (responseFailure) in
            //
        }
    }
    
    func addUserAddress(addressParameters: [String:Any] , onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        self.paymentC.addBiilingAddress(url: baseUrl+addAddressUrl, apiMethod: .post, parametersOfCall: addressParameters, apiEncoding: JSONEncoding.default, headers: nil, completionSuccess: { (responseSuccess) in
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
        
        self.paymentC.getBillingAddresses(url: baseUrl+profileUrl+"\(userId)", apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, headers: nil, completionSuccess: { (responseJSON) in
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
    
    
    
    func patchOrder(id: Int, apiParameters: [String:Any], onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){

        print(apiParameters)
        
        self.paymentC.patchOrderDetails(url: baseUrl+patchOrderUrl+"\(id)/", apiMethod: .patch, parametersOfCall: apiParameters, apiEncoding: JSONEncoding.default,  completionSuccess: { (responseSuccess) in
               //
                print(responseSuccess)
 
                if let id = responseSuccess["id"].int{
                    onSuccess(true)
                }else{
                    onFailure("We encountered an error. Try again later")
                }
                
               }) { (responseFailure) in
                   onFailure("We encountered an error. Try again later")
               }
     }
    
     func createOrderItem( apiParameters: [String:Any], onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){

           print(apiParameters)
           
           self.paymentC.patchOrderDetails(url: baseUrl+createOrderItemUrl, apiMethod: .post, parametersOfCall: apiParameters, apiEncoding: JSONEncoding.default,  completionSuccess: { (responseSuccess) in
                  //
                   print(responseSuccess)
    
                   if let status = responseSuccess["status"].string{
                    if status == "status=201_CREATED"{
                        onSuccess(true)

                    }
                   }else{
                       onFailure("We encountered an error. Try again later")
                   }
                   
                  }) { (responseFailure) in
                      onFailure("We encountered an error. Try again later")
                  }
        }
    
    
        func getOrder( id: Int, onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){

              // print(apiParameters)
               
               self.paymentC.createOrder(url: baseUrl+createOrderUrl+"\(id)", apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default,  completionSuccess: { (responseSuccess) in
                      //
                        print(responseSuccess)
                        if let id = responseSuccess["id"].int{
                            productParser().parseProductsResponse(fromOrder: true, fromJSON: responseSuccess) { (productArr) in
                                //self.itemsArr = productArr
                                self.itemsArr = productArr.results
                                onSuccess(true)
                            }

                        }else{
                            
                        }
                }) { (responseFailure) in
                        onFailure("We encountered an error. Try again later")
                }
                      
        
            }

       
    
    
}
