//
//  SourceViewController.swift
//  Translator_Viper
//
//  Created by Aleksei Chudin on 01/08/2019.
//  Copyright © 2019 AliChuUser. All rights reserved.
//

import UIKit

class SourceViewController: UIViewController, SourceViewProtocol {
    
    @IBOutlet weak var englishButton: UIButton!
    @IBOutlet weak var russianButton: UIButton!
    @IBOutlet weak var spanishButton: UIButton!
    
    var presenter: SourcePresenterProtocol?
    var configurator: SourceConfiguratorProtocol = SourceConfigurator()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter?.configureView()
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        presenter?.closeCurrentViewController()
    }
    
    @IBAction func englishButtonPressed(_ sender: Any) {
        buttonTapped(englishButton)
    }
    
    @IBAction func russianButtonPressed(_ sender: Any) {
        buttonTapped(russianButton)
    }
    
    @IBAction func spanishButtonPressed(_ sender: Any) {
        buttonTapped(spanishButton)
    }
    
    private func buttonTapped(_ button: UIButton) {
        guard let title = button.titleLabel?.text else { return }
        presenter?.languageBattonPressed(with: title)
    }
    
}
