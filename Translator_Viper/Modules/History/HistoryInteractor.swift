//
//  HistoryInteractor.swift
//  Translator_Viper
//
//  Created by User on 31/07/2019.
//  Copyright © 2019 AliChuUser. All rights reserved.
//

import Foundation

class HistoryInteractor: HistoryInteractorProtocol {
    
    var presenter: HistoryPresenterProtocol?
    
    required init(presenter: HistoryPresenterProtocol) {
        self.presenter = presenter
    }
    
    func fetchHistory() {
        StorageService.fetchData(resultCallback: { (data) in
            self.presenter?.historyReceived(data: data)
        }) { (error) in
            print("Cannot fetch data from CareData: \(error.localizedDescription)")
        }
    }
    
}
