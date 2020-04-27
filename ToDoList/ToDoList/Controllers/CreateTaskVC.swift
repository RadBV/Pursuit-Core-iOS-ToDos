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

}
