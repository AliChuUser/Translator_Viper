//
//  MainPresenter.swift
//  Translator_Viper
//
//  Created by User on 31/07/2019.
//  Copyright © 2019 AliChuUser. All rights reserved.
//

import Foundation

class MainPresenter: MainPresenterProtocol {
    
    weak var view: MainViewProtocol!
    var interactor: MainInteractorProtocol?
    var router: MainRouterProtocol?
    
    required init(view: MainViewController) {
        self.view = view
    }
    
    func configureView() {
        print(#function)
    }
    
    func chooseNewLanguage() {
        print(#function)
    }
    
    func changeLanguage() {
        print(#function)
    }
    
    func makeTranslate(inputText: String, startLanguage: String, finalLanguage: String) {
        print(#function)
        interactor?.fetchTranslate(inputText: inputText, startLanguage: startLanguage, finalLanguage: finalLanguage)
    }
    
    func translateReceived(text: String) {
        print(#function)
        view.showTranslate(text: text)
    }
    
}
