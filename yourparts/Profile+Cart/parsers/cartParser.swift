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


    func parseCartData( fromJSON: JSON , onSuccess: @escaping ([cart]) -> () ){
        
        var cartArr: [cart] = []

        for oneCart in fromJSON["results"].arrayValue{
            
            var cartObj = cart()

            if let id = oneCart["id"].int {
                    cartObj.id = id
            }
            if let product_code = oneCart["product_code"].string {
                    cartObj.product_code = product_code
            }
            if let updated_at = oneCart["updated_at"].string {
                    cartObj.updated_at = updated_at
            }
            if let quantity = oneCart["quantity"].int {
                    cartObj.quantity = quantity
            }
            if let cart = oneCart["cart"].int {
                    cartObj.cart = cart
            }
            
            if let product = oneCart["product"].int {
                    cartObj.product = product
            }

            cartArr.append(cartObj)
            
        }

//
        onSuccess(cartArr)
    }
    
}

