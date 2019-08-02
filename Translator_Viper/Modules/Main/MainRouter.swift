//
//  MainRouter.swift
//  Translator_Viper
//
//  Created by User on 31/07/2019.
//  Copyright © 2019 AliChuUser. All rights reserved.
//

import Foundation
import UIKit

class MainRouter: MainRouterProtocol {
    
    weak var viewController: MainViewController!
    var presenter: MainPresenterProtocol?
    
    init(viewController: MainViewController) {
        self.viewController = viewController
    }
    
    func gotDataFromHistory(data: Translate) {
        print(#function)
        presenter?.configureViewWithHistory(data: data)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // for future segues
    }
}
