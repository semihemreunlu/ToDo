//
//  TaskDetailBuilder.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import UIKit

final class TaskDetailBuilder: NSObject {
    static func make(_ task: TaskModel? = nil) -> UIViewController {
        let viewController = TaskDetailViewController.instantiate()
        let router = TaskDetailRouter(view: viewController)
        let service = TaskService()
        let interactor = TaskDetailInteractor(service: service, task: task)
        let presenter = TaskDetailPresenter(interactor: interactor,
                                            view: viewController,
                                            router: router)
        viewController.presenter = presenter
        return viewController
    }
}


