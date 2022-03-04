//
//  AppCoordinator.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import UIKit

protocol Coordinator: AnyObject {
    func start()
    func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}


class AppCoordinator: Coordinator {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()

        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        // Handle First Open

        if SettingsHandler.isLanguageSet() == false {
            let selectLanguageRouter = SelectLanguageRouter(navigationController: navigationController)
            coordinate(to: selectLanguageRouter)
        } else if SettingsHandler.isCountrySet() == false {

        } else if SettingsHandler.isPreferencesSet() == false {

        } else {
            
        }
    }
    
}
