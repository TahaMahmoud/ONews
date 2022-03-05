//
//  SelectLanguageViewController.swift
//  ONews
//
//  Created by Taha on 04/03/2022.
//

import UIKit

class SelectLanguageViewController: UIViewController {

    var presenter: SelectLanguagePresenterProtocol!
    var selectedCountryCode = ""
    
    @IBOutlet weak var countryNameLabel: UILabel!
    
    @IBOutlet weak var arButton: CustomButton!
    @IBOutlet weak var enButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    @IBAction func arabicSelected(_ sender: Any) {
        presenter.arabicSelected()
    }
    
    @IBAction func englishSelected(_ sender: Any) {
        presenter.englishSelected()
    }
        
    @IBAction func selectCountryPressed(_ sender: Any) {
        presentCountryPickerScene(withSelectionControlEnabled: false)
    }
    
    @IBAction func savePressed(_ sender: Any) {
        presenter.save(countryCode: selectedCountryCode)
    }

    func presentCountryPickerScene(withSelectionControlEnabled selectionControlEnabled: Bool = true) {
        switch selectionControlEnabled {
        case true:
            // Present country picker with `Section Control` enabled
            let countryController = CountryPickerWithSectionViewController.presentController(on: self) { [weak self] (country: Country) in
                
                guard let self = self else { return }
                self.countryNameLabel.text = country.countryName
                self.selectedCountryCode = country.countryCode
            }
            
            countryController.flagStyle = .circular
        case false:
            // Present country picker without `Section Control` enabled
            let countryController = CountryPickerController.presentController(on: self) { [weak self] (country: Country) in
                
                guard let self = self else { return }
                self.countryNameLabel.text = country.countryName
                self.selectedCountryCode = country.countryCode
            }
            
            countryController.flagStyle = .corner
        }
    }

}
