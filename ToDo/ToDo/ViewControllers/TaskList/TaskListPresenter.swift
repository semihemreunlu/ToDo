//
//  TaskListPresenter.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import Foundation

final class TaskListPresenter: BasePresenterProtocol, TaskListPresenterProtocol {
    internal weak var view: TaskListViewProtocol?
    internal var interactor: TaskListInteractorProtocol?
    internal var router: TaskListRouterProtocol?
    
    required init(interactor: TaskListInteractorProtocol,
         view: TaskListViewProtocol,
         router: TaskListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.interactor?.delegate = self
    }
    
    func load() {
        interactor?.load()
    }
}

extension TaskListPresenter: TaskListInteractorDelegate {
    func handleOutput(_ output: TaskListInteractorOutput) {
        switch output {
        case .setLoading(let isLoading):
            view?.handleOutput(.setLoading(isLoading))
        }
    }
}
