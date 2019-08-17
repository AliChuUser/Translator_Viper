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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function)
    }
    
    func showTranslate(text: String) {
        DispatchQueue.main.async {
            self.outputLabel.text = text
        }
    }
    
    func showTranslateFromHistory(data: Translate) {
        print(#function)
        guard let originalString = data.originalString, let translatedString = data.translatedString else { return }
        
        DispatchQueue.main.async {
            self.inputTextView.textColor = .black
            self.inputTextView.text = originalString
            self.outputLabel.text = translatedString
        }
        
    }
    
    func showButtonState(firstLanguage: String, secondLanguage: String) {
        firstLanguageButton.setTitle(firstLanguage, for: .normal)
        secondLanguageButton.setTitle(secondLanguage, for: .normal)
    }
    
    @IBAction func firstLanguageButtonPressed(_ sender: Any) {
        presenter?.chooseNewLanguage()
    }
    
    @IBAction func secondLanguageButtonPressed(_ sender: Any) {
        presenter?.chooseNewLanguage()
    }
    
    @IBAction func changeLanguageButtonPressed(_ sender: Any) {
        guard let changedSecondLang = firstLanguageButton.titleLabel?.text,
            let changedFirstLang = secondLanguageButton.titleLabel?.text else { return }
        firstLanguageButton.setTitle(changedFirstLang, for: .normal)
        secondLanguageButton.setTitle(changedSecondLang, for: .normal)
        presenter?.changeLanguage(firstLanguage: changedFirstLang, secondLanguage: changedSecondLang)
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
            outputLabel.text = ""
        } else {
            guard let startLanguage = firstLanguageButton.titleLabel?.text,
                let finalLanguage = secondLanguageButton.titleLabel?.text else { return }
            presenter?.makeTranslate(inputText: inputTextView.text, startLanguage: startLanguage, finalLanguage: finalLanguage)
        }
    }
}

