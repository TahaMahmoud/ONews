//
//  SelectPreferencesRouter.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import UIKit

// MARK: SelectPreferences Router -

class SelectPreferencesRouter: Coordinator {
    
    unowned let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let view =  SelectPreferencesViewController()
        let interactor = SelectPreferencesInteractor(networkManager: AlamofireManager())
        let router = SelectPreferencesRouter(navigationController: navigationController)
        
        let presenter = SelectPreferencesPresenter(view: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter

        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(view, animated: true)

    }

}


extension SelectPreferencesRouter: SelectPreferencesRouterProtocol {
    
    func navigateToHome() {
        // let homeRouter = HomeRouter(navigationController: navigationController)
        // homeRouter.start()
    }
    
}
