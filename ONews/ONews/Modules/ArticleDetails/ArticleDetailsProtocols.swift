//
//  ArticleDetailsProtocols.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import Foundation

// MARK: ArticleDetails Protocols

protocol ArticleDetailsViewProtocol: AnyObject {
    var presenter: ArticleDetailsPresenterProtocol! { get set }
    
    func showArticle(imageURL: URL, articleDate: String, articleTitle: String, articleSource: String, articleContent: String)
    
    func showSaveButton()
    func showSavedButton()
    
    func openArticle(url: URL)
    
    func showSuccess(message: String)
    
    func flipBackButton()
}

protocol ArticleDetailsPresenterProtocol: AnyObject {
    var view: ArticleDetailsViewProtocol? { get set }
    
    func viewDidLoad()

    func openArticlePressed()
    func savePressed()
    func backPressed()
}

protocol ArticleDetailsRouterProtocol {
    func navigateToHome()
}

protocol ArticleDetailsInteractorInputProtocol {
    var presenter: ArticleDetailsInteractorOutputProtocol? { get set }
    
    func fetchStatusBy(articleURL: String)
    func saveArticle(article: ArticleModel)
    func unsaveArticle(articleURL: String)
}

protocol ArticleDetailsInteractorOutputProtocol: AnyObject {
    func articleStatues(saved: Bool)
}
