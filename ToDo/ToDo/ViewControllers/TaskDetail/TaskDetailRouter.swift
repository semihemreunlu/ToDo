//
//  TaskDetailRouter.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import UIKit

class TaskDetailRouter: TaskDetailRouterProtocol {
    unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: TaskDetailRoute) {
        switch route {
        case .returnToTaskList:
            break
        }
    }
}
