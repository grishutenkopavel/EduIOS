//
//  ViewController.swift
//  CoreDataTest
//
//  Created by Павел Гришутенко on 02.11.2021.
//

import UIKit
import CoreData

class ViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  var people: [NSManagedObject] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "\"The List\""
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
  }
  
  @IBAction func addName(_ sender: Any) {
    let alert = UIAlertController(title: "New name", message: "Add a new name", preferredStyle: .alert)
     
    let saveAction = UIAlertAction(title: "Save", style: .default) { [self] action in
      let textField = alert.textFields![0]
      if let text = textField.text {
        self.saveName(name: text)
      }
      tableView.reloadData()
    }
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .default)
     
    alert.addTextField()
    alert.addAction(saveAction)
    alert.addAction(cancelAction)
     
    present(alert, animated: true, completion: nil)
  }
  
  func saveName(name: String) {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
   
    let managedContext = appDelegate.persistentContainer.viewContext
    let entity =  NSEntityDescription.entity(forEntityName: "Person", in: managedContext)
   
    let person = NSManagedObject(entity: entity!, insertInto: managedContext)
    person.setValue(name, forKey: "name")
    appDelegate.saveContext()
    people.append(person)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let managedContext = appDelegate.persistentContainer.viewContext
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
    do {
      let results = try managedContext.fetch(request) as! [NSManagedObject]
      people = results
    } catch {
      print("Failed")
    }
  }

}

extension ViewController:  UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return people.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
    let person = people[indexPath.row]
    cell.textLabel?.text = person.value(forKey: "name") as? String 
    return cell
  }
}
