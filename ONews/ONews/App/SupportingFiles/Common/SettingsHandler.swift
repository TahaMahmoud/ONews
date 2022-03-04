//
//  SettingsHandler.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import Foundation

struct SettingsHandler {
        
    static func isLanguageSet() -> Bool? {
        return UserDefaultsManager.shared.getString(key: .language) ?? "" != ""
    }

    static func isCountrySet() -> Bool? {
        return UserDefaultsManager.shared.getString(key: .country) ?? "" != ""
    }

    static func isPreferencesSet() -> Bool? {
        let preferences: [CategoryModel] = RealmManager.sharedInstance.retrieveAllDataForObject(CategoryModel.self).map{ $0 as! CategoryModel }
                
        return preferences.count != 0
    }
    
}
