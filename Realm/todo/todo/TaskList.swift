//
//  TaskList.swift
//  todo
//
//  Created by Павел Гришутенко on 16.01.2022.
//

import RealmSwift

class TaskList: Object {
  @objc dynamic var name = ""
  @objc dynamic var createdAt = NSDate()
  let tasks = List<Task>()
}
