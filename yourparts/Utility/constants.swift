//
//  constants.swift
//  yourparts
//
//  Created by iMac1 on 6/23/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit

var greyColor = UIColor(displayP3Red: 72/255, green: 72/255, blue: 72/255, alpha: 1.0)

var anotherGreyColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1.0)


var cyanColor = UIColor(displayP3Red: 0/255, green: 151/255, blue: 255/255, alpha: 1.0)


var primaryColor = UIColor(displayP3Red: 239/255, green: 61/255, blue: 85/255, alpha: 1.0)

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
