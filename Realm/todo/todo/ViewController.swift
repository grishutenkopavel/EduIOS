//
//  ViewController.swift
//  todo
//
//  Created by Павел Гришутенко on 15.01.2022.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
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


}

