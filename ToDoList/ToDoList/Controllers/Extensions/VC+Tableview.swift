//
//  VC+Tableview.swift
//  toDoList
//
//  Created by Radharani Ribas-Valongo on 4/26/20.
//  Copyright © 2020 Radharani Ribas-Valongo. All rights reserved.
//

import UIKit

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return organizedTasks.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return organizedTasks[section].tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if organizedTasks[indexPath.section].tasks[indexPath.row].status == ToDoStatus.outstanding.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoCell
            cell.taskLabel.text = organizedTasks[0].tasks[indexPath.row].name
            
            return cell
        } else if organizedTasks[indexPath.section].tasks[indexPath.row].status == ToDoStatus.completed.rawValue {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCompletedCell", for: indexPath) as! ToDoCompletedCell
            cell.taskLabel.text = organizedTasks[1].tasks[indexPath.row].name
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Outstanding"
        } else {
            return "Completed"
        }
    }
    
    
}
