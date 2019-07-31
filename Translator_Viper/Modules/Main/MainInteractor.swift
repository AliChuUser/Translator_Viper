//
//  MainInteractor.swift
//  Translator_Viper
//
//  Created by User on 31/07/2019.
//  Copyright © 2019 AliChuUser. All rights reserved.
//

import Foundation

class MainInteractor: MainInteractorProtocol {
    
    var presenter: MainPresenterProtocol?
    
    var apiRequest: APIRequestProtocol = APIRequest()
    
    required init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    func receiveTranslate(inputText: String, startLanguage: String, finalLanguage: String) {
        apiRequest.fetchTranslate(inputText: inputText,
                                  startLanguage: startLanguage,
                                  finalLanguage: finalLanguage,
                                  resultCallback: { (dict) in
            let textArray = dict["text"] as! [String]
            print(textArray)
            if let text = textArray.first {
                self.presenter?.translateReceived(text: text)
            } else {
                print("Cannot fetch text from dict")
            }
        }) { (error) in
            print("Cannot conver json: \(error.localizedDescription)")
        }
    }
    
    
}
