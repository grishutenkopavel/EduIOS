//
//  ViewController.swift
//  todo
//
//  Created by Павел Гришутенко on 15.01.2022.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
  var tableView: UITableView?
  var taskList: [Object]?
//  var addButton: UIButton?
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    
    
  }
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
  
  func setupUI() {
    setTableView()
    setAddButton()
  }
  
  func setTableView() {
    tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
    tableView?.dataSource = self
    if let tableView = tableView {
      view.addSubview(tableView)
    }
  }
  
  func setAddButton() {
    let navigationItem = UINavigationItem()
    navigationItem.title = "ToDo"
    let refreshButton =  UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createNewTask))
    navigationItem.rightBarButtonItem = refreshButton
    navigationController?.navigationBar.items = [navigationItem]

  }
  
  @objc func createNewTask() {
    let alert = UIAlertController(title: "Great Title", message: "Please input something", preferredStyle: .alert)
    let action = UIAlertAction(title: "Name Input", style: .default) { (alertAction) in
//      let textField = alert.textFields![0] as UITextField
    }
    alert.addTextField { (textField) in
    textField.placeholder = "Enter your name"
    }
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
  
  func saveTasksInDB() {
    let taskList = TaskList()
    taskList.name = "task list 2"
    let task1 = Task()
    task1.name = "Name1"
    task1.notes = "hello"
    let task2 = Task()
    task2.name = "Name2"
    task2.notes = "from"
    let task3 = Task()
    task3.name = "Name3"
    task3.notes = "Realm"
    taskList.tasks.append(objectsIn: [task1, task2, task3])
    let path = Bundle.main.path(forResource: "db", ofType: "realm")
    guard let path = path else { return }
    let dbURL = URL(fileURLWithPath: path)
    let realm = try? Realm(fileURL: dbURL)
    if let realm = realm {
      try! realm.write{
          print("was here")
          realm.add(taskList)
        }
    }
  }
  
  func deleteTasksInDB() {
    
  }
  
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let identifier = "task"
    var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
    if let cell = cell {
      return cell
    }
    cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
    guard let cell = cell else {
      return UITableViewCell()
    }
    cell.textLabel?.text = "hello"
    return cell
  }
  
}
