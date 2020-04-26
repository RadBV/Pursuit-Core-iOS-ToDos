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
    
    
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableViewConstraints()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Functions
    @IBAction func segueToCreateTaskVC(_ sender: UIBarButtonItem) {
        let createVC = CreateTaskVC()
        self.navigationController?.pushViewController(createVC, animated: true)
    }
    
}

