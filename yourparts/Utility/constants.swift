//
//  constants.swift
//  yourparts
//
//  Created by iMac1 on 6/23/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

var greyColor = UIColor(displayP3Red: 72/255, green: 72/255, blue: 72/255, alpha: 1.0)

var anotherGreyColor = UIColor(displayP3Red: 239/255, green: 239/255, blue: 239/255, alpha: 1.0)


var cyanColor = UIColor(displayP3Red: 0/255, green: 151/255, blue: 255/255, alpha: 1.0)


var primaryColor = UIColor(displayP3Red: 239/255, green: 61/255, blue: 85/255, alpha: 1.0)

var SuccessPrimaryColor =  UIColor(displayP3Red: 138/255, green: 209/255, blue: 97/255, alpha: 1.0)

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}


extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}


