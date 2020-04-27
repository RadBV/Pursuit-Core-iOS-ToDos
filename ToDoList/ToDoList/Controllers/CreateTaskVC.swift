//
//  CreateTaskVC.swift
//  toDoList
//
//  Created by Radharani Ribas-Valongo on 4/26/20.
//  Copyright © 2020 Radharani Ribas-Valongo. All rights reserved.
//

import UIKit

class CreateTaskVC: UIViewController {
    
    //MARK: - Properties
    
    lazy var needToDoLabel: UILabel = {
        let label = UILabel()
        label.text = "What do you need to do?"
        label.textAlignment = .center
        return label
    }()
    
    lazy var inputTextfield: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Eat large amounts of broccoli."
        textfield.borderStyle = .roundedRect
        return textfield
    }()
    
    lazy var createTaskButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create Task", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(createTask), for: .touchUpInside)
        return button
    }()
    
    //MARK: - view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpSubviews()
        setUpConstraints()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - OBJC Functions
    
    @objc func createTask() {
        guard let task = inputTextfield.text else {
            print("invalid input")
            return
        }
        guard task != "" else {
            print("invalid input")
            return
        }
        
        let newTask = Task(name: task, status: ToDoStatus.outstanding.rawValue)
        try? TaskPersistenceHelper.manager.saveTask(task: newTask)
        print(loadPersistenceData())
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    private func loadPersistenceData() -> [Task]{
        do {
            let tasks = try TaskPersistenceHelper.manager.getTasks()
            return tasks
        
        } catch {
            print("could not retrieve recipes from PersistenceHelper: \(error)")
        }
        return [Task]()
    }
    
    

}
