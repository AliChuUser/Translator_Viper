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
        interactor?.fetchButtonState()
    }
    
    func chooseNewLanguage() {
        print(#function)
    }
    
    func changeLanguage(firstLanguage: String, secondLanguage: String) {
        interactor?.saveButtonState(firstButton: firstLanguage, secondButton: secondLanguage)
    }
    
    func provideButtonState(firstLanguage: String, secondLanguage: String) {
        view.showButtonState(firstLanguage: firstLanguage, secondLanguage: secondLanguage)
    }
    
    func makeTranslate(inputText: String, startLanguage: String, finalLanguage: String) {
        let convertedStartLanguage = convertLanguageCode(input: startLanguage)
        let convertedFinalLanguage = convertLanguageCode(input: finalLanguage)
        
        interactor?.fetchTranslate(inputText: inputText, startLanguage: convertedStartLanguage, finalLanguage: convertedFinalLanguage)
    }
    
    func translateReceived(text: String) {
        view.showTranslate(text: text)
    }
    
    private func convertLanguageCode(input: String) -> String {
        switch input {
        case "English": return "en"
        case "Russian": return "ru"
        case "Spanish": return "es"
        default: return "en"
        }
    }
    
}
