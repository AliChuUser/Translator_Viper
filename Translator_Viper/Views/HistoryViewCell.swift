//
//  HistoryViewCell.swift
//  Translator_Viper
//
//  Created by Aleksei Chudin on 01/08/2019.
//  Copyright © 2019 AliChuUser. All rights reserved.
//

import UIKit

protocol HistoryViewCellProtocol: class {
    func setData()
}

class HistoryViewCell: UITableViewCell, HistoryViewCellProtocol {
    
    @IBOutlet weak var originalLanguageLabel: UILabel!
    
    @IBOutlet weak var translatedLanguageLabel: UILabel!
    
    func setData() {
        
    }
}
