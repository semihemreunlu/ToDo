//
//  TaskDetailViewController.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import UIKit

class TaskDetailViewController: BaseViewController<TaskDetailPresenter> {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.load()
    }
}

extension TaskDetailViewController: TaskDetailViewProtocol {
    func handleOutput(_ output: TaskDetailPresenterOutput) {
        
    }
}
