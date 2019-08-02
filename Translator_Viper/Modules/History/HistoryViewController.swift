//
//  HistoryViewController.swift
//  Translator_Viper
//
//  Created by User on 31/07/2019.
//  Copyright © 2019 AliChuUser. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, HistoryViewProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var historyArray = [Translate]()
    
    var presenter: HistoryPresenterProtocol?
    var configurator: HistoryConfiguratorProtocol = HistoryConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter?.configureView()
        searchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        historyArray = []
        presenter?.getHistory()
    }
    
    func showHistory(with data: [Translate]) {
        historyArray = []
        historyArray.append(contentsOf: data)
        tableView.reloadData()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        searchBar.resignFirstResponder()
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        presenter?.deleteAllData()
    }
    
    
}

extension HistoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HistoryViewCell
        let model = historyArray[indexPath.row]
        cell.setData(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 62
    }
}

extension HistoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let text = historyArray[indexPath.row].originalString ?? ""
        presenter?.userTappedCell(with: text)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HistoryViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let text = searchBar.text {
            if !text.isEmpty {
                presenter?.searchBarTextDidChange(with: text)
            } else {
                historyArray = []
                presenter?.getHistory()
            }
        }
    }
    
}
