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
    
    var freqCategoriesArr: [category] = []

    var offersArr : [offer] = []
    
    var homeCards: [String] = ["0"]
    
    
    func getHomeCategories(apiParameters: [String:String], onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        
        
         //Home Cats -> type "e"
         //Brands1 -> type "f"
         //Brands2 -> type "g"

         
        self.homeC.requestCategories(url: baseUrl+categoriesUrl, apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            //
            categoryParser().parseCategories(slidingCat: false, fromJSON: responseSuccess) { catArr in
                self.categoriesArr = catArr
                if self.categoriesArr.count > 0 {
                    self.homeCards.append("d")
                    self.homeCards.append("e")
                }
                //self.categoriesArr[]
                self.homeCards.append("f")
                self.homeCards.append("g")

                onSuccess(true)
            }
            
            
        }) { (responseFailure) in
            //
        }
         
     }
    
    func getOffersFromApi( onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
         
        //offers -> type "a"
        self.homeC.requestOffers(url: baseUrl+getOffersUrl, apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            
            
            print(responseSuccess)
            
            offerParser().parserOffers(fromJSON: responseSuccess) { (offerArr) in
                self.offersArr = offerArr
                if self.offersArr.count > 0 {
                    self.homeCards.append("a")
                }
                onSuccess(true)
            }
              
//            categoryParser().parseCategories(fromJSON: responseSuccess) { catArr in
//                self.categoriesArr = catArr
//                onSuccess(true)
//            }
            
            
        }) { (responseFailure) in
            //
            onFailure("We encountered an error. Try again later")
        }
         
     }
    
    
    func getFreqNeededFromApi( onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
             
             //frequently needed -> type "b"
             //Most Wanted -> type "c"
             //Cat Title -> type "d"
        
            self.homeC.requestOffers(url: baseUrl+getFreqNeeded, apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
                
                
                print(responseSuccess)
                
               
                  
                categoryParser().parseCategories(slidingCat: true, fromJSON: responseSuccess) { catArr in
                    self.freqCategoriesArr = catArr
                    if self.freqCategoriesArr.count > 0{
                        self.homeCards.append("b")
                    }
                    self.homeCards.append("c")

                    onSuccess(true)
                }
                
                
            }) { (responseFailure) in
                //
                onFailure("We encountered an error. Try again later")

            }
             
    }

}
