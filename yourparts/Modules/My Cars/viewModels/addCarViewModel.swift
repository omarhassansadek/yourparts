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

    
    func getCarYears(id: Int, selectedType: Int, selectedMaker:Int,  onSuccess: @escaping(Bool)-> () , onFailure: @escaping(String)-> () ){
        self.addCarC.getCarTypesFromApi(url: baseUrl+myVehiclesTypeUrl+"\(selectedType)?make=\(selectedMaker)&model=\(id)", apiMethod: .get, parametersOfCall: nil, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
                  //
                  
                print(responseSuccess)
                  
                vehicleYearParsers().vehicleYearParsers(fromJSON: responseSuccess) { (carYearsArr) in
                    self.carYears = carYearsArr
                    onSuccess(true)
                }

          }) { (responseFailure) in
                  //
        }
    }
    
    
    func addCar(params: [String: Any] ,  onSuccess: @escaping([String: Any])-> () , onFailure: @escaping(String)-> () ){
        
        self.addCarC.getCarTypesFromApi(url: baseUrl+add_get_VehicleUrl, apiMethod: .post, parametersOfCall: params, apiEncoding: JSONEncoding.default, completionSuccess: { (responseSuccess) in
            //
            
            print(responseSuccess)
            
            var vehicleDic: [String: Any] = [:]
            
            if let id = responseSuccess["vehicle"].int {
                //
                vehicleDic["id"] = id
            }
            
            if let vehicle_name = responseSuccess["vehicle_name"].string {
                //
                vehicleDic["vehicle_name"] = vehicle_name
            }
            
            
            if let image = responseSuccess["image"].string {
                //
                vehicleDic["image"] = image
            }
            
            
            if let year = responseSuccess["year"].int {
                //
                vehicleDic["year"] = year
            }
            
            
            if let customer = responseSuccess["customer"].int {
                //
                vehicleDic["customer"] = customer
            }
            
            if let model_name = responseSuccess["model_name"].string {
                //
                vehicleDic["model_name"] = model_name
            }

            if let vehicle = responseSuccess["vehicle"].int {
                 //
                 vehicleDic["vehicle"] = vehicle
             }

            
            onSuccess(vehicleDic)
            
            //                vehicleYearParsers().vehicleYearParsers(fromJSON: responseSuccess) { (carYearsArr) in
            //                    self.carYears = carYearsArr
            //                    onSuccess(true)
            //                }
            
        }) { (responseFailure) in
            //
            onFailure("We encountered an error. Try agian later")
        }
    }


}
