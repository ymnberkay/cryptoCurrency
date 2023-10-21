//
//  ViewController.swift
//  PazaramaBootacamp2.2
//
//  Created by Berkay Yaman on 21.10.2023.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView()
    var activityIndicator = UIActivityIndicatorView()
    
    var cryptoList = [Crypto]()
    let disposeBag = DisposeBag()
    let cryptoVM = CryptoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        self.title = "Crypto currency"
        setupBindings()
        setupUI()
        cryptoVM.requestData()
    }

    private func setupUI() {
        view.addSubview(tableView)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)
        
    }
    private func setupBindings() {
        
        cryptoVM
            .cryptos
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { cryptos in
            self.cryptoList = cryptos
            self.tableView.reloadData()
        }.disposed(by: disposeBag)
        
        
        cryptoVM
            .error
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { error in
            print(error)
        }.disposed(by: disposeBag)
        
        cryptoVM
            .loading
            .bind(to: self.activityIndicator.rx.isAnimating)
            .disposed(by: disposeBag)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        cell.titleLabel.text = cryptoList[indexPath.row].currency
        cell.subtitleLabel.text = cryptoList[indexPath.row].price
        return cell
       
//        let cell = UITableViewCell()
//        var content = cell.defaultContentConfiguration()
//        content.text = cryptoList[indexPath.row].currency
//        content.secondaryText = cryptoList[indexPath.row].price
//        cell.contentConfiguration = content
//        return cell
    }
    
}

