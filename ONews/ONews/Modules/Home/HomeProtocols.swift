//
//  HomeProtocols.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import Foundation

// MARK: Home Protocols

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol! { get set }
    
    func showIndicator()
    func hideIndicator()
    
    func reloadData()
    func showError(error: String)
    
}

protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewProtocol? { get set }
    
    var filterCategoriesToShow: [String] { get set }
    
    var noOfArticles: Int { get }
    var tableViewRowHeight: Double { get }
    
    func viewDidLoad()
    
    func configureCell(cell: NewsCell, indexPath: IndexPath)
    func didSelect(at indexPath: IndexPath)
    
    func searchForArticles(searchText: String)
    
    func fetchArticles()
    
    func savedPressed()
    func settingsPressed()
    
    func filterPreferenes(selectedIndices: [Int])
}

protocol HomeRouterProtocol {
    func navigateToSavedArticles()
    func navigateToSettings()
    
    func navigateToArticleDetails(article: Article)
}

protocol HomeInteractorInputProtocol {
    var presenter: HomeInteractorOutputProtocol? { get set }
    
    func getLanuage() -> String
    func getCountry() -> String
    func getPreferences() -> [String]
    
    func fetchArticles(search: String, country: String, language: String, pageSize: Int, page: Int, category: String)
}

protocol HomeInteractorOutputProtocol: AnyObject {
    func articlesFetched(model: ArticlesResponse)
    func failedWith(error: String)
    
}
