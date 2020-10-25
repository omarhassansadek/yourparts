//
//  pagingResponseParser.swift
//  yourparts
//
//  Created by Yourparts #1 on 10/25/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import Foundation
import SwiftyJSON

class PagingResponseParser {

    func parseDataWithPaging(fromResponse jsonResponse: JSON, intoResponse resultResponse: PagingResponse) -> PagingResponse {
        
        if let count = jsonResponse["count"].int{
            resultResponse.count = count
        }
        if let next = jsonResponse["next"].string{
            resultResponse.next = next
        }
        if let previous = jsonResponse["previous"].string{
            resultResponse.previous = previous
        }
        return resultResponse
    }
}
