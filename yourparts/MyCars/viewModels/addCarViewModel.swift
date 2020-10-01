//
//  addCarViewModel.swift
//  yourparts
//
//  Created by Yourparts #1 on 10/1/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class addCarViewModel: NSObject {
    
    @IBOutlet weak var addCarC: addCarClient!
    
    var carTypes: [carType] = []
    var carMakers: [maker] = []
    var carModels: [carModel] = []
    var carYears: [carYear] = []

    func getCarTypes( onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> () ){
        var headersDic : [String: String] = [:]
        //headersDic["Authorization"] = "Token \(self.userDef.string(forKey: "token") ?? "")"
        
        self.addCarC.getCarTypesFromApi(url: baseUrl+myVehiclesTypeUrl, apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            //
            
            print(responseSuccess)
                    
            vehicleTypesParser().vehicleTypesParser(fromJSON: responseSuccess) { (carTypesArr) in
                self.carTypes = carTypesArr
                onSuccess(true)
            }
                    
        }) { (responseFailure) in
            //
        }
        
        
    }
    
    func getCarMakers(id: Int,  onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> () ){
        
        //var headersDic : [String: String] = [:]
        //headersDic["Authorization"] = "Token \(self.userDef.string(forKey: "token") ?? "")"
        
        self.addCarC.getCarTypesFromApi(url: baseUrl+myVehiclesTypeUrl+"\(id)", apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            //
            
            print(responseSuccess)
            
            vehicleMarkerParser().vehicleMakersParser(fromJSON: responseSuccess) { (makersArr) in
                self.carMakers = makersArr
                onSuccess(true)
            }

        }) { (responseFailure) in
            //
        }
        
    }
    
    func getCarModels(id: Int, selectedType: Int,  onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> () ){
        self.addCarC.getCarTypesFromApi(url: baseUrl+myVehiclesTypeUrl+"\(selectedType)?make=\(id)", apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
                  //
                  
                print(responseSuccess)
                  
                vehicleModelsParsers().vehicleModelsParser(fromJSON: responseSuccess) { (carModelsArr) in
                    self.carModels = carModelsArr
                    onSuccess(true)
                }

          }) { (responseFailure) in
                  //
        }
    }

}
