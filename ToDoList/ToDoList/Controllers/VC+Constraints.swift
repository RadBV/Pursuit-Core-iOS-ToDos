//
//  VC+Constraints.swift
//  toDoList
//
//  Created by Radharani Ribas-Valongo on 4/26/20.
//  Copyright © 2020 Radharani Ribas-Valongo. All rights reserved.
//

import UIKit

extension ViewController {

    func setUpTableViewConstraints() {
        toDoListTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            toDoListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            toDoListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toDoListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toDoListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
