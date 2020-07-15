//
//  AppDelegate.swift
//  ar
//
//  Created by Wai Shan on 15/07/2020.
//  Copyright © 2020 Wai Shan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if checkAnniversaryDateExisit() {
            self.window = UIWindow(frame: UIScreen.main.bounds)

            let storyboard = UIStoryboard(name: StringConstants.storyboardNames.main, bundle: nil)

            let anniversaryDetailVC = storyboard.instantiateViewController(withIdentifier: StringConstants.storyboardIdentifiers.anniDetailsNavigation) as! UINavigationController

            self.window?.rootViewController = anniversaryDetailVC
            self.window?.makeKeyAndVisible()
        }
        return true
    }
    
    func checkAnniversaryDateExisit() -> Bool {
        return !(UserDefaults.standard.string(forKey: StringConstants.userDefaultKeys.anniversaryDate) == nil)
    }
    
}

