
import Foundation
import SwiftyJSON


class categoryParser{
    
    
    func parseDetailCategories(isSub: Bool, fromJSON: JSON , onSuccess: @escaping (category) -> () ){
        var detailCategory = category()
        
        var jsonResponse = fromJSON
        
        if isSub{
            jsonResponse = jsonResponse.arrayValue[0]
        }
        var catObj = self.parseCat(oneCategory: jsonResponse)
        
        for oneCat in jsonResponse["children_category"].arrayValue{
            
            var detailCat = self.parseCat(oneCategory: oneCat)
            catObj.detailCat.append(detailCat)
            
        }
        
        onSuccess(catObj)
    }
    
    func parseCategories( fromJSON: JSON , onSuccess: @escaping ([category]) -> () ) {
            
              var catArr:[category] = []
        
        for (index,oneCategory) in fromJSON["results"].arrayValue.enumerated() {
//
                var catObj =  self.parseCat(oneCategory: oneCategory)
                
                catObj.image = "cat\(index + 1)"
                
                catArr.append(catObj)

              }
                
              
             onSuccess(catArr)
    }
    
    
    func parseCat(oneCategory : JSON) -> category{
        
                            var catObj = category()

                          if let id = oneCategory["id"].int {
                              catObj.id = id
                          }
                          if let slug = oneCategory["slug"].string {
                              catObj.slug = slug
                          }
                         if let name = oneCategory["name"].string {
                              catObj.name = name
                          }
                        
                          if let image = oneCategory["image"].string {
                              // catObj.image = image
                            
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
                        
                        
                          //for oneDetailCat in fromJSON[""]
                        
                           return catObj
    }
}
