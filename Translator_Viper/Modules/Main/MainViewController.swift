//
//  MainViewController.swift
//  Translator_Viper
//
//  Created by User on 31/07/2019.
//  Copyright © 2019 AliChuUser. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, MainViewProtocol {
    
    @IBOutlet weak var firstLanguageButton: UIButton!
    @IBOutlet weak var secondLanguageButton: UIButton!
    @IBOutlet weak var changeLanguageButton: UIButton!
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var outputLabel: UILabel!
    
    var presenter: MainPresenterProtocol?
    var configurator: MainConfiguratorProtocol = MainConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter?.configureView()
        inputTextView.delegate = self
        inputTextView.textColor = UIColor.lightGray
    }
    
    func showTranslate(text: String) {
        DispatchQueue.main.async {
            self.outputLabel.text = text
        }
        
    }
    
    @IBAction func firstLanguageButtonPressed(_ sender: Any) {
        presenter?.chooseNewLanguage()
    }
    
    @IBAction func secondLanguageButtonPressed(_ sender: Any) {
        presenter?.chooseNewLanguage()
    }
    
    @IBAction func changeLanguageButtonPressed(_ sender: Any) {
        presenter?.changeLanguage()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        inputTextView.resignFirstResponder()
    }
    
}

// MARK: - TextView Delegate Methods

extension MainViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if inputTextView.textColor == UIColor.lightGray {
            inputTextView.text = nil
            inputTextView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if inputTextView.text.isEmpty {
            inputTextView.text = "Text or website address"
            inputTextView.textColor = UIColor.lightGray
        } else {
            presenter?.makeTranslate(inputText: inputTextView.text, startLanguage: "en", finalLanguage: "ru")
        }
    }
}

