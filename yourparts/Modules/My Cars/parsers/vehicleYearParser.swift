//
//  vehicleYearParser.swift
//  yourparts
//
//  Created by Yourparts #1 on 10/4/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import Foundation
import SwiftyJSON

class vehicleYearParsers{
    
    func vehicleYearParsers( fromJSON: JSON , onSuccess: @escaping ([carYear]) -> () ) {
        
        var carYearsArr:[carYear] = []
        
        for oneYear in fromJSON["results"].arrayValue {
            
            var carYearObj = carYear()
            
            if let id = oneYear["id"].int {
                carYearObj.id = id
            }
            if let model = oneYear["model"].int {
                carYearObj.model = model
            }
            if let year = oneYear["year"].int {
                carYearObj.year = year
            }
            if let date_created = oneYear["date_created"].string {
                
            }
            
            carYearsArr.append(carYearObj)
            
        }
        
        onSuccess(carYearsArr)
        
    }
}
