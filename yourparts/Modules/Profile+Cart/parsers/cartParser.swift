//
//  cartParser.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/17/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import Foundation

import SwiftyJSON

class cartParser{
    
    func parseCartData( fromJSON: JSON , onSuccess: @escaping ([product]) -> () ){
        
        var cartProductsArr: [product] = []

        for oneCart in fromJSON["items"].arrayValue{
            
            let cartObj = product()

            if let id = oneCart["id"].int {
                    cartObj.id = id
            }
            
            if let is_installation_cost = oneCart["is_installation_cost"].bool {
                    cartObj.is_installation_cost = is_installation_cost
            }
            
            if let is_ship_same_day = oneCart["is_ship_same_day"].bool {
                    cartObj.is_ship_same_day = is_ship_same_day
            }
            
            if let created_at = oneCart["sparepart"]["created_at"].string {
                    cartObj.created_at = created_at
            }
            if let active = oneCart["sparepart"]["active"].bool {
                    cartObj.active = active
            }
            if let product_name = oneCart["sparepart"]["product_name"].string {
                    cartObj.product_name = product_name
            }
            if let slug = oneCart["sparepart"]["slug"].string {
                    cartObj.slug = slug
            }
            if let unit_price = oneCart["sparepart"]["unit_price"].string {
                 cartObj.unit_price = unit_price
            }
            if let product_code = oneCart["sparepart"]["product_code"].string {
                 cartObj.product_code = product_code
            }
            if let quantity = oneCart["quantity"].int {
                 cartObj.quantity = quantity
            }
            if let image = oneCart["sparepart"]["image"].string {
                 cartObj.image = image
            }
            if let thumbnail_image = oneCart["sparepart"]["thumbnail_image"].string {
                 cartObj.thumbnail_image = thumbnail_image
            }
            if let small_image = oneCart["sparepart"]["small_image"].string {
                 cartObj.small_image = small_image
            }
            if let is_premium = oneCart["sparepart"]["is_premium"].bool {
                 cartObj.is_premium = is_premium
            }
            if let special_price = oneCart["sparepart"]["special_price"].string {
                 cartObj.special_price = special_price
            }
            if let weight = oneCart["sparepart"]["weight"].double {
                 cartObj.weight = weight
            }
            if let trademark = oneCart["sparepart"]["trademark"].string {
                 cartObj.trademark = trademark
            }
            if let type = oneCart["sparepart"]["type"].string {
                 cartObj.type = type
            }
            if let compatible_with = oneCart["sparepart"]["compatible_with"].string {
                 cartObj.compatible_with = compatible_with
            }
            if let piece_number = oneCart["sparepart"]["piece_number"].string {
                 cartObj.piece_number = piece_number
            }
            if let unit_cost = oneCart["sparepart"]["unit_cost"].string {
                 cartObj.unit_cost = unit_cost
            }
            if let installation_cost = oneCart["sparepart"]["installation_cost"].string {
                 cartObj.installation_cost = installation_cost
            }
            if let is_new = oneCart["sparepart"]["is_new"].bool {
                 cartObj.is_new = is_new
            }
            if let min_quantity = oneCart["sparepart"]["min_quantity"].int {
                 cartObj.min_quantity = min_quantity
            }
            if let is_in_stock = oneCart["sparepart"]["is_in_stock"].bool {
                 cartObj.is_in_stock = is_in_stock
            }
            if let most_on_demand = oneCart["sparepart"]["most_on_demand"].bool {
                 cartObj.most_on_demand = most_on_demand
            }
            if let store_status = oneCart["sparepart"]["store_status"].int {
                 cartObj.store_status = store_status
            }
            if let last_updated = oneCart["sparepart"]["last_updated"].string {
                 cartObj.last_updated = last_updated
            }
            if let polymorphic_ctype = oneCart["sparepart"]["polymorphic_ctype"].int {
                 cartObj.polymorphic_ctype = polymorphic_ctype
            }
//            if let manufacturer = oneCart["sparepart"]["manufacturer"].int {
//                 cartObj.manufacturer = manufacturer
//            }
            
            
            if let brandJSON = oneCart["sparepart"]["brand"].dictionary {
                cartObj.brand = brand()
                cartObj.brand?.brand_name = brandJSON["brand_name"]?.string
                cartObj.brand?.id = brandJSON["id"]?.int
                cartObj.brand?.image = brandJSON["image"]?.string
                //cartObj.brand = brand
                
            }
                

            if let polymorphic_ctype = oneCart["sparepart"]["polymorphic_ctype"].int {
                 cartObj.polymorphic_ctype = polymorphic_ctype
            }
            if let category = oneCart["sparepart"]["category"].int {
                 cartObj.category = category
            }
            if let tyre_size = oneCart["sparepart"]["tyre_size"].string {
                 cartObj.tyre_size = tyre_size
            }
            if let rim_size = oneCart["sparepart"]["rim_size"].string {
                 cartObj.rim_size = rim_size
            }
            if let racho_size = oneCart["sparepart"]["racho_size"].string {
                 cartObj.racho_size = racho_size
            }
            if let store = oneCart["sparepart"]["store"].string {
                 cartObj.store = store
            }
            if let placeholder = oneCart["sparepart"]["placeholder"].string {
                 cartObj.placeholder = placeholder
            }

            cartProductsArr.append(cartObj)
            
        }

//
        onSuccess(cartProductsArr)
    }
    
}

