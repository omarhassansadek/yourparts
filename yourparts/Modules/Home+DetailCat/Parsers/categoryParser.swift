
import Foundation
import SwiftyJSON


class categoryParser{
    
//    func parseCampaigns(fromResponse jsonResponse: JSON, intoResponse resultResponse: CampaignsResponse) -> CampaignsResponse {
//        //resultResponse.data?.removeAll()
//        var filledResponse = resultResponse
//
//
//        for campaign in jsonResponse["data"]["data"].arrayValue{
//            let campaignObject = self.parseOneCampaign(fromResponse: campaign)
//            resultResponse.data?.append(campaignObject)
//        }
//
//
//        filledResponse = PagingResponseParser().parseBrands(fromResponse: jsonResponse, intoResponse: filledResponse) as! CampaignsResponse
//        return filledResponse
//    }

    
    func parseDetailCategories(isSub: Bool, fromJSON: JSON , onSuccess: @escaping (category) -> () ){
        var detailCategory = category()
        
        var jsonResponse = fromJSON
        
        var catObj = category()
        
        if isSub{
            jsonResponse = jsonResponse["results"].arrayValue[0]
             catObj = self.parseCat(slidingCat: false, oneCategory: jsonResponse)

        }else{
             catObj = self.parseCat(slidingCat: false, oneCategory: jsonResponse["results"])

        }
        
        if isSub{
            
               for oneCat in jsonResponse["children_category"].arrayValue{
                   
                   var detailCat = self.parseCat(slidingCat: false, oneCategory: oneCat)
                   catObj.detailCat.append(detailCat)
                   
               }
        }else{
            
               for oneCat in jsonResponse["results"]["children_category"].arrayValue{
                   
                   var detailCat = self.parseCat(slidingCat: false, oneCategory: oneCat)
                   catObj.detailCat.append(detailCat)
                   
               }
        }
   
        
        onSuccess(catObj)
    }
    
    func parseCategories(slidingCat: Bool, fromResponse jsonResponse: JSON , intoResponse resultResponse: categoryResposne, onSuccess: @escaping (categoryResposne) -> () ) {
        
        //Parse main categories, slidingCat is a boolean if true -> parse json of frequentlyneeded&WhatCatNeeds categories
        var filledResponse = resultResponse

        
        //var catArr:[category] = []
        
        for (index,oneCategory) in jsonResponse["results"].arrayValue.enumerated() {

            var catObj =  self.parseCat(slidingCat: slidingCat, oneCategory: oneCategory)
            if jsonResponse["count"].int != nil{
                catObj.image = "cat\(index + 1)"

            }
            
            filledResponse.data?.append(catObj)
            
        }
        
        filledResponse = PagingResponseParser().parseDataWithPaging(fromResponse: jsonResponse, intoResponse: filledResponse) as! categoryResposne
        
        
        onSuccess(filledResponse)
    }
    
    
    func parseCat(slidingCat:Bool , oneCategory : JSON) -> category{
        
        var catObj = category()
        
        
        
        if slidingCat{
            if let id = oneCategory["category"]["id"].int {
                catObj.id = id
            }
        }else{
            
            if let id = oneCategory["id"].int {
                catObj.id = id
            }
        }
        if let slug = oneCategory["slug"].string {
            catObj.slug = slug
        }
        
        if slidingCat{
            if let name = oneCategory["category"]["name"].string {
                catObj.name = name
            }
        }else{
            if let name = oneCategory["name"].string {
                catObj.name = name
            }
        }
        
        if slidingCat{
            if let name = oneCategory["category"]["image"].string {
                //catObj.image = name
            }
        }else{
            
            if let image = oneCategory["image"].string {
                catObj.image = image
                
            }
        }
        
        
        if let most_important = oneCategory["most_important"].bool {
            catObj.most_important = most_important
        }
        
        
        if let most_on_demand = oneCategory["most_on_demand"].bool {
            catObj.most_on_demand = most_on_demand
        }
        
        if let parent = oneCategory["parent"].string {
            catObj.parent = parent
        }
        
        if let category_level = oneCategory["category_level"].string {
            catObj.category_level = category_level
        }
        
        if let user_has_car = oneCategory["user_has_car"].bool {
            catObj.user_has_car = user_has_car
        }
        
        if let category_needed_car = oneCategory["category_needed_car"].bool {
            catObj.category_needed_car = category_needed_car
        }

        //for oneDetailCat in fromJSON[""]
        
        return catObj
    }
}
