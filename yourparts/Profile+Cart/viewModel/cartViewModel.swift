//
//  cartViewModel.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/17/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import Alamofire

class cartViewModel: NSObject {

    @IBOutlet weak var cartC: cartClient!
    
    var cartArr : [product] = []
    
    var amount : String = ""
    
    var total : String = ""

    
     func getCartProducts( onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        self.cartC.requestCartData(url: baseUrl+cartUrl, apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, headers: nil, completionSuccess: { (responseSuccess) in
            
            
            print(responseSuccess)
            
            self.amount = responseSuccess["extra_rows"].arrayValue[0]["amount"].string ?? ""
            
            self.total = responseSuccess["total"].string ?? ""

            cartParser().parseCartData(fromJSON: responseSuccess) { (cartDataArr) in
                self.cartArr = cartDataArr
                
                onSuccess(true)

            }
            

            
            //
        }) { (responseFailure) in
            //
        }
    }
    
    
    func deleteFromCart(id: Int,  onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        
        self.cartC.requestCartData(url: baseUrl+cartUrl+"\(id)", apiMethod: .delete, parametersOfCall: nil, apiEncoding: JSONEncoding.default, headers: nil, completionSuccess: { (responseSuccess) in
            
            
            print(responseSuccess)
            
//            cartParser().parseCartData(fromJSON: responseSuccess) { (cartDataArr) in
//                self.cartArr = cartDataArr
//
//                onSuccess(true)
//
//            }
            

            
            //
        }) { (responseFailure) in
            //
        }
    }
    
    
    func addToCart( apiParameters: [String:Any], onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        
        var urlPath = baseUrl+addCartsUrl
        
        self.cartC.addToCart(url: baseUrl+addCartsUrl, apiMethod: .post, parametersOfCall: apiParameters, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
              //
              print(responseSuccess)
              //if responseSuccess["cart"].int == UserDefaults.standard.integer(forKey: "cartid"){
                  if let cartId = responseSuccess["Cart_id"].int{
                      //self.cart_id = cartId
                      onSuccess(true)
                  }
              //}
              
          }) { (responseFailure) in
              onFailure("We encountered an error. Try again later")
          }
        
        
    }

 
    
}
