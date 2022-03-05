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
    
    var selectedLanguage: String = ""
    var selectedCountryCode: String = ""
    
    init(view: SelectLanguageViewProtocol, interactor: SelectLanguageInteractorInputProtocol, router: SelectLanguageRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        selectedLanguage = getCurrentLanguage()
                
        if selectedLanguage == "ar" {
            view?.renderArLanguage()
        } else {
            view?.renderEnLanguage()
        }
    }
    
    func getCurrentLanguage() -> String {
        return MOLHLanguage.currentAppleLanguage()
    }
    
    func arabicSelected() {
        setDefault(language: .arabic)
    }
    
    func englishSelected() {
        setDefault(language: .english)
    }
    
    func setDefault(language: Language) {
        interactor.setLanguage(language: language)

        MOLH.setLanguageTo(language.rawValue)
        
        MOLH.reset()
    }
    
    func savedSuccess() {
        router.navigateToSelectPreferences()
    }
    
    func save(countryCode: String) {
        
        if selectedLanguage != "" && countryCode != "" {
            interactor.setCountry(countryCode: countryCode)
        }
        else {
            view?.showError(error: "Select Langauge and Country".localized)
        }
    }
}
