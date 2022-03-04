//
//  ArticleDetailsPresenter.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import Foundation

// MARK: ArticleDetails Presenter -

class ArticleDetailsPresenter: ArticleDetailsPresenterProtocol, ArticleDetailsInteractorOutputProtocol {

    weak var view: ArticleDetailsViewProtocol?
    private let interactor: ArticleDetailsInteractorInputProtocol
    private let router: ArticleDetailsRouterProtocol
    
    var article: Article?
    var saved: Bool = false
    
    var articleModel: ArticleModel?

    init(view: ArticleDetailsViewProtocol, interactor: ArticleDetailsInteractorInputProtocol, router: ArticleDetailsRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        
        if Locale.current.languageCode == "ar" {
            view?.flipBackButton()
        }
        
        createArticleModel()
        
        let imageURL = URL(string: article?.urlToImage ?? "https://www.industry.gov.au/sites/default/files/August%202018/image/news-placeholder-738.png" ) ?? URL(string: "https://www.industry.gov.au/sites/default/files/August%202018/image/news-placeholder-738.png")
        
        // Format Date
        let publishDate = article?.publishedAt ?? "2022-02-04T03:54:00Z"
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy hh:mm a"
        formatter.locale = Locale(identifier: "en_us")

        let stringDate = formatter.string(from: formatter.date(from: publishDate) ?? Date() )
        
        view?.showArticle(imageURL: imageURL!, articleDate: stringDate, articleTitle: article?.title ?? "", articleSource: article?.source?.name ?? "", articleContent: article?.content ?? (article?.articleDescription ?? "") )
    
        interactor.fetchStatusBy(articleURL: article?.url ?? "")
    
    }

    func openArticlePressed() {
        if let url = URL(string: article?.url ?? "") {
            view?.openArticle(url: url)
        }
    }
    
    func createArticleModel() {
        
        self.articleModel = nil
        
        let articleModel = ArticleModel()

        // Create ArticleModel from article
        articleModel.articleTitle = article?.title ?? ""
        articleModel.articleDescription = article?.articleDescription ?? ""
        articleModel.urlToImage = article?.urlToImage ?? ""
        articleModel.url = article?.url ?? ""
        
        // Format Date
        let publishDate = article?.publishedAt ?? "2022-02-04T03:54:00Z"
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy hh:mm a"
        formatter.locale = Locale(identifier: "en_us")

        let stringDate = formatter.string(from: formatter.date(from: publishDate) ?? Date() )

        articleModel.publishedAt = stringDate
        
        articleModel.sourceName = article?.source?.name ?? ""
        articleModel.content = article?.content ?? ( article?.articleDescription ?? "" )

        self.articleModel = articleModel
    }
    
    func savePressed() {
        if saved {
            interactor.unsaveArticle(articleURL: articleModel?.url ?? "")
            view?.showSuccess(message: "Article removed from saved".localized)
        } else {
            createArticleModel()
            interactor.saveArticle(article: articleModel ?? ArticleModel())
            view?.showSuccess(message: "Article saved for later".localized)
        }
    }
    
    func backPressed() {
        router.navigateToHome()
    }
    
    func articleStatues(saved: Bool) {
        self.saved = saved
        
        if saved {
            view?.showSavedButton()
        } else {
            view?.showSaveButton()
        }
    }

}
