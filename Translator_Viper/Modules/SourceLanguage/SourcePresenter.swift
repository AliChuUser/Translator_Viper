//
//  SourcePresenter.swift
//  Translator_Viper
//
//  Created by Aleksei Chudin on 01/08/2019.
//  Copyright © 2019 AliChuUser. All rights reserved.
//

import Foundation

class SourcePresenter: SourcePresenterProtocol {
    
    weak var view: SourceViewProtocol!
    var interactor: SourceInteractorProtocol?
    var router: SourceRouterProtocol?
    
    required init(view: SourceViewProtocol) {
        self.view = view
    }
    
    func configureView() {
        print(#function)
    }
    
    func closeCurrentViewController() {
        router?.closeViewController()
    }
    
    func languageBattonPressed(with title: String) {
        
    }
    
}
