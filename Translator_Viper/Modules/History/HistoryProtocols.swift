//
//  HistoryProtocols.swift
//  Translator_Viper
//
//  Created by User on 31/07/2019.
//  Copyright © 2019 AliChuUser. All rights reserved.
//

import Foundation

protocol HistoryViewProtocol: class {
    func showHistory(with data: [Translate])
}

protocol HistoryPresenterProtocol: class {
    func configureView()
    func getHistory()
    func historyReceived(data: [Translate])
}

protocol HistoryInteractorProtocol: class {
    func fetchHistory()
}

protocol HistoryRouterProtocol: class {
    
}

protocol HistoryConfiguratorProtocol: class {
    func configure(with viewController: HistoryViewController)
}


