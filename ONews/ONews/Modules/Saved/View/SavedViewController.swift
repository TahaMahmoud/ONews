//
//  SavedViewController.swift
//  ONews
//
//  Created by Taha on 05/03/2022.
//

import UIKit
import JJFloatingActionButton

class SavedViewController: UIViewController {

    var presenter: SavedPresenterProtocol!

    @IBOutlet weak var menuButton: JJFloatingActionButton!
    
    @IBOutlet weak var searchText: UITextField!
        
    @IBOutlet weak var articlesTableView: UITableView!

    let refreshControl = UIRefreshControl()
    @IBOutlet weak var indicator: BPCircleActivityIndicator!

    override func viewDidAppear(_ animated: Bool) {
        presenter.viewDidLoad()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMenuButton()
        setupTableView()
        
        refreshControl.tintColor = .white
        if #available(iOS 10.0, *) {
            articlesTableView.refreshControl = refreshControl
        } else {
            articlesTableView.addSubview(refreshControl)
        }

        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)

    }
    
    @objc private func refresh(_ sender: Any) {
        presenter.viewDidLoad()
        refreshControl.endRefreshing()
    }

    func setupMenuButton() {
        menuButton.addItem(title: "Home".localized, image: #imageLiteral(resourceName: "ic_home")) { item in
            self.presenter.homePressed()
        }

        menuButton.addItem(title: "Settings".localized, image: #imageLiteral(resourceName: "ic_settings")) { item in
            self.presenter.settingsPressed()
        }
    }
    
    fileprivate func setupTableView() {
        articlesTableView.dataSource = self
        articlesTableView.delegate = self
        articlesTableView.registerCellNib(cellClass: NewsCell.self)
    }
    
    @IBAction func searchEditEnd(_ sender: Any) {
        presenter.searchForArticles(searchText: searchText.text ?? "")
    }

}
