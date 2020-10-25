//
//  categoryResponse.swift
//  yourparts
//
//  Created by Yourparts #1 on 10/25/20.
//  Copyright © 2020 yourparts. All rights reserved.
//
import Foundation
class categoryResposne: PagingResponse {

    var data : [category]?
    
    override init() {
        super.init()
        data = [category]()
    }
    
    init(data: [category],previous: String ,next : String,count : Int ) {
        
        super.init(previous: previous, next: next, count: count)
        
        self.data = data
    }
    
}
