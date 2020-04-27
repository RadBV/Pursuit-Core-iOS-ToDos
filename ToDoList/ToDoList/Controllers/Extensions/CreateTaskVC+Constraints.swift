//
//  CreateTaskVC+Constraints.swift
//  toDoList
//
//  Created by Radharani Ribas-Valongo on 4/26/20.
//  Copyright © 2020 Radharani Ribas-Valongo. All rights reserved.
//

import UIKit

extension CreateTaskVC {
    func setUpSubviews() {
        view.addSubview(needToDoLabel)
        view.addSubview(inputTextfield)
        view.addSubview(createTaskButton)
    }
    
    func setUpConstraints() {
        constrainNeedToDoLabel()
        constrainInputTextField()
        constrainCreateButton()
    }
    
    func constrainNeedToDoLabel() {
        needToDoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            needToDoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            needToDoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            needToDoLabel.heightAnchor.constraint(equalToConstant: 42),
            needToDoLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func constrainInputTextField() {
        inputTextfield.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            inputTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputTextfield.topAnchor.constraint(equalTo: needToDoLabel.bottomAnchor, constant: 20),
            inputTextfield.heightAnchor.constraint(equalToConstant: 42),
            inputTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            inputTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
    }
    
    func constrainCreateButton() {
        createTaskButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            createTaskButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createTaskButton.topAnchor.constraint(equalTo: inputTextfield.bottomAnchor, constant: 20),
            createTaskButton.heightAnchor.constraint(equalToConstant: 42),
            createTaskButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
}
