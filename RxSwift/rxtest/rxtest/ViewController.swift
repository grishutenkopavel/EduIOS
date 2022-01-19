//
//  ViewController.swift
//  rxtest
//
//  Created by Павел Гришутенко on 19.01.2022.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController, UITableViewDataSource {

  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var tableView: UITableView!
  
  var shownCities = [String]()
  let allCities = ["New York", "London", "Oslo", "Warsaw", "Berlin", "Praga"]
  let disposeBag = DisposeBag()
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    searchBar.rx.text
      .subscribe (onNext: { [unowned self] (query) in
        guard let query = query else { return }
        self.shownCities = self.allCities.filter { $0.hasPrefix(query) }
        self.tableView.reloadData() // И перезагружаем данные таблицы
      })
      .disposed(by: disposeBag)
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return shownCities.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cityPrototypeCell", for: indexPath)
        cell.textLabel?.text = shownCities[indexPath.row]
     
        return cell
  }
}

