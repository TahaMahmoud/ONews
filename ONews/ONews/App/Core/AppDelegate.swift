//
//  AppDelegate.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import UIKit
import IQKeyboardManager
import MOLH

@main
class AppDelegate: UIResponder, UIApplicationDelegate, MOLHResetable {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        
        // keyboard toggle
        IQKeyboardManager.shared().isEnabled = true

        // Handle Localization
        MOLH.shared.activate(true)
        
        handleAppStart()
        
        return true
    }

    func handleAppStart() {
        appCoordinator = AppCoordinator(window: window!)
        appCoordinator?.start()
    }
    
    func reset() {
        handleAppStart()
    }

}

