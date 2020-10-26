//
//  productResponse.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/16/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import Foundation

class productResponse: PagingResponse{
    
    override init() {
        super.init()
        data = [product]()
    }
       
    var data: [product] = []

    init(data: [product],previous: String ,next : String,count : Int ) {
        
        super.init(previous: previous, next: next, count: count)
        
        self.data = data
    }

}


