//
//  MainProtocols.swift
//  Translator_Viper
//
//  Created by User on 31/07/2019.
//  Copyright © 2019 AliChuUser. All rights reserved.
//

import Foundation
import UIKit

protocol MainViewProtocol: class {
    func showTranslate(text: String)
    func showButtonState(firstLanguage: String, secondLanguage: String)
    func showTranslateFromHistory(data: Translate)
}

protocol MainPresenterProtocol: class {
    func configureView()
    func configureViewWithHistory(data: Translate)
    func chooseNewLanguage()
    func changeLanguage(firstLanguage: String, secondLanguage: String)
    func provideButtonState(firstLanguage: String, secondLanguage: String)
    func makeTranslate(inputText: String, startLanguage: String, finalLanguage: String)
    func translateReceived(text: String)
}

protocol MainInteractorProtocol: class {
    func fetchTranslate(inputText: String, startLanguage: String, finalLanguage: String)
    func saveButtonState(firstButton: String, secondButton: String)
    func fetchButtonState()
}

protocol MainRouterProtocol: class {
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
    func gotDataFromHistory(data: Translate)
}

protocol MainConfiguratorProtocol: class {
    func configure(with viewController: MainViewController)
}
