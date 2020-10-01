//
//  vehicleMarkerParser.swift
//  yourparts
//
//  Created by Yourparts #1 on 10/1/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import Foundation
import SwiftyJSON


class vehicleMarkerParser{
    
    func vehicleMakersParser( fromJSON: JSON , onSuccess: @escaping ([maker]) -> () ) {
        
        var makersArr:[maker] = []
            
        for oneMaker in fromJSON.arrayValue {
            
            var carMakerObj = maker()
                     
            if let id = oneMaker["id"].int {
                carMakerObj.id = id
            }
                    
            if let name = oneMaker["name"].string {
                carMakerObj.name = name
             }
                         
             if let date_created = oneMaker["date_created"].string {
               // carTypeObj.date_created = date_created
             }
                         
            makersArr.append(carMakerObj)
   
        }
        
        onSuccess(makersArr)
        
    }
}
