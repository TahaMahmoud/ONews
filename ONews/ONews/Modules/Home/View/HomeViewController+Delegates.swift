//
//  HomeViewController+Delegates.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import UIKit

extension HomeViewController: HomeViewProtocol {
    
    func showIndicator() {
        indicator.isHidden = false
        indicator.animate()
    }
        
    func hideIndicator() {
        indicator.isHidden = true
        indicator.stop()
    }
    
    func reloadData() {
        articlesTableView.reloadData()
    }
    
    func showError(error: String) {
        Helper.showErrorNotification(message: error)
    }
    
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.noOfArticles
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as NewsCell
        presenter.configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(presenter.tableViewRowHeight)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelect(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == presenter.noOfArticles - 3 && presenter.noOfArticles != 3 {
            print(indexPath.row)
            presenter.fetchArticles()
            return
        }
    }

}
