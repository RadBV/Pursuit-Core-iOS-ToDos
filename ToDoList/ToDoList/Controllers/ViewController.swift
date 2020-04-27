//
//  ViewController.swift
//  toDoList
//
//  Created by Radharani Ribas-Valongo on 4/26/20.
//  Copyright © 2020 Radharani Ribas-Valongo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var toDoListTableView: UITableView!
    @IBOutlet weak var addTaskButton: UIBarButtonItem!
    
    
    var organizedTasks = [OrganizedTasks]()
    var tasks = [Task]() {
        didSet {
            loadOrganizedTasks()
            toDoListTableView.reloadData()
        }
    }
    var test = ["1","2","3"]
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableViewConstraints()
        loadPersistenceData()
        loadOrganizedTasks()
        setUpDelegates()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Functions
    @IBAction func segueToCreateTaskVC(_ sender: UIBarButtonItem) {
        let createVC = CreateTaskVC()
        self.navigationController?.pushViewController(createVC, animated: true)
    }
    private func setUpDelegates() {
        toDoListTableView.dataSource = self
        toDoListTableView.delegate = self
    }
    
    private func loadPersistenceData(){
        do {
            let tasks = try TaskPersistenceHelper.manager.getTasks()
            self.tasks = tasks
        } catch {
            print("could not retrieve recipes from PersistenceHelper: \(error)")
        }
    }
    private func loadOrganizedTasks() {
        let taskOrganizer = TaskOrganizer()
        organizedTasks = taskOrganizer.separateTasks(tasks: self.tasks)
        print(organizedTasks)
    }
    
}

