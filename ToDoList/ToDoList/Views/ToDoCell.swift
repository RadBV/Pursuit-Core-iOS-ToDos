//
//  ToDoCell.swift
//  toDoList
//
//  Created by Radharani Ribas-Valongo on 4/26/20.
//  Copyright © 2020 Radharani Ribas-Valongo. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell {
    
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    //MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpSubviews()
        setUpConstraints()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    //MARK: - Functions
    @IBAction func completedButtonPressed(_ sender: UIButton) {
        let updatedTask = Task(name: taskLabel.text!, status: ToDoStatus.completed.rawValue)
        try? TaskPersistenceHelper.manager.changeTaskStatus(taskName: taskLabel.text!, updatedTask: updatedTask)
        do {
            try print(TaskPersistenceHelper.manager.getTasks())
        } catch {
            print(error)
        }
    }
    
    
    func setUpSubviews() {
        contentView.addSubview(taskLabel)
        contentView.addSubview(completeButton)
        
    }
    
    func setUpConstraints() {
        constrainTaskLabel()
        constrainCompletedButton()
        
    }
    
    
    
    //MARK: - Constraints
    
    func constrainTaskLabel() {
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            taskLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            taskLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            taskLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            taskLabel.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func constrainCompletedButton() {
        completeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            completeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            completeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            completeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            completeButton.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
}
