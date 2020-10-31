//
//  vehicleMakersParser.swift
//  yourparts
//
//  Created by Yourparts #1 on 10/1/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import Foundation
import SwiftyJSON


class vehicleTypesParser{
    
    func vehicleTypesParser( fromJSON: JSON , onSuccess: @escaping ([carType]) -> () ) {
        
        var typesArr:[carType] = []
            
        for oneType in fromJSON["results"].arrayValue {
            
            let carTypeObj = carType()
                     
            if let id = oneType["id"].int {
                carTypeObj.id = id
            }
                    
            if let name = oneType["name"].string {
                carTypeObj.name = name
             }
                         
             if let date_created = oneType["date_created"].string {
               // carTypeObj.date_created = date_created
             }
                         
            typesArr.append(carTypeObj)
        }
        
        onSuccess(typesArr)
    }
}
