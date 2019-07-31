//
//  SourceViewController.swift
//  Translator_Viper
//
//  Created by Aleksei Chudin on 01/08/2019.
//  Copyright © 2019 AliChuUser. All rights reserved.
//

import UIKit

class SourceViewController: UIViewController, SourceViewProtocol {
    
    var presenter: SourcePresenterProtocol?
    var configurator: SourceConfiguratorProtocol = SourceConfigurator()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter?.configureView()
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        presenter?.close(viewController: self)
    }
}
