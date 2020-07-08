//
//  menuVM.swift
//  yourparts
//
//  Created by iMac1 on 6/29/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

class menuViewModel: NSObject {
    
    var menuListArr : [profileMenu] = []
    
    
    func populateArrMenu(completion: @escaping(Bool)->()){
        let obj1 = profileMenu(img: "yourpartsico", mTitle: "خدمتنا الأساسية", sTitle: "")
        self.menuListArr.append(obj1)
        
        let obj2 = profileMenu(img: "", mTitle: "قطع غيار" , sTitle: "أكثر من ٤٠٠٠٠ قطعة متوفرة")
        self.menuListArr.append(obj2)
        
        let obj3 = profileMenu(img: "", mTitle: "الأجزاء الداخلية و الخارجية", sTitle: "أكثر من ٤٣٠٠٠ قطعة متوفرة")
        self.menuListArr.append(obj3)
        
        let obj4 = profileMenu(img: "", mTitle: "كاوتش و جنوط", sTitle: "أكثر من ٤٣٠٠٠ قطعة متوفرة")
        self.menuListArr.append(obj4)
        
        let obj5 = profileMenu(img: "", mTitle: "قطع غيار أستيراد", sTitle: "أكثر من ٤٣٠٠٠ قطعة متوفرة")
        self.menuListArr.append(obj5)
        
        let obj6 = profileMenu(img: "", mTitle: "زيوت المحرك و السوائل", sTitle: "أكثر من ٤٣٠٠٠ قطعة متوفرة")
        self.menuListArr.append(obj6)
        
        let obj7 = profileMenu(img: "profileicoWhite", mTitle: "صفحتي الشخصية", sTitle: "")
        self.menuListArr.append(obj7)
        
        let obj8 = profileMenu(img: "profileico5", mTitle: "عمليات الشراء السابقة", sTitle: "١٢ عملية شراء ناجحة")
        self.menuListArr.append(obj8)
        
        let obj9 = profileMenu(img: "undergoingico", mTitle: "عمليات الشراء تحت التنفيذ", sTitle: "عملية شراء تحت التنفيد")
        self.menuListArr.append(obj9)
        
        let obj10 = profileMenu(img: "favicoWhite", mTitle: "المفضلة", sTitle: "")
        self.menuListArr.append(obj10)
        
        let obj11 = profileMenu(img: "profileico5", mTitle: "عربة التسوق", sTitle: "قطعك المضافة لعربة النسوق")
        self.menuListArr.append(obj6)
        
        let obj12 = profileMenu(img: "searchicoWhite", mTitle: "ابحث عن قطعة غيار", sTitle: "")
        self.menuListArr.append(obj12)
        
        let obj13 = profileMenu(img: "", mTitle: "شركائنا", sTitle: "")
        self.menuListArr.append(obj13)
        
        let obj14 = profileMenu(img: "", mTitle: "شركات قطع الغيار", sTitle: "")
        self.menuListArr.append(obj14)
        
        let obj15 = profileMenu(img: "", mTitle: "وكلاء السيارات", sTitle: "")
        self.menuListArr.append(obj15)
        
        let obj16 = profileMenu(img: "", mTitle: "ماركات السيارات", sTitle: "")
        self.menuListArr.append(obj16)
        
        let obj17 = profileMenu(img: "", mTitle: "المتاجر المعتمدة لدى يور بارتس", sTitle: "")
        self.menuListArr.append(obj17)
        
        let obj18 = profileMenu(img: "", mTitle: "عن يور بارتس", sTitle: "")
        self.menuListArr.append(obj18)
        
        let obj19 = profileMenu(img: "", mTitle: "خدماتنا", sTitle: "")
        self.menuListArr.append(obj19)
        
        let obj20 = profileMenu(img: "", mTitle: "أسئلة شائعة", sTitle: "")
        self.menuListArr.append(obj20)
        
        let obj21 = profileMenu(img: "", mTitle: "الدعم و المساعدة", sTitle: "")
        self.menuListArr.append(obj21)
        
        let obj22 = profileMenu(img: "", mTitle: "تواصل مع فريق يور بارتس", sTitle: "")
        self.menuListArr.append(obj22)
        
        let obj23 = profileMenu(img: "", mTitle: "شروط الأستخدام", sTitle: "")
        self.menuListArr.append(obj23)
        
        let obj24 = profileMenu(img: "", mTitle: "حقوق الملكية", sTitle: "")
        self.menuListArr.append(obj24)
        
        completion(true)
        
    }
}
