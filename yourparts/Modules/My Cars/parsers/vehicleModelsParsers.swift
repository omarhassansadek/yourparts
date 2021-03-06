//
//  vehicleModelsParsers.swift
//  yourparts
//
//  Created by Yourparts #1 on 10/1/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import Foundation
import SwiftyJSON

class vehicleModelsParsers{
    
    func vehicleModelsParser( fromJSON: JSON , onSuccess: @escaping ([carModel]) -> () ) {
        
        var carModelsArr:[carModel] = []
        
        for oneModel in fromJSON["results"].arrayValue {
            let carModelObj = carModel()
            
            if let id = oneModel["id"].int {
                carModelObj.id = id
            }
            if let name = oneModel["name"].string {
                carModelObj.name = name
            }
            if let date_created = oneModel["date_created"].string {
                
            }
            
            carModelsArr.append(carModelObj)
            
        }
        
        onSuccess(carModelsArr)
        
    }
}
