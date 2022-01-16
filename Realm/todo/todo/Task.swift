//
//  Task.swift
//  todo
//
//  Created by Павел Гришутенко on 16.01.2022.
//

import RealmSwift

class Task: Object {
  @objc dynamic var name = ""
  @objc dynamic var createdAt = NSDate()
  @objc dynamic var notes = ""
  @objc dynamic var isCompleted = false
}
