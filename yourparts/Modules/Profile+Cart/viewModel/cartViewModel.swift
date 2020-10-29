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
    
    var total_install : String = ""

    var cartId: Int?

    
     func getCartProducts( onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        self.cartC.requestCartData(url: baseUrl+cartUrl, apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, headers: nil, completionSuccess: { (responseSuccess) in
            
            
            print(responseSuccess)
            
            self.amount = responseSuccess["extra_rows"].arrayValue[0]["amount"].string ?? ""
            
            self.total = responseSuccess["total"].string ?? ""
            
            self.cartId = responseSuccess["id"].int ?? -1
            
            self.total_install = String(responseSuccess["installation_cost"].int ?? -1) + " ج.م"

            cartParser().parseCartData(fromJSON: responseSuccess) { (cartDataArr) in
                self.cartArr = cartDataArr
                
                onSuccess(true)

            }
            

            
            //
        }) { (responseFailure) in
            //
            onFailure("We encountered an error. Try again later")
        }
    }
    
    
    func deleteFromCart(id: Int,  onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        
        self.cartC.requestCartData(url: baseUrl+cartItemUrl+"\(id)", apiMethod: .delete, parametersOfCall: nil, apiEncoding: JSONEncoding.default, headers: nil, completionSuccess: { (responseSuccess) in
            
            
            print(responseSuccess)
            
            
//            cartParser().parseCartData(fromJSON: responseSuccess) { (cartDataArr) in
//                self.cartArr = cartDataArr
//
                onSuccess(true)
//
//            }
            

            
            //
        }) { (responseFailure) in
            //
        }
    }
    
    
    func addToCart(id: Int, apiParameters: [String:Any], onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        

        self.cartC.addToCart(url: baseUrl+cartItemUrl+"\(id)/", apiMethod: .patch, parametersOfCall: apiParameters, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
              //
              print(responseSuccess)
              //if responseSuccess["cart"].int == UserDefaults.standard.integer(forKey: "cartid"){
                  if let cartId = responseSuccess["id"].int{
                      //self.cart_id = cartId
                      print(cartId)
                      onSuccess(true)
                  }
              //}
              
          }) { (responseFailure) in
              onFailure("We encountered an error. Try again later")
          }
    }
    
    
    func patchOnCartItem(id: Int, apiParameters: [String:Any], onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        
        
        self.cartC.patchToCart(url: baseUrl+cartItemUrl+"\(id)/", apiMethod: .patch, parametersOfCall: apiParameters, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            //
            print(responseSuccess)
            //if responseSuccess["cart"].int == UserDefaults.standard.integer(forKey: "cartid"){
            if let cartId = responseSuccess["id"].int{
                //self.cart_id = cartId
                print(cartId)
                onSuccess(true)
            }
            //}
            
        }) { (responseFailure) in
            onFailure("We encountered an error. Try again later")
        }
    }
    
    func calculateCart(id: Int, apiParameters: [String:Any], onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        
        
        self.cartC.calculateCartTotal(url: baseUrl+calculateCartUrl+"?cart=\(self.cartId ?? -1)", apiMethod: .get, parametersOfCall: apiParameters, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            //
            print(responseSuccess)
            //if responseSuccess["cart"].int == UserDefaults.standard.integer(forKey: "cartid"){
            if let totalProduct = responseSuccess["Total_Product"].int{
                if let totalInstall = responseSuccess["total_install"].int{
                    //self.total = "\(totalProduct) ج.م"
                    self.total_install = "\(totalInstall) ج.م"
                    //print(cartId)
                    onSuccess(true)

                }
            }
            
            //}
            
        }) { (responseFailure) in
            onFailure("We encountered an error. Try again later")
        }
    }
    
    
    var orderId: Int?
    
    var orderItemId: Int?

    func createOrder(apiParameters: [String:Any], onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
         
         print(apiParameters)

         self.cartC.createOrder(url: baseUrl+create_get_OrderUrl, apiMethod: .post, parametersOfCall: apiParameters, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
               //
               print(responseSuccess)

            if let id = responseSuccess["id"].int{
                if let orderId = responseSuccess["order"]["id"].int{
                    self.orderItemId = orderId
                    self.orderId = id
                    onSuccess(true)

                }
            }else{
                onFailure("We encountered an error. Try again later")
            }
            
           }) { (responseFailure) in
               onFailure("We encountered an error. Try again later")
           }
     }
 
    
}
