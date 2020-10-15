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
    
    var shippingAddress = address()
    
    var paymentMethod = ""
    
    var totalPrice = ""
    
    var installationCost = 0
    
    var shippingValue = 0

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
    
    
    var discountAmount = 0
    
    func applyPromoCode(code:String, paymentMethod: Int, total: Int, apiParameters: [String:Any], onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){

                  print(apiParameters)
        
                  
                        
                  self.paymentC.patchOrderDetails(url: baseUrl+applyPromoUrl+"code=\(code)&payment_method=\(paymentMethod)&total_before_shipping=\(total)", apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default,  completionSuccess: { (responseSuccess) in
                         //
                          print(responseSuccess)
           
                          if let discount = responseSuccess["discount_amount"].int{
                               self.discountAmount = discount
                               onSuccess(true)
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
                 
                            
                            if let paymentMethodKey = responseSuccess["payment_method"].int{
                                switch paymentMethodKey {
                                case 0:
                                    self.paymentMethod = "Cash on delivery".localized
                                case 1:
                                    self.paymentMethod = "Credit Card".localized
                                case 2:
                                    self.paymentMethod = "Valu".localized

                                default:
                                    break
                                }
                            }
                            
                            if let address = responseSuccess["billing_address"]["address"].string{
                                self.shippingAddress.address = address
                            }
                            
                            if let city = responseSuccess["billing_address"]["city"].string{
                                self.shippingAddress.city = city
                            }
                            
                            if let region = responseSuccess["billing_address"]["region"].string{
                                self.shippingAddress.region = region
                            }
                            
                            if let total = responseSuccess["order"]["_total"].string{
                                self.totalPrice = total
                            }
                            
                            if let shipping_value = responseSuccess["shipping_value"].int{
                                self.shippingValue = shipping_value
                            }

        
                            if let installCost = responseSuccess["installation_cost"].int{
                                self.installationCost = installCost
                            }


                            productParser().parseProductsResponse(fromOrder: true, fromJSON: responseSuccess) { (productArr) in

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
