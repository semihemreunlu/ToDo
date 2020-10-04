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
        switch route {
        case .addTask:
            self.view.present(TaskDetailBuilder.make(),
                              animated: true)
        case .edit(let task):
            self.view.present(TaskDetailBuilder.make(task),
                              animated: true)
        }
    }
}
