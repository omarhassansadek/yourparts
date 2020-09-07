//
//  EmptyFieldValidator.swift
//  phLog
//
//  Created by iMac1 on 9/16/18.
//  Copyright © 2018 Softmills. All rights reserved.
//

import UIKit

class EmptyFieldValidator: NSObject {

    static func isFieldEmpty(field: UITextField) -> Bool {
        if field.text == nil || field.text == ""{
            return false
        }else{
            return true
        }
    }
    
    static func isFieldFilled(field: UITextField) -> Bool {
        if field.text == nil || field.text == ""{
            return false
        }else{
            return true
        }
    }
}
