//
//  TaskDetailContracts.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import Foundation

// MARK: - View
protocol TaskDetailViewProtocol: AnyObject {
    func handleOutput(_ output: TaskDetailPresenterOutput)
}

// MARK: - Interactor
protocol TaskDetailInteractorProtocol: AnyObject {
    var delegate: TaskDetailInteractorDelegate? { get set }
    
    func load()
    func save(_ task: TaskDetailPresentation)
    func deleteButtonTapped()
}

enum TaskDetailInteractorOutput {
    case setLoading(_ isLoading: Bool)
    case show(_ task: TaskModel)
    case hideDeleteButton
    case showSucceed(_ text: String)
}

protocol TaskDetailInteractorDelegate: AnyObject {
    func handleOutput(_ output: TaskDetailInteractorOutput)
}

// MARK: - Presenter
protocol TaskDetailPresenterProtocol: AnyObject {
    func load()
    func save(_ task: TaskDetailPresentation)
    func deleteButtonTapped()
}

enum TaskDetailPresenterOutput: Equatable {
    case setLoading(_ isLoading: Bool)
    case show(_ task: TaskDetailPresentation)
    case hideDeleteButton
    case showSucceed(_ text: String)
    
    static func == (lhs: TaskDetailPresenterOutput, rhs: TaskDetailPresenterOutput) -> Bool {
        return true
    }
}

// MARK: - Router
enum TaskDetailRoute: Equatable {
    case returnToTaskList
}

protocol TaskDetailRouterProtocol: AnyObject {
    func navigate(to route: TaskDetailRoute)
}
