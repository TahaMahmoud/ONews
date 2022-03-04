//
//  HomeRouter.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import UIKit

// MARK: Home Router -

class HomeRouter: Coordinator {
    
    unowned let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let view =  HomeViewController()
        let interactor = HomeInteractor(networkManager: AlamofireManager())
        let router = HomeRouter(navigationController: navigationController)
        
        let presenter = HomePresenter(view: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter

        navigationController.navigationBar.isHidden = true
        navigationController.setViewControllers([view], animated: true)
        
        // navigationController.pushViewController(view, animated: true)
    }

}


extension HomeRouter: HomeRouterProtocol {
    
    func navigateToSavedArticles() {
        // let savedRouter = SavedRouter(navigationController: navigationController)
        // savedRouter.start()
    }
    
    func navigateToSettings() {
        // let selectLanguageRouter = SelectLanguageRouter(navigationController: navigationController)
        // selectLanguageRouter.start()
    }
    
    func navigateToArticleDetails(article: Article) {
        // let articleDetailsRouter = ArticleDetailsRouter(navigationController: navigationController, article: article)
        // articleDetailsRouter.start()
    }
    
}
