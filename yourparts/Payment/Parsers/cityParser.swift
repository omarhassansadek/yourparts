//
//  cityParser.swift
//  yourparts
//
//  Created by iMac1 on 9/28/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import Foundation
import SwiftyJSON


class cityParser{
    
    
    func parseCities( fromJSON: JSON , onSuccess: @escaping ([city]) -> () ){
        
        
        var citiesArr : [city] = []
        
        for oneCity in fromJSON["results"].arrayValue{
            var cityObj = city()
            
            if let id = oneCity["id"].int {
                cityObj.id = id
            }
            
            if let name = oneCity["name"].string {
                cityObj.name = name
            }
            
            if let code = oneCity["code"].string {
                cityObj.code = code
            }
            
            if let shipping_fee = oneCity["shipping_fee"].int {
                cityObj.shipping_fee = shipping_fee
            }
            
            if let region_id = oneCity["region_id"].int {
                cityObj.region_id = region_id
            }
            
            citiesArr.append(cityObj)

        }
        
        onSuccess(citiesArr)

    }
}
