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
    
    var productsResponse: productResponse?
    
    func getProductList(url: String, apiParameters: [String:String], onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
         
        
        var urlPath = baseUrl+productsUrl
        
        if url != ""{
            urlPath = url
        }
        
        self.productC.requestProductList(url: urlPath, apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            
            print(responseSuccess)
            
            productParser().parseProductsResponse(fromJSON: responseSuccess) { (productResponse) in
                self.productsResponse = productResponse
                
                onSuccess(true)
            }
//            rimsizeParser().parserRimSize(fromJSON: responseSuccess) { (rimSizes) in
//                self.rimSizes = rimSizes
//                onSuccess(true)
//            }
            
            

        }) { (responseFailure) in
            //
        }
         
     }
    
}
