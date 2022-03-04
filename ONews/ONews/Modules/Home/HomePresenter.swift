//
//  HomePresenter.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import Foundation

// MARK: Home Presenter -

class HomePresenter: HomePresenterProtocol, HomeInteractorOutputProtocol {
    
    weak var view: HomeViewProtocol?
    private let interactor: HomeInteractorInputProtocol
    private let router: HomeRouterProtocol

    var language = ""
    var country = ""
    var categories: [String] = []
    
    var filterCategories = ["business", "entertainment", "general", "health", "science", "sports", "technology"]
    
    var filterCategoriesToShow: [String] = []
    
    var filteredCategories: [String] = []
    
    var searchValue = ""
    
    var pageSize = 20
    var page = 0
    
    var noOfArticles: Int {
        return articles.count
    }
    
    var tableViewRowHeight: Double {
        return 220.0
    }
    
    private var articles: [Article] = []
    
    init(view: HomeViewProtocol, interactor: HomeInteractorInputProtocol, router: HomeRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        
        // Localize Categories to view
        filterCategoriesToShow.append(contentsOf: filterCategories.map {
            $0.localized
        })
        
        page = 0
        searchValue = ""
        articles.removeAll()
        loadSettings()
        fetchArticles()
    }

    func filterPreferenes(selectedIndices: [Int]) {
        if selectedIndices.count > 0 {
            for index in selectedIndices {
                filterCategories.append(filterCategories[index])
            }
        }
        else {
            viewDidLoad()
        }
    }

    func loadSettings() {
        language = interactor.getLanuage()
        country = interactor.getCountry()
        categories = interactor.getPreferences()
        
        print(language)
        print(country)
        print(categories)
    }
        
    func fetchArticles() {
        if Helper.checkConnection() {
            view?.showIndicator()
        
            let cats = filteredCategories.count > 0 ? filterCategories : categories
            
            DispatchQueue.global().async {
                
                self.page = self.page + 1
                            
                if cats.count > 0 {
                    for cat in self.categories {
                        self.interactor.fetchArticles(search: self.searchValue, country: self.country, language: self.language, pageSize: self.pageSize, page: self.page, category: cat)
                    }
                } else {
                    self.interactor.fetchArticles(search: "", country: self.country, language: self.language, pageSize: self.pageSize, page: self.page, category: "")
                }
            }
        } else {
            view?.showError(error: "Please check your internet connection".localized)
        }
    }
    
    func searchForArticles(searchText: String) {
        if searchText != "" {
            page = 0
            articles.removeAll()
            searchValue = searchText
            fetchArticles()
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
        
        DispatchQueue.main.async {
            cell.configureCell(title: title, shortDesc: shortDesc, source: source, newsDate: stringDate, image: articleImageURL)
        }
        
    }
    
    func savedPressed() {
        router.navigateToSavedArticles()
    }
    
    func settingsPressed() {
        router.navigateToSettings()
    }
    
    func articlesFetched(model: ArticlesResponse) {
        DispatchQueue.main.async {
            self.view?.hideIndicator()
            self.articles.append(contentsOf: model.articles ?? [])
            self.view?.reloadData()
        }
    }
    
    func failedWith(error: String) {
        DispatchQueue.main.async {
            self.view?.hideIndicator()
            self.view?.showError(error: "Error while fetching News".localized)
        }
    }

    func didSelect(at indexPath: IndexPath) {
        let article = articles[indexPath.row]
        router.navigateToArticleDetails(article: article)
    }

}
