//
//  ArticleDetailsRouter.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import UIKit

// MARK: ArticleDetails Router -

class ArticleDetailsRouter: Coordinator {
    
    unowned let navigationController: UINavigationController
    let article: Article
    
    init(navigationController: UINavigationController, article: Article) {
        self.navigationController = navigationController
        self.article = article
    }

    func start() {
        let view =  ArticleDetailsViewController()
        let interactor = ArticleDetailsInteractor(networkManager: AlamofireManager())
        let router = ArticleDetailsRouter(navigationController: navigationController, article: article)
        
        let presenter = ArticleDetailsPresenter(view: view, interactor: interactor, router: router)
        presenter.article = article
        
        view.presenter = presenter
        interactor.presenter = presenter

        navigationController.navigationBar.isHidden = true
        navigationController.pushViewController(view, animated: true)
    }

}


extension ArticleDetailsRouter: ArticleDetailsRouterProtocol {
    
    func navigateToHome() {
        navigationController.popViewController(animated: true)
    }
    
}
