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
    
    //MARK:- Outlets
    @IBOutlet weak var homeC: homeClient!
    
    //MARK:- Variables
    var homeCategoryResponse = categoryResposne()
    var categoriesArr: [category] = []
    var homeFreqCategoryResponse = categoryResposne()
    var mostWantedCategoryResponse = categoryResposne()
    var freqCategoriesArr: [category] = []
    var offersArr : [offer] = []
    var homeCards: [String] = ["0"]
    
    //MARK:- Methods
    func getHomeCategories(apiParameters: [String:String], onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        
        self.homeC.requestCategories(url: baseUrl+categoriesUrl, apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            
            categoryParser().parseCategories(slidingCat: false, fromResponse: responseSuccess, intoResponse: self.homeCategoryResponse) { (categoryResposne) in
                if self.homeCategoryResponse.data?.count ?? 0 > 0 {
                    self.homeCards.append("d")
                    self.homeCards.append("e")
                }
                self.homeCards.append("f")
                self.homeCards.append("g")
                onSuccess(true)
            }
        }) { (responseFailure) in
        }
        
    }
    
    func getOffersFromApi( onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        
        self.homeC.requestOffers(url: baseUrl+getOffersUrl, apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            
            print(responseSuccess)
            
            offerParser().parserOffers(fromJSON: responseSuccess) { (offerArr) in
                self.offersArr = offerArr
                if self.offersArr.count > 0 {
                    self.homeCards.append("a")
                }
                onSuccess(true)
            }
            
        }) { (responseFailure) in
            onFailure("We encountered an error. Try again later")
        }
        
    }
    
    func getFreqNeededFromApi( onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        
        self.homeC.requestOffers(url: baseUrl+getFreqNeeded, apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            
            print(responseSuccess)
            
            categoryParser().parseCategories(slidingCat: true, fromResponse: responseSuccess, intoResponse: self.homeFreqCategoryResponse) { (categoryResposne) in
                
                if self.homeFreqCategoryResponse.data?.count ?? 0 > 0{
                    self.homeCards.append("b")
                }
                onSuccess(true)
            }
            
        }) { (responseFailure) in
            onFailure("We encountered an error. Try again later")
        }
    }
    
    func getMostCategories( onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        
        self.homeC.requestOffers(url: baseUrl+getMostCatUrl, apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            
            print(responseSuccess)
            
            categoryParser().parseCategories(slidingCat: false, fromResponse: responseSuccess, intoResponse: self.mostWantedCategoryResponse) { (categoryResposne) in
                if self.mostWantedCategoryResponse.data?.count ?? 0 > 0{
                    self.homeCards.append("c")
                }
                onSuccess(true)
            }
        }) { (responseFailure) in
            onFailure("We encountered an error. Try again later")
        }
    }
}
