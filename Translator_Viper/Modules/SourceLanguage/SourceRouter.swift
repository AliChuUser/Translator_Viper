//
//  SourceRouter.swift
//  Translator_Viper
//
//  Created by Aleksei Chudin on 01/08/2019.
//  Copyright © 2019 AliChuUser. All rights reserved.
//

import Foundation

class SourceRouter: SourceRouterProtocol {
    
    weak var viewController: SourceViewController!
    
    init(viewController: SourceViewController) {
        self.viewController = viewController
    }
    
    func closeViewController() {
        viewController.dismiss(animated: true, completion: nil)
    }
    
}
