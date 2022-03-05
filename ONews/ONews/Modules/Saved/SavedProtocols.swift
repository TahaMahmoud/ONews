//
//  SavedProtocols.swift
//  ONews
//
//  Created by Taha on 05/03/2022.
//

import Foundation

// MARK: Saved Protocols

protocol SavedViewProtocol: AnyObject {
    var presenter: SavedPresenterProtocol! { get set }
 
    func showIndicator()
    func hideIndicator()
    
    func reloadData()
    func showError(error: String)

}

protocol SavedPresenterProtocol: AnyObject {
    var view: SavedViewProtocol? { get set }
    
    var noOfArticles: Int { get }
    var tableViewRowHeight: Double { get }
    
    func viewDidLoad()
    
    func configureCell(cell: NewsCell, indexPath: IndexPath)
    func didSelect(at indexPath: IndexPath)
    
    func searchForArticles(searchText: String)
    
    func fetchArticles()
    
    func homePressed()
    func settingsPressed()
    
}

protocol SavedRouterProtocol {
    func navigateToHome()
    func navigateToSettings()
    
    func navigateToArticleDetails(article: Article)
}

protocol SavedInteractorInputProtocol {
    var presenter: SavedInteractorOutputProtocol? { get set }

    func fetchArticles(search: String)
}

protocol SavedInteractorOutputProtocol: AnyObject {
    func articlesFetched(articles: [Article])
    func failedWith(error: String)
}
