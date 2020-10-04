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
}

enum TaskListInteractorOutput {
    case setLoading(_ isLoading: Bool)
}

protocol TaskListInteractorDelegate: AnyObject {
    func handleOutput(_ output: TaskListInteractorOutput)
}

// MARK: - Presenter
protocol TaskListPresenterProtocol: AnyObject {
    func load()
}

enum TaskListPresenterOutput: Equatable {
    case setLoading(_ isLoading: Bool)
    
    static func == (lhs: TaskListPresenterOutput, rhs: TaskListPresenterOutput) -> Bool {
        return true
    }
}

// MARK: - Router
enum TaskListRoute: Equatable {
    
}

protocol TaskListRouterProtocol: AnyObject {
    func navigate(to route: TaskListRoute)
}
