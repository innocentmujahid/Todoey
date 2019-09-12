//
//  ViewController.swift
//  Todoey
//
//  Created by Muhammad Mujahid on 12/09/2019.
//  Copyright © 2019 Muhammad Mujahid. All rights reserved.
//

import UIKit

class ToDoListController: UITableViewController {

    let arrayOfItems = ["Personal","Public","Home"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    
}

