//
//  Application.swift
//  yourparts
//
//  Created by Yourparts #1 on 10/11/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import MOLH

class Application: UIApplication,UIApplicationDelegate {
    
    override open var userInterfaceLayoutDirection: UIUserInterfaceLayoutDirection {
        
        get {
            
            if MOLHLanguage.isRTLLanguage()    {
                
                return .rightToLeft
                
            }else {
                
                return .leftToRight
                
            }
            
        }
    }
    
}
