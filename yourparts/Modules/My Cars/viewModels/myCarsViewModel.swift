//
//  myCarsViewModel.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/10/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class myCarsViewModel: NSObject {
    
    //MARK:- Outlets
    @IBOutlet weak var myCarsC : myCarsClient!
    
    //MARK:- Variables
    var myCars: [vehicle] = []
    var userDef = UserDefaults.standard
    
    //MARK:- Methods
    func getMyVehicles( onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> () ){
        var headersDic : [String: String] = [:]
        headersDic["Authorization"] = "JWT \(UserDefaults.standard.string(forKey: "authToken") ?? "")"
        
        self.myCarsC.requestMyVehicle(url: baseUrl+add_get_VehicleUrl, apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, headers: headersDic, completionSuccess: { (responseSuccesss) in
            
            print(responseSuccesss)
            
            vehicleParser().parseVehicles(fromJSON: responseSuccesss) { (vehiclesArr) in
                
                self.myCars = vehiclesArr
                onSuccess(true)
            }
            
        }) { (responseFailure) in
            
            onFailure("We encountered an error. Try again later")
        }
    }
    
    func deleteMyVehicle(id: Int, onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> () ){
        var headersDic : [String: String] = [:]
        headersDic["Authorization"] = "JWT \(UserDefaults.standard.string(forKey: "authToken") ?? "")"
        
        self.myCarsC.requestMyVehicle(url: baseUrl+add_get_VehicleUrl+"\(id)/", apiMethod: .delete, parametersOfCall: nil, apiEncoding: JSONEncoding.default, headers: headersDic, completionSuccess: { (responseSuccesss) in
            
            print(responseSuccesss)
            onSuccess(true)
            
        }) { (responseFailure) in
            
            onFailure("We encountered an error. Try again later")
        }
    }
    
}
