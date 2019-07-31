//
//  SourceInteractor.swift
//  Translator_Viper
//
//  Created by Aleksei Chudin on 01/08/2019.
//  Copyright © 2019 AliChuUser. All rights reserved.
//

import Foundation

class SourceInteractor: SourceInteractorProtocol {
    
    weak var presenter: SourcePresenterProtocol!
    
    required init(presenter: SourcePresenterProtocol) {
        self.presenter = presenter
    }
    
}
