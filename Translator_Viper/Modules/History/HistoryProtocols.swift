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
    func searchBarTextDidChange(with text: String)
    func userTappedCell(with data: Translate)
    func deleteAllData()
}

protocol HistoryInteractorProtocol: class {
    func fetchHistory()
    func updateHistoryWithPredicate(_ text: String)
    func deleteData()
}

protocol HistoryRouterProtocol: class {
    func showMainScreen(with data: Translate)
}

protocol HistoryConfiguratorProtocol: class {
    func configure(with viewController: HistoryViewController)
}


