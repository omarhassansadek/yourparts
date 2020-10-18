//
//  addressParser.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/27/20.
//  Copyright © 2020 yourparts. All rights reserved.
//
import Foundation
import SwiftyJSON


class addressParser{
    

   func parseAddresses( fromJSON: JSON , onSuccess: @escaping ([address]) -> () ){

    
        var addressArr : [address] = []
    
        for oneAddress in fromJSON["billing_addresses"].arrayValue{
                 var addObj = address()

                  if let priority = oneAddress["priority"].int {
                        addObj.priority = priority
                  }
            
                  if let address = oneAddress["address"].string {
                        addObj.address = address
                  }
            
                  if let zip_code = oneAddress["zip_code"].string {
                        addObj.zip_code = zip_code
                  }
            
                  if let region = oneAddress["region"].string {
                    addObj.region = region
                  }
            
                 if let city = oneAddress["city"].string {
                         addObj.city = city
                 }
            
                 if let customer_id = oneAddress["customer_id"].int {
                         addObj.customer_id = customer_id
                 }
            
                 if let id = oneAddress["id"].int {
                        addObj.id = id
                 }
                
                addressArr.append(addObj)
        }
    
        onSuccess(addressArr)
    
    }
    
    
}
