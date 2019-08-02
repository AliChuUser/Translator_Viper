//
//  HistoryRouter.swift
//  Translator_Viper
//
//  Created by User on 31/07/2019.
//  Copyright © 2019 AliChuUser. All rights reserved.
//

import Foundation
import UIKit

class HistoryRouter: HistoryRouterProtocol {
    
    weak var viewController: HistoryViewController!
    var mainRouter: MainRouterProtocol? //
    //var mainViewController: MainViewController!
    
    init(viewController: HistoryViewController) {
        self.viewController = viewController
    }
    
    func showMainScreen(with data: Translate) {
        print(#function)
        mainRouter?.gotDataFromHistory(data: data)
        viewController.tabBarController?.selectedIndex = 0
    }
}
