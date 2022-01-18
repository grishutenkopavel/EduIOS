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
  var taskList: TaskList?
  var realm: Realm?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupDB()
  }
  
  func setupUI() {
    setTableView()
    setAddButton()
  }
  
  func setTableView() {
    tableView = UITableView()
    tableView?.dataSource = self
    tableView?.delegate = self
    if let tableView = tableView {
      view.addSubview(tableView)
    }
    guard let tableView = tableView else { return }
    tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
  
  func setAddButton() {
    let navigationItem = UINavigationItem()
    navigationItem.title = "ToDo"
    let addButton =  UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createNewTask))
    navigationItem.rightBarButtonItem = addButton
    navigationController?.navigationBar.items = [navigationItem]
  }
  
  @objc func createNewTask() {
    let alert = UIAlertController(title: "New task", message: "Please input something", preferredStyle: .alert)
    let action = UIAlertAction(title: "Task Input", style: .default) { (alertAction) in
      let textField = alert.textFields![0] as UITextField
      self.saveTasksInDB(text: textField.text)
    }
    alert.addTextField { (textField) in
    textField.placeholder = "Enter your task"
    }
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
  
  func setupDB() {
    let path = Bundle.main.path(forResource: "db", ofType: "realm")
    guard let path = path else { return }
    let dbURL = URL(fileURLWithPath: path)
    realm = try? Realm(fileURL: dbURL)
    
    let firstTaskList = realm?.objects(TaskList.self).first
    if firstTaskList == nil {
      createNewTaskList()
    }
    else {
      taskList = firstTaskList
    }
  }
  
  func createNewTaskList() {
    taskList = TaskList()
    taskList?.name = "task list"
    if let realm = realm, let taskList = taskList {
      try! realm.write{
        realm.add(taskList)
      }
    }
  }
  
  func saveTasksInDB(text: String?) {
    guard let text = text else { return }
    let newTask = Task()
    newTask.name = "newTask"
    newTask.notes = text
    
    if let realm = realm, let taskList = taskList {
      try! realm.write{
        taskList.tasks.append(newTask)
      }
    }
    updateTable()
  }
  
  func deleteTasksInDB(index: Int) {
    if let realm = realm, let taskList = taskList {
      try! realm.write{
        realm.delete(taskList.tasks[index])
      }
    }
    updateTable()
  }
  
  func updateTable() {
    tableView?.reloadData()
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return (taskList?.tasks.count)!
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let identifier = "task"
    var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
    if cell == nil {
      cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
    }
    guard let cell = cell else {
      return UITableViewCell()
    }
    if let text = taskList?.tasks[indexPath.row].notes {
      cell.textLabel?.text = text
    }

    return cell
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      deleteTasksInDB(index: indexPath.item)
    }
  }
  
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView,
                 leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    let action = UIContextualAction(style: .normal, title: "Complete") { [weak self] (action, view, completionHandler) in
      //TODO: add strikethrough text
      completionHandler(true)
    }
    action.backgroundColor = .systemBlue
    return UISwipeActionsConfiguration(actions: [action])
  }
}
