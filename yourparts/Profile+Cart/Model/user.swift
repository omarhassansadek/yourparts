//
//  user.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/29/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import Foundation

class user{
    
    var id: Int?
    var firstname: String?
    var lastname: String?
    var email: String?
    var shipping_addresses: [address]?
    var billing_addresses: [address]?
    var phone_number: String?
    var facebook_id: Int?
    var profile_picture: String?
    var referred_by: String?
    var total_points: Int?
}
