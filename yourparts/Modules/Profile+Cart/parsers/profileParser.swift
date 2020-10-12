//
//  profileParser.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/29/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import Foundation
import SwiftyJSON

class profileParser{
     

    func parseProfiles( fromJSON: JSON , onSuccess: @escaping (user) -> () ){
        
        var userObj = user()
        
        if let id = fromJSON["id"].int {
            userObj.id = id
        }
        
        if let firstname = fromJSON["firstname"].string {
            userObj.firstname = firstname
        }
        
        if let lastname = fromJSON["lastname"].string {
            userObj.lastname = lastname
        }
        
        if let email = fromJSON["email"].string {
            userObj.email = email
        }
        
        if let phone_number = fromJSON["phone_number"].string {
            userObj.phone_number = phone_number
        }
        
        if let facebook_id = fromJSON["facebook_id"].int {
            userObj.facebook_id = facebook_id
        }
        
        if let profile_picture = fromJSON["profile_picture"].string {
            userObj.profile_picture = profile_picture
        }
        
        if let referred_by = fromJSON["referred_by"].string {
            userObj.referred_by = referred_by
        }
        
        if let total_points = fromJSON["total_points"].int {
            userObj.total_points = total_points
        }
        
        
        onSuccess(userObj)
    }

}
