//
//  pagingResponse.swift
//  yourparts
//
//  Created by Yourparts #1 on 10/25/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

class PagingResponse {

    var next: String?
    var previous : String?
    var count : Int?
    
    init() {}
    
    init(previous: String ,next : String,count : Int) {
        
        self.previous = previous
        self.next = next
        self.count = count
    }
    
}
