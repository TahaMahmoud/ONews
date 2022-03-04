//
//  SelectLanguageViewController+Delegates.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import UIKit

extension SelectLanguageViewController: SelectLanguageViewProtocol {
    func showError(error: String) {
        Helper.showErrorNotification(message: error)
    }
}
