//
//  SelectLanguageProtocols.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import Foundation

// MARK: SelectLanguage Protocols

protocol SelectLanguageViewProtocol: AnyObject {
    var presenter: SelectLanguagePresenterProtocol! { get set }
    
    func showError(error: String)
    
    func renderArLanguage()
    func renderEnLanguage()
}

protocol SelectLanguagePresenterProtocol: AnyObject {
    var view: SelectLanguageViewProtocol? { get set }
    
    func viewDidLoad()
    
    func arabicSelected()
    func englishSelected()
    
    func save(countryCode: String)

}

protocol SelectLanguageRouterProtocol {
    func navigateToSelectPreferences()
    func restartApp()
}

protocol SelectLanguageInteractorInputProtocol {
    var presenter: SelectLanguageInteractorOutputProtocol? { get set }
    
    func setLanguage(language: Language)
    func setCountry(countryCode: String)
}

protocol SelectLanguageInteractorOutputProtocol: AnyObject {
    
    func savedSuccess()

}
