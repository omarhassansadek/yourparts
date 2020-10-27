//
//  productViewModel.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/16/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class productViewModel: NSObject {

    @IBOutlet weak var productC: productClient!
    
    var cart_id = 0

    var productsResponse =  productResponse()
    
    func getProductList(url: String, apiParameters: [String:String], onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        
        var urlPath = baseUrl+productsUrl

         
        // urlPath = baseUrl+productsUrl+vehicle_id
        
        
        
        if url != ""{
            urlPath = url
            if let vehicle_id = UserDefaults.standard.string(forKey: "vehicle_id"){
                urlPath = url + "&vehicle_id=\(vehicle_id)"
            }
        }
        
        self.productC.requestProductList(url: urlPath, apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            
            //print(responseSuccess)
            
            productParser().parseProductsResponse(fromOrder: false, fromResponse: responseSuccess, intoResponse: self.productsResponse) { (productResponse) in
                
                self.productsResponse = productResponse
                onSuccess(true)
            }
            
//            productParser().parseProductsResponse(fromOrder: false, fromJSON: responseSuccess) { (productResponse) in
//                self.productsResponse = productResponse
//
//                onSuccess(true)
//            }
//            rimsizeParser().parserRimSize(fromJSON: responseSuccess) { (rimSizes) in
//                self.rimSizes = rimSizes
//                onSuccess(true)
//            }
            
            

        }) { (responseFailure) in
            //
        }
        
         
     }
    
    
    func addToCart( apiParameters: [String:Any], onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        
        var urlPath = baseUrl+addCartsUrl
        
        self.productC.addToCart(url: baseUrl+addCartsUrl, apiMethod: .post, parametersOfCall: apiParameters, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
              //
              print(responseSuccess)
              //if responseSuccess["cart"].int == UserDefaults.standard.integer(forKey: "cartid"){
                  if let cartId = responseSuccess["Cart_id"].int{
                      self.cart_id = cartId
                      onSuccess(true)
                  }
              //}
              
          }) { (responseFailure) in
              onFailure("We encountered an error. Try again later")
          }
        
        
    }
    
    
    
    
}
