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
import FBSDKLoginKit

class productViewModel: NSObject {
    
    //MARK:- Outlets
    @IBOutlet weak var productC: productClient!
    
    //MARK:- Variables
    var cart_id = 0
    var productsResponse =  productResponse()
    
    //MARK:- Methods
    func getProductList(url: String, apiParameters: [String:String], onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        
        var urlPath = baseUrl+productsUrl
        
        if url != ""{
            urlPath = url
            if self.productsResponse.next == nil || self.productsResponse.next == ""{
                if let vehicle_id = UserDefaults.standard.string(forKey: "vehicle"){
                    if url.contains("/subcategory") {
                        urlPath = url + "/?vehicle_id=\(vehicle_id)"
                    }else{
                        urlPath = url + "&vehicle_id=\(vehicle_id)"
                    }
                    
                }
            }
            
        }
        
        self.productC.requestProductList(url: urlPath, apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            
            productParser().parseProductsResponse(fromOrder: false, fromResponse: responseSuccess, intoResponse: self.productsResponse) { (productResponse) in
                self.productsResponse = productResponse
                onSuccess(true)
            }
        }) { (responseFailure) in
        }
        
    }
    
    func addToCart( apiParameters: [String:Any], onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        
        _ = baseUrl+addCartsUrl
        
        self.productC.addToCart(url: baseUrl+addCartsUrl, apiMethod: .post, parametersOfCall: apiParameters, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            print(responseSuccess)
            if let cartId = responseSuccess["Cart_id"].int{
                self.cart_id = cartId
                onSuccess(true)
            }
            
        }) { (responseFailure) in
            onFailure("We encountered an error. Try again later")
        }
        
    }
    
}
