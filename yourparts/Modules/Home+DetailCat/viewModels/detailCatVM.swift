//
//  detailCatVM.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/15/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class detailCatVM: NSObject {
    
    //MARK:- Outlets
    @IBOutlet weak var detailCatC: detailCatClient!
    
    //MARK:- Variables
    var detailCategory: category?
    var path: String = ""
    
    //MARK:- Methods
    func getDetailCategory(id: Int, apiParameters: [String:String], onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        
        self.detailCatC.requestDetailCat(url: baseUrl+categoriesUrl+"/\(id)/", apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            
            print(responseSuccess)
            
            categoryParser().parseDetailCategories(isSub: false, fromJSON: responseSuccess) { (detailCat) in
                print(detailCat.detailCat.count)
                self.detailCategory = detailCat
                onSuccess(true)
            }
        }) { (responseFailure) in
        }
        
    }
    
    func getSubDetailCategory(id: Int, subId: Int, apiParameters: [String:String], onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
        
        self.path = baseUrl+categoriesUrl+"/\(id)?sub_id=\(subId)"
        
        self.detailCatC.requestDetailCat(url: baseUrl+categoriesUrl+"/\(id)/?sub_id=\(subId)", apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            
            print(responseSuccess)
            
            categoryParser().parseDetailCategories(isSub: true, fromJSON: responseSuccess) { (detailCat) in
                print(detailCat.detailCat.count)
                self.detailCategory = detailCat
                onSuccess(true)
            }
        }) { (responseFailure) in
        }
    }
    
}
