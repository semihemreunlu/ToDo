//
//  TaskListRouter.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import UIKit

class TaskListRouter: TaskListRouterProtocol {
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: TaskListRoute) {
    }
}
