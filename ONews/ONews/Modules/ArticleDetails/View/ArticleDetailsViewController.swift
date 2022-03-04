//
//  ArticleDetailsViewController.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import UIKit

class ArticleDetailsViewController: UIViewController {

    var presenter: ArticleDetailsPresenterProtocol!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var articleImage: UIImageView!
    
    @IBOutlet weak var articleDate: UILabel!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleSource: UILabel!
    
    @IBOutlet weak var articleContent: UITextView!
    
    @IBOutlet weak var likeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    @IBAction func backPressed(_ sender: Any) {
        presenter.backPressed()
    }
    
    @IBAction func viewArticlePressed(_ sender: Any) {
        presenter.openArticlePressed()
    }
    
    @IBAction func saveArticlePressed(_ sender: Any) {
        presenter.savePressed()
    }
}

