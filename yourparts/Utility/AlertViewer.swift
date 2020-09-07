//
//  AlertViewer.swift
//  phLog
//
//  Created by iMac1 on 9/23/18.
//  Copyright © 2018 Softmills. All rights reserved.
//

import UIKit

class AlertViewer: NSObject {
    
     var alert = UIAlertController()
     var timer  = Timer()
    
     func showAlertView(withMessage msg: String,onController controller: UIViewController) {
        alert = UIAlertController(title: "YourParts", message: msg, preferredStyle: UIAlertController.Style.actionSheet)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            UIAlertAction in
            self.alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        controller.present(alert, animated: true, completion: nil)
        //timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.dissmissAlertView), userInfo: nil, repeats: false)
    }
    
    func showAlertViewBtnDynamic(withMessage msg: String,onController controller: UIViewController, btnTitle btn: String) {
        alert = UIAlertController(title: "YourParts", message: msg, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: btn , style: UIAlertAction.Style.default) {
            UIAlertAction in
            self.alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        controller.present(alert, animated: true, completion: nil)
        //timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.dissmissAlertView), userInfo: nil, repeats: false)
    }
    
    func showAlertViewWithCustomAction(withMessage msg: String,onController controller: UIViewController, andAction action: @escaping(UIAlertAction)->()) {
        alert = UIAlertController(title: "YourParts", message: msg, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: action)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default) {
            UIAlertAction in
            self.alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        controller.present(alert, animated: true, completion: nil)
        //timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.dissmissAlertView), userInfo: nil, repeats: false)
    }
    
    
    @objc  func dissmissAlertView() {
        alert.dismiss(animated: true, completion: nil)
    }
    
    func showAlertOutsideController(msg: String) {
        var topWindow: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
        topWindow?.rootViewController = UIViewController()
        topWindow?.windowLevel = UIWindow.Level.alert + 1
        let alert = UIAlertController(title: "YourParts", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "confirm"), style: .cancel, handler: {(_ action: UIAlertAction) -> Void in
            // continue your work
            // important to hide the window after work completed.
            // this also keeps a reference to the window until the action is invoked.
            topWindow?.isHidden = true // if you want to hide the topwindow then use this
            topWindow = nil // if you want to hide the topwindow then use this
        }))
        topWindow?.makeKeyAndVisible()
        topWindow?.rootViewController?.present(alert, animated: true, completion: {})
    }
    

}
