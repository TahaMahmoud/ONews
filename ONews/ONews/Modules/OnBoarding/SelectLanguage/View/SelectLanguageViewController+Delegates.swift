//
//  SelectLanguageViewController+Delegates.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import UIKit

extension SelectLanguageViewController: SelectLanguageViewProtocol {
    
    func renderArLanguage() {
        arButton.backgroundColor = Colors.mainColor
        arButton.setTitleColor(.white, for: .normal)
        
        enButton.backgroundColor = Colors.secondaryColor
        enButton.setTitleColor(.black, for: .normal)
    }
    
    func renderEnLanguage() {
        enButton.backgroundColor = Colors.mainColor
        enButton.setTitleColor(.white, for: .normal)

        arButton.backgroundColor = Colors.secondaryColor
        arButton.setTitleColor(.black, for: .normal)
    }
    
    func showError(error: String) {
        Helper.showErrorNotification(message: error)
    }
}
