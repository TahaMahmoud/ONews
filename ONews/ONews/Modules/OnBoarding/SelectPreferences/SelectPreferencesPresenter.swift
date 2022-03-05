//
//  SelectPreferencesPresenter.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import Foundation

// MARK: SelectPreferences Presenter -

class SelectPreferencesPresenter: SelectPreferencesPresenterProtocol, SelectPreferencesInteractorOutputProtocol {

    var categories = ["business", "entertainment", "general", "health", "science", "sports", "technology"]

    var categoriesToShow: [String] = []
    
    var selectedIndices: [Int] = []
    var maximumSelection = 3
    
    weak var view: SelectPreferencesViewProtocol?
    private let interactor: SelectPreferencesInteractorInputProtocol
    private let router: SelectPreferencesRouterProtocol
    
    init(view: SelectPreferencesViewProtocol, interactor: SelectPreferencesInteractorInputProtocol, router: SelectPreferencesRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        categoriesToShow.append(contentsOf: categories.map{
            $0.localized
        })
    }
    
    func savePreferences() {
        
        if selectedIndices.count == 0 {
            view?.showError(message: "Select At Least one Category".localized)
        } else {
            let selectedCategories = selectedIndices.map {
                categories[$0]
            }
        
            interactor.savePreferences(categories: selectedCategories)
        }
        
    }

    func selectionChanged(selectedIndices: [Int], lastIndex: Int) {
        // Maximum 3 categories
        if selectedIndices.count > maximumSelection {
            let indexPath = IndexPath(row: lastIndex, section: 0)
            view?.deselectLastSelection(indexPath: indexPath)
            return
        }
        self.selectedIndices = selectedIndices
    }
    
    func saveSuccess() {
        router.navigateToHome()
    }
    
    func saveFailed(error: String) {
        view?.showError(message: error)
    }

}
