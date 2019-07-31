//
//  APIRequest.swift
//  Translator_Viper
//
//  Created by User on 31/07/2019.
//  Copyright © 2019 AliChuUser. All rights reserved.
//

import Foundation

protocol APIRequestProtocol {
    func fetchTranslate(inputText: String,
                        startLanguage: String,
                        finalLanguage: String,
                        resultCallback: @escaping ([String: Any]) -> Void,
                        faliureCallback: @escaping (Error) -> Void)
}

class APIRequest: APIRequestProtocol {
    
    private let keyAPI = "trnsl.1.1.20190731T131937Z.ff78d92816b22fb7.7e867a29e0eb46309457dbdbe59fcaa377fd6e92"
    
    private let baseTranslateURL = "https://translate.yandex.net/api/v1.5/tr.json/translate"
    
    func fetchTranslate(inputText: String,
                        startLanguage: String,
                        finalLanguage: String,
                        resultCallback: @escaping ([String: Any]) -> Void,
                        faliureCallback: @escaping (Error) -> Void) {
        
        let encodInputText = inputText.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        let URLString = "\(baseTranslateURL)?key=\(keyAPI)&lang=\(startLanguage)-\(finalLanguage)&text=\(encodInputText ?? "")"
        
        if let URL = URL(string: URLString) {
            getJSON(from: URL, resultCallback: resultCallback, faliureCallback: faliureCallback)
        }
    }
    
    private func getJSON(from URL: URL, resultCallback: @escaping ([String: Any]) -> Void, faliureCallback: @escaping (Error) -> Void) {
        let session = URLSession.shared
        let task = session.dataTask(with: URL) { (data, response, error) in
            if let error = error {
                faliureCallback(error)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    resultCallback(json)
                } catch let error {
                    faliureCallback(error)
                }
            }
        }
        task.resume()
    }
}




