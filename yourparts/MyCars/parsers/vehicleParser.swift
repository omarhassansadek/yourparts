
//
//  File.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/10/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import Foundation
import SwiftyJSON


class vehicleParser{
    
    func parseVehicles( fromJSON: JSON , onSuccess: @escaping ([vehicle]) -> () ) {
            
              var vehiclesArr:[vehicle] = []
        
              for oneVehicle in fromJSON["results"].arrayValue {
//
                    var OneVehicleArray = vehicle()
//
                  if let id = oneVehicle["vehicle"]["id"].int {
                      OneVehicleArray.id = id
                  }
                
                 OneVehicleArray.model = self.parseCarModel(fromJSON: oneVehicle["vehicle"]["model"])
                
                  if let year = oneVehicle["year"].int {
                      OneVehicleArray.year = year
                  }
                  if let date_created = oneVehicle["date_created"].string {
                      OneVehicleArray.date_created = date_created
                  }
                 if let date_updated = oneVehicle["date_updated"].string {
                      OneVehicleArray.date_updated = date_updated
                  }

                vehiclesArr.append(OneVehicleArray)

            }
                
              
             onSuccess(vehiclesArr)
    }
    
    func parseCarModel ( fromJSON: JSON ) -> carModel {
    
        var oneCarModel = carModel()
    
        if let id = fromJSON["id"].int {
            oneCarModel.id = id
        }
   
        if let name = fromJSON["name"].string {
                oneCarModel.name = name
        }
        
        
        if let most_common = fromJSON["most_common"].bool {
                oneCarModel.most_common = most_common
        }
        
        
        if let date_created = fromJSON["date_created"].string {
                oneCarModel.date_created = date_created
        }

        
        if let date_updated = fromJSON["date_updated"].string {
                oneCarModel.date_updated = date_updated
        }
        
        oneCarModel.maker = self.parseCarMaker(fromJSON: fromJSON["make"])
        
        return oneCarModel
    }
    
    
    func parseCarMaker ( fromJSON: JSON ) -> maker {
     
         var oneCarMaker = maker()
     
         if let id = fromJSON["id"].int {
             oneCarMaker.id = id
         }
    
         if let name = fromJSON["name"].string {
                 oneCarMaker.name = name
         }
         
        if let description = fromJSON["description"].string {
                  oneCarMaker.description = description
          }
          
 
        if let image = fromJSON["image"].string {
                   oneCarMaker.image = image
           }
        
        
         if let most_common = fromJSON["most_common"].bool {
                 oneCarMaker.most_common = most_common
         }
         
         
         if let date_created = fromJSON["date_created"].string {
                 oneCarMaker.date_created = date_created
         }

         
         if let updated_at = fromJSON["updated_at"].string {
                 oneCarMaker.updated_at = updated_at
         }
         
        oneCarMaker.type = self.parseCarType(fromJSON: fromJSON["type"])
         
         return oneCarMaker
     }
    
    
    func parseCarType ( fromJSON: JSON ) -> carType {
                
            var oneCarType = carType()
           
               if let id = fromJSON["id"].int {
                   oneCarType.id = id
               }
          
               if let name = fromJSON["name"].string {
                       oneCarType.name = name
               }
               
              if let date_created = fromJSON["date_created"].string {
                        oneCarType.date_created = date_created
              }
               
              return oneCarType
    
    }
    
    
    
}
