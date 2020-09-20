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
    
    func addProductToCart( apiParameters: [String:Any], onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){

        self.productDetailsC.productAddToCart(url: baseUrl+cartsUrl, apiMethod: .post, parametersOfCall: apiParameters, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            //
            print(responseSuccess)
            if responseSuccess["cart"].int == 0000007{
                onSuccess(true)
            }
        }) { (responseFailure) in
            
        }
    }
    
}
