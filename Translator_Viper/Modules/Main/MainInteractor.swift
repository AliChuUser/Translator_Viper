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
    
    var networkService: NetworkServiceProtocol = NetworkService()
    
    required init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
    
    func saveButtonState(firstButton: String, secondButton: String) {
        StorageService.saveUserDefaults(firstButton: firstButton, secondButton: secondButton)
    }
    
    func fetchButtonState() {
        let buttonStateArray = StorageService.fetchUserDefaults()
        presenter?.provideButtonState(firstLanguage: buttonStateArray[0], secondLanguage: buttonStateArray[1])
    }
    
    func fetchTranslate(inputText: String, startLanguage: String, finalLanguage: String) {
        
        // fetch data from CoreData if possible
        StorageService.fetchData(resultCallback: { translates in
            if !translates.isEmpty {
                translates.forEach({ translate in
                    if translate.originalString == inputText {
                        guard let translatedString = translate.translatedString else { return }
                        self.presenter?.translateReceived(text: translatedString)
                        print("Got from Storage")
                        return
                    } else if translate.translatedString == inputText {
                        guard let originalString = translate.originalString else { return }
                        self.presenter?.translateReceived(text: originalString)
                        print("Got from Storage")
                        return
                    }
                })
                // Решить проблему двойного сохранения в coreData
                self.networkRequest(inputText: inputText, startLanguage: startLanguage, finalLanguage: finalLanguage)
            } else {
                self.networkRequest(inputText: inputText, startLanguage: startLanguage, finalLanguage: finalLanguage)
            }
        }) { (error) in
            
        }
    }
    
    // network request
    private func networkRequest(inputText: String, startLanguage: String, finalLanguage: String) {
        networkService.fetchTranslate(inputText: inputText, startLanguage: startLanguage, finalLanguage: finalLanguage, resultCallback: { (dict) in
            let textArray = dict["text"] as! [String]
            print(textArray)
            if let text = textArray.first {
                StorageService.saveData(originalString: inputText, translatedString: text)
                self.presenter?.translateReceived(text: text)
                print("Got from Net")
            } else {
                print("Cannot fetch text from dict")
            }
        }) { (error) in
            print("Cannot conver json: \(error.localizedDescription)")
        }
    }
}
