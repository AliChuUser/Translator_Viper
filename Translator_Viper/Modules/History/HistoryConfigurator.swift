//
//  HistoryConfigurator.swift
//  Translator_Viper
//
//  Created by User on 31/07/2019.
//  Copyright © 2019 AliChuUser. All rights reserved.
//

import Foundation

class HistoryConfigurator: HistoryConfiguratorProtocol {
    
    func configure(with viewController: HistoryViewController) {
        let presenter = HistoryPresenter(view: viewController)
        let interactor = HistoryInteractor(presenter: presenter)
        let router = HistoryRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
