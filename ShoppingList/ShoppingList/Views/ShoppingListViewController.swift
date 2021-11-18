//
//  ShoppingListViewController.swift
//  ShoppingList
//
//  Created by Павел Гришутенко on 16.11.2021.
//

import UIKit

class ShoppingListViewController: UIViewController {
  var shoppingListViewModel: ShoppingListViewModelProtocol? {
    didSet {
      title = shoppingListViewModel?.navigationTitle
      if let addButton = addButton {
        addButton.setTitle(shoppingListViewModel?.addButtonTitle, for: .normal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
        addButton.addTarget(shoppingListViewModel, action: #selector(shoppingListViewModel?.addNewProduct), for: .touchUpInside)
      }
      shoppingListViewModel?.shoppingListDidChange = { [unowned self] viewModel in
        guard let productList = viewModel.productList else { return }
        self.countOfCells = productList.count
        tableView?.reloadData()
      }
    }
  }
  private lazy var tableView: UITableView? = {
    let tableView = UITableView()
    tableView.dataSource = self
    return tableView
  }()
  private var addButton: UIButton? = {
    let button = UIButton(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
    button.backgroundColor = .red
    return button
  }()
  private var countOfCells: Int = 0
  override func viewDidLoad() {
    super.viewDidLoad()
    if let tableView = tableView {
      view.addSubview(tableView)
    }
    setViewsConstraints()
  }
  
}

extension ShoppingListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return countOfCells
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let identifier = "Product \(indexPath.item)"
    var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
    if let cell = cell {
      return cell
    }
    else {
      cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
      var content = cell?.defaultContentConfiguration()
      content?.text = shoppingListViewModel?.productList?[indexPath.item]
      if let content = content {
        cell?.contentConfiguration = content
      }
    }
    return cell!
  }
}


//MARK: - Constraints

extension ShoppingListViewController {
  func setViewsConstraints() {
    setTableViewConstraints()
  }
  
  func setTableViewConstraints() {
    guard let tableView = tableView else { return }
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
      tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
    ])
  }
}
