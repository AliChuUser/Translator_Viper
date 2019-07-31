//
//  SourceConfigurator.swift
//  Translator_Viper
//
//  Created by Aleksei Chudin on 01/08/2019.
//  Copyright © 2019 AliChuUser. All rights reserved.
//

import Foundation

class SourceConfigurator: SourceConfiguratorProtocol {
    
    func configure(with viewController: SourceViewController) {
        let presenter = SourcePresenter(view: viewController)
        let interactor = SourceInteractor(presenter: presenter)
        let router = SourceRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
    
}
