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
    
    var historyArray = [Translate]()
    
    var presenter: HistoryPresenterProtocol?
    var configurator: HistoryConfiguratorProtocol = HistoryConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter?.configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        historyArray = []
        presenter?.getHistory()
    }
    
    func showHistory(with data: [Translate]) {
        historyArray.append(contentsOf: data)
        tableView.reloadData()
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
        return 65
    }
}

extension HistoryViewController: UITableViewDelegate {
    
}
