//
//  SelectPreferencesViewController+Delegates.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//


import UIKit

extension SelectPreferencesViewController: SelectPreferencesViewProtocol {
    
    func showError(message: String) {
        Helper.showErrorNotification(message: message)
    }
    
    func deselectLastSelection(indexPath: IndexPath) {
        preferencesList.tableView.deselectRow(at: indexPath, animated: false)
    }
    
}
