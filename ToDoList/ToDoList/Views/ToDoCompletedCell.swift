//
//  ToDoCompletedCell.swift
//  toDoList
//
//  Created by Radharani Ribas-Valongo on 4/26/20.
//  Copyright © 2020 Radharani Ribas-Valongo. All rights reserved.
//

import UIKit

class ToDoCompletedCell: UITableViewCell {

    @IBOutlet weak var taskLabel: UILabel!
    //MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(taskLabel)
        constrainTaskLabel()
        
        
    }
    
    required init?(coder: NSCoder) {
       super.init(coder: coder)

    }
    
    func constrainTaskLabel() {
        taskLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            taskLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            taskLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            taskLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            taskLabel.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    
}
