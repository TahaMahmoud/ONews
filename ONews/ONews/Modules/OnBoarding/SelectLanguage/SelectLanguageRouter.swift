//
//  SelectLanguageRouter.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import UIKit

// MARK: SelectLanguage Router -

class SelectLanguageRouter: Coordinator {
    
    unowned let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let view =  SelectLanguageViewController()
        let interactor = SelectLanguageInteractor(networkManager: AlamofireManager())
        let router = SelectLanguageRouter(navigationController: navigationController)
        
        let presenter = SelectLanguagePresenter(view: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter

        navigationController.navigationBar.isHidden = true
        
        navigationController.pushViewController(view, animated: true)
        
    }

}


extension SelectLanguageRouter: SelectLanguageRouterProtocol {
    
    func restartApp() {
        // to handle change language in the select language screen
    }
    
    func navigateToSelectPreferences() {
        let selectPreferencesRouter = SelectPreferencesRouter(navigationController: navigationController)
        selectPreferencesRouter.start()
    }

}
