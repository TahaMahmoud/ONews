//
//  ArticleDetailsInteractor.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import Foundation

// MARK: ArticleDetails Interactor -

class ArticleDetailsInteractor: ArticleDetailsInteractorInputProtocol {
    
    weak var presenter: ArticleDetailsInteractorOutputProtocol?
    
    var networkManager: AlamofireManager
    
    init(networkManager: AlamofireManager) {
        self.networkManager = networkManager
    }
    
    func fetchStatusBy(articleURL: String) {
        let objects = RealmManager.sharedInstance.retrieveAllDataForObject(ArticleModel.self).map {
            $0 as! ArticleModel
        }
        
        for object in objects {
            if object.url == articleURL {
                presenter?.articleStatues(saved: true)
                return
            }
        }
        presenter?.articleStatues(saved: false)
    }

    func saveArticle(article: ArticleModel) {
        RealmManager.sharedInstance.add(article)
        presenter?.articleStatues(saved: true)
    }
    
    func unsaveArticle(articleURL: String) {
        
        let predicate = NSPredicate(format: "url == %@", articleURL)

        RealmManager.sharedInstance.delete(ArticleModel.self, with: predicate)
        presenter?.articleStatues(saved: false)
    }
}
