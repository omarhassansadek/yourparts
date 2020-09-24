//
//  productDetailsVM.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/17/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import Alamofire

class productDetailsViewModel: NSObject {
    
    @IBOutlet weak var productDetailsC: productDetailsClient!
    
    var cart_id = 0
    
    func addProductToCart( apiParameters: [String:Any], onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        
        self.productDetailsC.productAddToCart(url: baseUrl+addCartsUrl, apiMethod: .post, parametersOfCall: apiParameters, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            
                print(responseSuccess)
               // if responseSuccess["cart"].int == UserDefaults.standard.integer(forKey: "cartid"){
                    if let cartId = responseSuccess["Cart_id"].int{
                        self.cart_id = cartId
                        onSuccess(true)
                    }

               // }
            //
        }) { (responseFailure) in
            //
            onFailure("We encountered an error. Try again later")

        }

    }
    
}
