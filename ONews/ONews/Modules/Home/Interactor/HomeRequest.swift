//
//  HomeRequest.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import Foundation
import Alamofire

enum HomeRequest: Endpoint {
    
    case fetchArticles(search: String, country: String, language: String, pageSize: Int, page: Int, category: String)

    var path: String {
        switch self {
        
        case .fetchArticles:
            return "top-headlines"
        }
    }
    
    var headers: HTTPHeaders {
        let headers = defaultHeaders
        return headers
    }
    
    var parameters: Parameters? {
        var param = defaultParams
        switch self {
        
        case .fetchArticles(let search, let country, let language, let pageSize, let page, let category):
            param = ["q": search, "country": country, "language": language, "pageSize": pageSize, "page": page, "category": category]
        }
        
        return param
    }
    
    var method: HTTPMethod {
        switch self {

        case .fetchArticles:
            return .get
        }
    }
}
