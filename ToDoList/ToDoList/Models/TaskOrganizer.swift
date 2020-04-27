//
//  TaskOrganizer.swift
//  toDoList
//
//  Created by Radharani Ribas-Valongo on 4/26/20.
//  Copyright © 2020 Radharani Ribas-Valongo. All rights reserved.
//

import UIKit

struct TaskOrganizer {
    
    func separateTasks(tasks: [Task]) -> [OrganizedTasks] {
        let completedTasks = OrganizedTasks(tasks: tasks.filter { $0.status == ToDoStatus.completed.rawValue })
        let outstandingTasks = OrganizedTasks(tasks:tasks.filter {$0.status == ToDoStatus.outstanding.rawValue}) 
        return [outstandingTasks,completedTasks]
    }
}
