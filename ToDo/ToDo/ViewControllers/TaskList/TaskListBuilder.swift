//
//  TaskListBuilder.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import UIKit

final class TaskListBuilder: NSObject {
    static func make() -> UIViewController {
        let viewController = TaskListViewController.instantiate()
        let router = TaskListRouter(view: viewController)
        let service = TaskService()
        let interactor = TaskListInteractor(service: service)
        let presenter = TaskListPresenter(interactor: interactor,
                                          view: viewController,
                                          router: router)
        viewController.presenter = presenter
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
}
