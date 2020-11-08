//
//  AppDelegate.swift
//  yourparts
//
//  Created by iMac1 on 6/15/20.
//  Copyright © 2020 yourparts. All rights reserved.
//

import UIKit
import MOLH
import IQKeyboardManagerSwift
import FBSDKCoreKit
import FBAudienceNetwork
import SmartlookConsentSDK

//@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, MOLHResetable {
    
    var window: UIWindow?
    
    //    func checkConsentStates() {
    //        var consentsSettingsDefaults = SmartlookConsentSDK.ConsentsSettings()
    //        consentsSettingsDefaults.append((.privacy, .provided))
    //        consentsSettingsDefaults.append((.analytics, .provided))
    //        //        consentsSettingsDefaults.append(("gdpr", .notProvided))   // adding a custom consent
    //        //        SmartlookConsentSDK.check(with: consentsSettingsDefaults) {
    //        ////            if SmartlookConsentSDK.consentState(for: .analytics) == .provided {
    //        ////                // start analytics tools
    //        ////                // Smartlook.start(withKey: "1a2b3c4e5f60")
    //        ////                FBAdSettings.setAdvertiserTrackingEnabled(true)
    //        ////            }else{
    //        ////                FBAdSettings.setAdvertiserTrackingEnabled(false)
    //        ////            }
    //        //        }
    //
    //    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        MOLH.setLanguageTo("ar")
        MOLH.shared.activate(true)
        reset()
        
        //MARK:- IQKeyboard Manager Configuration
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Dismiss".localized
        
        ApplicationDelegate.shared.application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )
        
        FBAdSettings.setAdvertiserTrackingEnabled(true)
        
        return true
    }
    
    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        
        ApplicationDelegate.shared.application(
            app,
            open: url,
            sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
            annotation: options[UIApplication.OpenURLOptionsKey.annotation]
        )
        
    }
    
    func reset() {
        let rootViewController: UIWindow = ((UIApplication.shared.delegate?.window)!)!
        //main for main
        let story = UIStoryboard(name: "Auth", bundle: nil)
        //rootViewController.rootViewController = story.instantiateViewController(withIdentifier: "tabx")
        rootViewController.rootViewController = story.instantiateViewController(withIdentifier: "firstAuth")
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        FBAdSettings.setAdvertiserTrackingEnabled(true)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
}

extension String{
    
    var localized: String{
        return NSLocalizedString(self, comment: "")
    }
    
}
