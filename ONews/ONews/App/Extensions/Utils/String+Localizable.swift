//
//  String+Localizable.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
}
