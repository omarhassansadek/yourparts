//
//  productParser.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/16/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import Foundation
import SwiftyJSON

class productParser{


    func parseProductsResponse(fromOrder: Bool, fromJSON: JSON , onSuccess: @escaping (productResponse) -> () ){
        
        var productResponseSuccess = productResponse()
        
        if let count = fromJSON["count"].int {
                productResponseSuccess.count = count
        }
        if let next = fromJSON["next"].string {
                productResponseSuccess.next = next
        }
        if let previous = fromJSON["previous"].string {
                productResponseSuccess.previous = previous
        }
        
        if fromOrder{
            productResponseSuccess.results = parseProducts(fromJSON: fromJSON["order"]["items"])

        }else{
            productResponseSuccess.results = parseProducts(fromJSON: fromJSON["results"])
        }

       onSuccess(productResponseSuccess)
//
//        onSuccess(sizes)
    }

    func parseProducts(fromJSON: JSON) -> [product]{
        
        var resultsArr : [product] = []
               
               for oneProduct in fromJSON.arrayValue{

                   var productObj = product()

                   if let id = oneProduct["id"].int {
                       productObj.id = id
                   }
                   
                   if let created_at = oneProduct["created_at"].string {
                        productObj.created_at = created_at
                    }
                   
                   if let updated_at = oneProduct["updated_at"].string {
                        productObj.updated_at = updated_at
                    }
                   
                   if let active = oneProduct["active"].bool {
                        productObj.active = active
                    }
                   
                   if let product_name = oneProduct["product_name"].string {
                        productObj.product_name = product_name
                    }
                   
                   if let slug = oneProduct["slug"].string {
                        productObj.slug = slug
                    }
                   
                   if let unit_price = oneProduct["unit_price"].string {
                        productObj.unit_price = unit_price
                    }
                   
                   if let product_code = oneProduct["product_code"].string {
                        productObj.product_code = product_code
                    }
                   
                   if let quantity = oneProduct["quantity"].int {
                        productObj.quantity = quantity
                    }
                   
                   if let image = oneProduct["image"].string {
                        productObj.image = image
                    }
                   
                   if let thumbnail_image = oneProduct["thumbnail_image"].string {
                        productObj.thumbnail_image = thumbnail_image
                    }
                   
                   if let is_premium = oneProduct["is_premium"].bool {
                        productObj.is_premium = is_premium
                    }
                   
                   if let special_price = oneProduct["special_price"].string {
                        productObj.special_price = special_price
                    }
                   
                   if let weight = oneProduct["weight"].double {
                        productObj.weight = weight
                    }
                   
                   if let trademark = oneProduct["trademark"].string {
                        productObj.trademark = trademark
                    }
                   
                   if let type = oneProduct["type"].string {
                        productObj.type = type
                    }
                   
                   if let compatible_with = oneProduct["compatible_with"].string {
                        productObj.compatible_with = compatible_with
                    }
                   
                   if let piece_number = oneProduct["piece_number"].string {
                        productObj.piece_number = piece_number
                    }
                   
                   if let unit_cost = oneProduct["unit_cost"].string {
                        productObj.unit_cost = unit_cost
                    }
                   
                   if let installation_cost = oneProduct["installation_cost"].string {
                        productObj.installation_cost = installation_cost
                    }

                   if let is_new = oneProduct["is_new"].bool {
                        productObj.is_new = is_new
                   }
                   
                   if let installation_cost = oneProduct["installation_cost"].string {
                        productObj.installation_cost = installation_cost
                   }
                   
                   if let min_quantity = oneProduct["min_quantity"].int {
                           productObj.min_quantity = min_quantity
                   }
                   
                   if let is_in_stock = oneProduct["is_in_stock"].bool {
                           productObj.is_in_stock = is_in_stock
                   }
                   
                   if let most_on_demand = oneProduct["most_on_demand"].bool  {
                           productObj.most_on_demand = most_on_demand
                   }
                   
                   if let store_status = oneProduct["store_status"].int {
                           productObj.store_status = store_status
                   }
                   
                   if let polymorphic_ctype = oneProduct["polymorphic_ctype"].int {
                           productObj.polymorphic_ctype = polymorphic_ctype
                   }
                   
                   if let manufacturer = oneProduct["manufacturer"].string {
                           productObj.manufacturer = manufacturer
                   }
                   
                   if let brand = oneProduct["brand"].string {
                           productObj.brand = brand
                   }
                   
                   if let category = oneProduct["category"].int {
                           productObj.category = category
                   }
                   
                   if let tyre_size = oneProduct["tyre_size"].string {
                           productObj.tyre_size = tyre_size
                   }
                   
                   if let rim_size = oneProduct["rim_size"].string {
                           productObj.rim_size = rim_size
                   }
                   
                   if let racho_size = oneProduct["racho_size"].string {
                           productObj.racho_size = racho_size
                   }
                   
                   if let store = oneProduct["store"].string {
                           productObj.store = store
                   }
                   
                   
                   if let placeholder = oneProduct["placeholder"].string {
                           productObj.placeholder = placeholder
                   }
                   
                   resultsArr.append(productObj)
               }
        
            return resultsArr
    }
    
}
