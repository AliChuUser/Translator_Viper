//
//  SourceProtocols.swift
//  Translator_Viper
//
//  Created by Aleksei Chudin on 01/08/2019.
//  Copyright © 2019 AliChuUser. All rights reserved.
//

import Foundation

protocol SourceViewProtocol: class {
    
}

protocol SourcePresenterProtocol: class {
    func configureView()
    func closeCurrentViewController()
    func languageBattonPressed(with title: String)
}

protocol SourceInteractorProtocol: class {
    
}

protocol SourceRouterProtocol: class {
    func closeViewController()
}

protocol SourceConfiguratorProtocol: class {
    func configure(with viewController: SourceViewController)
}
