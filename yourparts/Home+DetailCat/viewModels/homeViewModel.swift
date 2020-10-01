//
//  homeViewModel.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/14/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class homeViewModel: NSObject {

    @IBOutlet weak var homeC: homeClient!
    
    var categoriesArr: [category] = []
    
    var offersArr : [offer] = []
    
    func getHomeCategories(apiParameters: [String:String], onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
         
         
        self.homeC.requestCategories(url: baseUrl+categoriesUrl, apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            //
            categoryParser().parseCategories(fromJSON: responseSuccess) { catArr in
                self.categoriesArr = catArr
                //self.categoriesArr[]
                onSuccess(true)
            }
            
            
        }) { (responseFailure) in
            //
        }
         
     }
    
    func getOffersFromApi( onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
         
         
        self.homeC.requestOffers(url: baseUrl+getOffersUrl, apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            
            
            print(responseSuccess)
            
            offerParser().parserOffers(fromJSON: responseSuccess) { (offerArr) in
                self.offersArr = offerArr
                onSuccess(true)
            }
              
//            categoryParser().parseCategories(fromJSON: responseSuccess) { catArr in
//                self.categoriesArr = catArr
//                onSuccess(true)
//            }
            
            
        }) { (responseFailure) in
            //
        }
         
     }
}
