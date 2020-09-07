//
//  Connectivity.swift
//  phLog
//
//  Created by apple on 9/23/18.
//  Copyright © 2018 Softmills. All rights reserved.
//

import UIKit
import Alamofire

class Connectivity: NSObject {
    
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    class func showErrorConnectionAlertView(onViewController viewcontroller: UIViewController){
        AlertViewer().showAlertView(withMessage: "Please, check your Internet connection and try again", onController: viewcontroller)
    }

}
