//
//  SavedRouter.swift
//  ONews
//
//  Created by Taha on 05/03/2022.
//

import UIKit

// MARK: Saved Router -

class SavedRouter: Coordinator {
    
    unowned let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let view =  SavedViewController()
        let interactor = SavedInteractor(networkManager: AlamofireManager())
        let router = SavedRouter(navigationController: navigationController)
        
        let presenter = SavedPresenter(view: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter

        navigationController.navigationBar.isHidden = true
        navigationController.setViewControllers([view], animated: true)

        // navigationController.pushViewController(view, animated: true)
    }

}


extension SavedRouter: SavedRouterProtocol {
    
    func navigateToHome() {
        let homeRouter = HomeRouter(navigationController: navigationController)
        homeRouter.start()
    }
    
    func navigateToSettings() {
        // let settingsRouter = SettingsRouter(navigationController: navigationController)
        // settingsRouter.start()
    }
    
    func navigateToArticleDetails(article: Article) {
        let articleDetailsRouter = ArticleDetailsRouter(navigationController: navigationController, article: article)
        articleDetailsRouter.start()

    }
    
    
}
