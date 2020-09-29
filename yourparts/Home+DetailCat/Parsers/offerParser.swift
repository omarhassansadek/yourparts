//
//  offerParser.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/29/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import Foundation

import SwiftyJSON


class offerParser{
  
    func parserOffers( fromJSON: JSON , onSuccess: @escaping ([offer]) -> () ){
         
         
         var offersArr : [offer] = []
         
         for oneOffer in fromJSON["results"].arrayValue{
             
             var offerObj  = offer()

             if let id = oneOffer["id"].int {
                    offerObj.id = id
             }
             
             if let title = oneOffer["title"].string {
                    offerObj.title = title
              }
             
             if let subtitle = oneOffer["subtitle"].string {
                    offerObj.subtitle = subtitle
              }
            
              if let image = oneOffer["image"].string {
                    offerObj.image = image
              }
            
              if let url = oneOffer["url"].string {
                    offerObj.url = url
              }
            
              if let end_date_time = oneOffer["end_date_time"].string {
                    offerObj.end_date_time = end_date_time
              }

            
              if let offer_type = oneOffer["offer_type"].string {
                    offerObj.offer_type = offer_type
              }
            
            
              if let is_active = oneOffer["is_active"].bool {
                    offerObj.is_active = is_active
              }
            
              if let categories_included = oneOffer["categories_included"].array {
                    //offerObj.categories_included = categories_included
                    for oneCat in categories_included{
                        offerObj.categories_included?.append(oneCat.int ?? -1)
                    }
               }

               if let products_included = oneOffer["products_included"].array {
                      //offerObj.categories_included = categories_included
                      for oneProduct in products_included{
                          offerObj.products_included?.append(oneProduct.int ?? -1)
                      }
                }

             offersArr.append(offerObj)
         }
         
         onSuccess(offersArr)
     }


}
