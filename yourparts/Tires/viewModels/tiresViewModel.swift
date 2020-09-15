//
//  tiresViewModel.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/15/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class tiresViewModel: NSObject {

    @IBOutlet weak var tireC: tiresClient!
    
    var rimSizes : [rimsize] = []
    var tireSizes : [rimsize] = []
    var rachoSizes : [rimsize] = []

    func getRimSize( apiParameters: [String:String], onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
         
         
        self.tireC.requestRimSize(url: baseUrl+rimSizeUrl, apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            
            print(responseSuccess)
            
            rimsizeParser().parserRimSize(fromJSON: responseSuccess) { (rimSizes) in
                self.rimSizes = rimSizes
                onSuccess(true)
            }
            
            

        }) { (responseFailure) in
            //
        }
         
     }
    
    func getTireSize( apiParameters: [String:String], onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
         
         
        self.tireC.requestRimSize(url: baseUrl+tireSizeUrl, apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            
            print(responseSuccess)
            
            rimsizeParser().parserRimSize(fromJSON: responseSuccess) { (tireSizes) in
                self.tireSizes = tireSizes
                onSuccess(true)
            }
            
            

        }) { (responseFailure) in
            //
        }
         
     }
    
    
    func getRachoSize( apiParameters: [String:String], onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> ()){
         
         
        self.tireC.requestRimSize(url: baseUrl+rachoSizeUrl, apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            
            print(responseSuccess)
            
            rimsizeParser().parserRimSize(fromJSON: responseSuccess) { (rachoSizes) in
                self.rachoSizes = rachoSizes
                
                //self.rachoSizes.sorted(by: { $0.Int(size) > $1.size })

                onSuccess(true)
            }
            
            

        }) { (responseFailure) in
            //
        }
         
     }


}
