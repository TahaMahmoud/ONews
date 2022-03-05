//
//  SavedPresenter.swift
//  ONews
//
//  Created by Taha on 05/03/2022.
//

import Foundation

// MARK: Saved Presenter -

class SavedPresenter: SavedPresenterProtocol, SavedInteractorOutputProtocol {
    
    weak var view: SavedViewProtocol?
    private let interactor: SavedInteractorInputProtocol
    private let router: SavedRouterProtocol
    
    var searchValue = ""
    
    var noOfArticles: Int {
        return articles.count
    }
    
    var tableViewRowHeight: Double {
        return 220.0
    }
    
    private var articles: [Article] = []

    init(view: SavedViewProtocol, interactor: SavedInteractorInputProtocol, router: SavedRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        searchValue = ""
        articles.removeAll()
        fetchArticles()
    }
        
    func fetchArticles() {
        if Helper.checkConnection() {
            view?.showIndicator()
            interactor.fetchArticles(search: searchValue)
        }
    }
    
    func searchForArticles(searchText: String) {
        if searchText != "" {
            articles.removeAll()
            searchValue = searchText
            fetchArticles()
        } else {
            viewDidLoad()
        }
    }
    
    func configureCell(cell: NewsCell, indexPath: IndexPath) {
        let articleImageURL = articles[indexPath.row].urlToImage ?? ""
        
        let title = articles[indexPath.row].title ?? ""
        let shortDesc = articles[indexPath.row].articleDescription ?? ""
        let source = articles[indexPath.row].source?.name ?? ""
        
        let publishDate = articles[indexPath.row].publishedAt ?? "2022-02-04T03:54:00Z"
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy hh:mm a"
        formatter.locale = Locale(identifier: "en_us")

        let stringDate = formatter.string(from: formatter.date(from: publishDate) ?? Date() )
        
        cell.configureCell(title: title, shortDesc: shortDesc, source: source, newsDate: stringDate, image: articleImageURL)

    }
    
    func homePressed() {
        router.navigateToHome()
    }
    
    func settingsPressed() {
        router.navigateToSettings()
    }
    
    func articlesFetched(articles: [Article]) {
        view?.hideIndicator()
        self.articles.append(contentsOf: articles)
        view?.reloadData()
    }
    
    func failedWith(error: String) {
        view?.hideIndicator()
        view?.showError(error: "Error while fetching News".localized)
    }

    func didSelect(at indexPath: IndexPath) {
        let article = articles[indexPath.row]
        router.navigateToArticleDetails(article: article)
    }

}
