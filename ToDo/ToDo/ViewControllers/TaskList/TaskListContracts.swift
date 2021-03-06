//
//  TaskListContracts.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import Foundation

// MARK: - View
protocol TaskListViewProtocol: AnyObject {
    func handleOutput(_ output: TaskListPresenterOutput)
}

// MARK: - Interactor
protocol TaskListInteractorProtocol: AnyObject {
    var delegate: TaskListInteractorDelegate? { get set }
    
    func load()
    func selectTask(at index: Int)
    func deleteTask(at index: Int)
    func completeTask(at index: Int)
    func taskListWillDissapear()
}

enum TaskListInteractorOutput {
    case setLoading(_ isLoading: Bool)
    case setTaskList(_ taskList: [TaskModel]?)
    case setEmptyAlert(_ isEmpty: Bool)
    case edit(_ task: TaskModel)
}

protocol TaskListInteractorDelegate: AnyObject {
    func handleOutput(_ output: TaskListInteractorOutput)
}

// MARK: - Presenter
protocol TaskListPresenterProtocol: AnyObject {
    func load()
    func selectTask(at index: Int)
    func deleteTask(at index: Int)
    func completeTask(at index: Int)
    func addTask()
    func taskListWillDissapear()
}

enum TaskListPresenterOutput: Equatable {
    case setLoading(_ isLoading: Bool)
    case setTasks(_ tasks: [TaskListPresentation])
    case setEmptyAlert(_ isEmpty: Bool)
    
    static func == (lhs: TaskListPresenterOutput, rhs: TaskListPresenterOutput) -> Bool {
        return true
    }
}

// MARK: - Router
enum TaskListRoute: Equatable {
    case addTask
    case edit(_ task: TaskModel)
}

protocol TaskListRouterProtocol: AnyObject {
    func navigate(to route: TaskListRoute)
}
