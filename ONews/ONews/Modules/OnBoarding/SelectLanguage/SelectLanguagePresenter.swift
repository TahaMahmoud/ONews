//
//  SelectLanguagePresenter.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import Foundation
import MOLH

// MARK: SelectLanguage Presenter -

enum Language: String {
    case arabic = "ar"
    case english = "en"
}

class SelectLanguagePresenter: SelectLanguagePresenterProtocol, SelectLanguageInteractorOutputProtocol {

    weak var view: SelectLanguageViewProtocol?
    private let interactor: SelectLanguageInteractorInputProtocol
    private let router: SelectLanguageRouterProtocol
    
    var selectedCountryCode: String = ""
    var selectedLanguage: Language?
    
    init(view: SelectLanguageViewProtocol, interactor: SelectLanguageInteractorInputProtocol, router: SelectLanguageRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        
    }
    
    func arabicSelected() {
        selectedLanguage = .arabic
        setDefault()
    }
    
    func englishSelected() {
        selectedLanguage = .english
        setDefault()
    }
    
    func setDefault() {
        MOLH.setLanguageTo(selectedLanguage?.rawValue ?? "ar")
        MOLH.reset()
        router.restartApp()
    }
    
    func savedSuccess() {
        router.navigateToSelectPreferences()
    }
    
    func save(countryCode: String) {
        
        if selectedLanguage != .none && countryCode != "" {
            interactor.setLanguage(language: selectedLanguage ?? .english)
            interactor.setCountry(countryCode: countryCode)
        }
        else {
            view?.showError(error: "Select Langauge and Country".localized)
        }
    }
}
