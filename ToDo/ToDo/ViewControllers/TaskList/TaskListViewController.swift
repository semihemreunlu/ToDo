//
//  TaskListViewController.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import UIKit

class TaskListViewController: BaseViewController<TaskListPresenter> {

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.load()
    }
}

extension TaskListViewController: TaskListViewProtocol {
    func handleOutput(_ output: TaskListPresenterOutput) {
        
    }
}
