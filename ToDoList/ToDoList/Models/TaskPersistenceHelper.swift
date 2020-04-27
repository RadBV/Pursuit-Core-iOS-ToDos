//
//  TaskPersistenceHelper.swift
//  toDoList
//
//  Created by Radharani Ribas-Valongo on 4/26/20.
//  Copyright © 2020 Radharani Ribas-Valongo. All rights reserved.
//

import UIKit

struct TaskPersistenceHelper {
    
    private init() {}
    
    //MARK: - variables
    static let manager = TaskPersistenceHelper()
    let persistenceHelper = PersistenceHelper<Task>(fileName: "tasks.plist")
    
    
    func getTasks() throws -> [Task] {
        return try persistenceHelper.getObjects()
    }
    
    func saveTask(task: Task) throws {
        try persistenceHelper.saveObject(newObject: task)
    }
    
    func deleteTask(taskName: String) throws {
        do {
            let tasks =  try getTasks()
            let newTasks = tasks.filter {$0.name != taskName}
            try persistenceHelper.replaceArray(objects: newTasks)
        }
    }
    
    func changeTaskStatus(taskName: String, updatedTask: Task) throws {
        do {
            try deleteTask(taskName: taskName)
            try persistenceHelper.saveObject(newObject: updatedTask)
            
        }
    }
    
}
