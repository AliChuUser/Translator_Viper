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
    
    func showMainScreen(with data: Translate) {
        print(#function)
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let dvc = storyboard.instantiateViewController(withIdentifier: "MainVC") as! MainViewController
        
        dvc.configurator.configure(with: dvc)
        
        //viewController.tabBarController?.selectedIndex = 0
        viewController.present(dvc, animated: true, completion: nil)
        dvc.presenter?.configureViewWithHistory(data: data)
        
    }
}
