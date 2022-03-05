//
//  SelectPreferencesInteractor.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import Foundation

// MARK: SelectPreferences Interactor -

class SelectPreferencesInteractor: SelectPreferencesInteractorInputProtocol {
    
    weak var presenter: SelectPreferencesInteractorOutputProtocol?
    
    var networkManager: AlamofireManager
    var realmManager: RealmManager
    
    init(networkManager: AlamofireManager) {
        self.networkManager = networkManager
        self.realmManager = RealmManager()
    }

    func savePreferences(categories: [String]) {
            
        print(realmManager.getRealmFileURL())
        
        do {
            // Remove Old Categories
            realmManager.deleteAllDataForObject(CategoryModel.self)
            
            // Add New Categories
            var cats: [CategoryModel] = []
            
            for category in categories {
                let cat = CategoryModel()
                cat.categoryName = category
                cats.append(cat)
            }
            
            realmManager.add(cats)

            presenter?.saveSuccess()
            
        } catch {
            presenter?.saveFailed(error: "Failed To Save Preferences".localized)
        }
        
    }

}
