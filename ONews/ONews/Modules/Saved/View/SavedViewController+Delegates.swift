//
//  SavedViewController+Delegates.swift
//  ONews
//
//  Created by Taha on 05/03/2022.
//

import UIKit

extension SavedViewController: SavedViewProtocol {

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

extension SavedViewController: UITableViewDataSource, UITableViewDelegate {
    
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
    
}
