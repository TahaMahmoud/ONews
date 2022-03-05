//
//  SavedInteractor.swift
//  ONews
//
//  Created by Taha on 05/03/2022.
//

import Foundation

// MARK: Saved Interactor -

class SavedInteractor: SavedInteractorInputProtocol {
    
    weak var presenter: SavedInteractorOutputProtocol?
    
    var networkManager: AlamofireManager
    
    init(networkManager: AlamofireManager) {
        self.networkManager = networkManager
    }

    func fetchArticles(search: String) {
        
        var articles: [Article] = []
        let objects = RealmManager.sharedInstance.retrieveAllDataForObject(ArticleModel.self).map { $0 as? ArticleModel }
                        
        for object in objects {
            
            let article = Article(source: Source(id: "", name: object?.sourceName), author: "", title: object?.articleTitle ?? "" , articleDescription: object?.articleDescription ?? "", url: object?.url ?? "", urlToImage: object?.urlToImage ?? "", publishedAt: object?.publishedAt ?? "", content: object?.content ?? "")
            
            if search == "" {
                articles.append(article)
            } else {
                if article.title?.contains(search) ?? false ||
                    article.articleDescription?.contains(search) ?? false ||
                   article.content?.contains(search) ?? false {
                    articles.append(article)
                }
            }

        }
        
        presenter?.articlesFetched(articles: articles)
    
    }

}
