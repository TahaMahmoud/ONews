//
//  SelectPreferencesProtocols.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import Foundation

// MARK: SelectPreferences Protocols

protocol SelectPreferencesViewProtocol: AnyObject {
    var presenter: SelectPreferencesPresenterProtocol! { get set }

    func showError(message: String)
    func deselectLastSelection(indexPath: IndexPath)
}

protocol SelectPreferencesPresenterProtocol: AnyObject {
    var view: SelectPreferencesViewProtocol? { get set }
    var categoriesToShow: [String] { get set }

    func viewDidLoad()
    func selectionChanged(selectedIndices: [Int], lastIndex: Int)
    
    func savePreferences()
}

protocol SelectPreferencesRouterProtocol {
    func navigateToHome()
    
}

protocol SelectPreferencesInteractorInputProtocol {
    var presenter: SelectPreferencesInteractorOutputProtocol? { get set }
    
    func savePreferences(categories: [String])
}

protocol SelectPreferencesInteractorOutputProtocol: AnyObject {
    
    func saveSuccess()
    func saveFailed(error: String)
}
