//
//  HomeInteractor.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import Foundation

// MARK: Home Interactor -

class HomeInteractor: HomeInteractorInputProtocol {
    
    weak var presenter: HomeInteractorOutputProtocol?
    
    var networkManager: AlamofireManager
        
    init(networkManager: AlamofireManager) {
        self.networkManager = networkManager
    }

    func fetchArticles(search: String, country: String, language: String, pageSize: Int, page: Int, category: String) {

        networkManager.callRequest(ArticlesResponse.self, endpoint: HomeRequest.fetchArticles(search: search, country: country, language: language, pageSize: pageSize, page: page, category: category)) {[weak self] (result) in
                        
            switch result {
            case .success(let value):
                self?.presenter?.articlesFetched(model: value)
            case .failure(let error):
                print(error)
                self?.presenter?.failedWith(error: error.localizedDescription)
            }
        }

    }

    func getLanuage() -> String {
        return UserDefaultsManager.shared.getString(key: .language) ?? ""
    }
    
    func getCountry() -> String {
        return UserDefaultsManager.shared.getString(key: .country) ?? ""
    }
    
    func getPreferences() -> [String] {
        let objects =  RealmManager.sharedInstance.retrieveAllDataForObject(CategoryModel.self).map {
            $0 as! CategoryModel
        }
        
        var categories: [String] = []
    
        for object in objects {
            categories.append(object.categoryName)
        }
        
        return categories
        
    }
    
}
