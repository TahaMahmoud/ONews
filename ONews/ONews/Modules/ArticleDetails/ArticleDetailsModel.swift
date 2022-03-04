//
//  ArticleDetailsModel.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import Foundation
import RealmSwift

// MARK: ArticleDetails Model -

class ArticleModel: Object {
    
    @objc dynamic var articleTitle = ""
    @objc dynamic var sourceName = ""
    @objc dynamic var articleDescription = ""
    @objc dynamic var url = ""
    @objc dynamic var urlToImage = ""
    @objc dynamic var publishedAt = ""
    @objc dynamic var content = ""
    
}
