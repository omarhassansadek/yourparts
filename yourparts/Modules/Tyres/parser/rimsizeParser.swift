//
//  rimsizeParser.swift
//  yourparts
//
//  Created by Yourparts #1 on 9/15/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import Foundation
import SwiftyJSON

class rimsizeParser{


    func parserRimSize( fromJSON: JSON , onSuccess: @escaping ([rimsize]) -> () ){
        
        
        var sizes : [rimsize] = []
        
        for oneSize in fromJSON["results"].arrayValue{
            
            var sizeObj = rimsize()

            if let id = oneSize["id"].int {
                sizeObj.id = id
            }
            
            if let size = oneSize["size"].string {
                 sizeObj.size = size
             }
            
            sizes.append(sizeObj)
        }
        
        onSuccess(sizes)
    }
}

