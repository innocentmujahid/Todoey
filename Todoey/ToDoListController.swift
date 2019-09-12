//
//  ViewController.swift
//  Todoey
//
//  Created by Muhammad Mujahid on 12/09/2019.
//  Copyright © 2019 Muhammad Mujahid. All rights reserved.
//

import UIKit

class ToDoListController: UITableViewController {

    var arrayOfItems = ["Personal","Public","Home"]
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = defaults.array(forKey: "TODOLIST") as? [String] {
            arrayOfItems = items
        }
        
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoitemCell", for: indexPath)
    
        
        cell.textLabel?.text = arrayOfItems[indexPath.row]
    return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print( arrayOfItems[indexPath.row])
  //  tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
        }
        
        
    tableView.deselectRow(at: indexPath, animated: true)
    
    }
    
    @IBAction func addbutton(_ sender: UIBarButtonItem) {
        var textField = UITextField()
    let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
    
        let action = UIAlertAction(title: "Add item", style: .default)  {
            (action) in
            print(textField.text)
            
            
            
            
       self.arrayOfItems.append(textField.text!)
            
            self.defaults.set(self.arrayOfItems, forKey: "TODOLIST")
            self.tableView.reloadData()
        }
        
            alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "create new item"
            textField = alertTextField
            ///print(alertTextField.text)
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
    
    
}

