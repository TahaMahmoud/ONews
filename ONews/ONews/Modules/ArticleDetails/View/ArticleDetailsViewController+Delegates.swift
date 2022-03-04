//
//  ArticleDetailsViewController+Delegates.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import UIKit
import Kingfisher

extension ArticleDetailsViewController: ArticleDetailsViewProtocol {
    
    func showArticle(imageURL: URL, articleDate: String, articleTitle: String, articleSource: String, articleContent: String) {
        
        articleImage.kf.setImage(with: imageURL)
        
        self.articleDate.text = articleDate
        self.articleTitle.text = articleTitle
        self.articleSource.text = articleSource
        
        self.articleContent.text = articleContent
    }
    
    func showSaveButton() {
        likeButton.setImage(UIImage(named: "ic_like"), for: .normal)
    }
    
    func showSavedButton() {
        likeButton.setImage(UIImage(named: "ic_liked"), for: .normal)
    }
    
    func showSuccess(message: String) {
        Helper.showSuccessNotification(message: message)
    }
    
    func openArticle(url: URL) {
        UIApplication.shared.open(url)
    }
    
    func flipBackButton() {
        backButton.transform = CGAffineTransform(scaleX: -1.0, y: -1.0)
    }
    
}
