//
//  SelectPreferencesViewController.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import UIKit

class SelectPreferencesViewController: UIViewController {

    var presenter: SelectPreferencesPresenterProtocol!
        
    @IBOutlet weak var preferencesList: SelectionList!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    
        setupPreferences()
    }

    func setupPreferences() {
        
        preferencesList.items = presenter.categoriesToShow
        preferencesList.addTarget(self, action: #selector(selectionChanged), for: .valueChanged)
        preferencesList.allowsMultipleSelection = true
        preferencesList.setupCell = { (cell: UITableViewCell, _: Int) in
            cell.textLabel?.textColor = .gray
        }

    }
    
    @objc func selectionChanged() {
        presenter.selectionChanged(selectedIndices: preferencesList.selectedIndexes, lastIndex: preferencesList.lastChangedIndex ?? 0)
    }

    @IBAction func savePressed(_ sender: Any) {
        presenter.savePreferences()
    }
}
