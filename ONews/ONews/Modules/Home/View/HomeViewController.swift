//
//  HomeViewController.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import UIKit
import JJFloatingActionButton

class HomeViewController: UIViewController {

    var presenter: HomePresenterProtocol!

    @IBOutlet weak var menuButton: JJFloatingActionButton!
    
    @IBOutlet weak var searchText: UITextField!
    
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var categoriesList: SelectionList!
    
    @IBOutlet weak var articlesTableView: UITableView!

    let refreshControl = UIRefreshControl()
    @IBOutlet weak var indicator: BPCircleActivityIndicator!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()

        setupMenuButton()
        setupTableView()
        setupPreferences()
        
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
        menuButton.addItem(title: "Saved".localized, image: #imageLiteral(resourceName: "Favourite")) { item in
            self.presenter.savedPressed()
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
    
    
    @IBAction func filterPressed(_ sender: Any) {
        filterView.isHidden = false
    }
    
    @IBAction func saveFilter(_ sender: Any) {
        filterView.isHidden = true
        presenter.filterPreferenes(selectedIndices: categoriesList.selectedIndexes)
    }
    
    func setupPreferences() {
        categoriesList.items = presenter.filterCategoriesToShow
        // preferencesList.addTarget(self, action: #selector(selectionChanged), for: .valueChanged)
        categoriesList.allowsMultipleSelection = true
        categoriesList.setupCell = { (cell: UITableViewCell, _: Int) in
            cell.textLabel?.textColor = .gray
        }

    }

    
}
