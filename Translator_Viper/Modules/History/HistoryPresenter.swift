//
//  HistoryPresenter.swift
//  Translator_Viper
//
//  Created by User on 31/07/2019.
//  Copyright © 2019 AliChuUser. All rights reserved.
//

import Foundation

class HistoryPresenter: HistoryPresenterProtocol {
    
    weak var view: HistoryViewProtocol!
    var interactor: HistoryInteractorProtocol?
    var router: HistoryRouterProtocol?
    
    required init(view: HistoryViewProtocol) {
        self.view = view
    }
    
    func configureView() {
        getHistory()
    }
    
    func getHistory() {
        interactor?.fetchHistory()
    }
    
    func historyReceived(data: [Translate]) {
        view.showHistory(with: data)
    }
    
    func searchBarTextDidChange(with text: String) {
        interactor?.updateHistoryWithPredicate(text)
    }
    
    func userTappedCell(with text: String) {
        router?.showMainScreen(with: text)
    }
    
    func deleteAllData() {
        interactor?.deleteData()
    }
}
