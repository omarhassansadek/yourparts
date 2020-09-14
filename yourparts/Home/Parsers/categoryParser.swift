
import Foundation
import SwiftyJSON


class categoryParser{
    
    func parseCategories( fromJSON: JSON , onSuccess: @escaping ([category]) -> () ) {
            
              var catArr:[category] = []
        
              for oneCategory in fromJSON["results"].arrayValue {
//
                    var catObj = category()
//
                  if let id = oneCategory["vehicle"]["id"].int {
                      catObj.id = id
                  }
                
                 //OneVehicleArray.model = self.parseCarModel(fromJSON: catObj["vehicle"]["model"])
                
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
                       catObj.image = image
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
                
                   catArr.append(catObj)

            }
                
              
             onSuccess(catArr)
    }
    
}
