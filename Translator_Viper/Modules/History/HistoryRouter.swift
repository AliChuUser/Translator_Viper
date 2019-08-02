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
    
    init(viewController: HistoryViewController) {
        self.viewController = viewController
    }
    
    func showMainScreen(with text: String) {
        print(#function)
    }
    
}
