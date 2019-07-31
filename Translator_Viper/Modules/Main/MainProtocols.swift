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
}

protocol MainPresenterProtocol: class {
    func configureView()
    func chooseNewLanguage()
    func changeLanguage()
    func makeTranslate(inputText: String, startLanguage: String, finalLanguage: String)
    func translateReceived(text: String)
}

protocol MainInteractorProtocol: class {
    func receiveTranslate(inputText: String, startLanguage: String, finalLanguage: String)
}

protocol MainRouterProtocol: class {
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

protocol MainConfiguratorProtocol: class {
    func configure(with viewController: MainViewController)
}
