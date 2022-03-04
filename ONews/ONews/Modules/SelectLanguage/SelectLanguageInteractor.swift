//
//  SelectLanguageInteractor.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import Foundation

// MARK: SelectLanguage Interactor -

class SelectLanguageInteractor: SelectLanguageInteractorInputProtocol {
    
    weak var presenter: SelectLanguageInteractorOutputProtocol?
    
    var networkManager: AlamofireManager
    
    init(networkManager: AlamofireManager) {
        self.networkManager = networkManager
    }
    
    func setLanguage(language: Language) {
        UserDefaultsManager.shared.saveString(language.rawValue, key: .language)
    }
    
    func setCountry(countryCode: String) {
        UserDefaultsManager.shared.saveString(countryCode, key: .country)
        presenter?.savedSuccess()
    }

}
