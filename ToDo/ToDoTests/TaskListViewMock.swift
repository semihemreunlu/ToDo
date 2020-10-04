//
//  TaskListViewMock.swift
//  ToDoTests
//
//  Created by Semih Emre Ünlü on 5.10.2020.
//

import Foundation
import XCTest

@testable import ToDo
class TaskListViewMock:  TaskListViewProtocol {
    var presenter: TaskListPresenter!
    
    var outputs: [TaskListPresenterOutput] = []

    func viewDidLoad() {
        presenter?.load()
    }

    func handleOutput(_ output: TaskListPresenterOutput) {
        outputs.append(output)
    }
}
