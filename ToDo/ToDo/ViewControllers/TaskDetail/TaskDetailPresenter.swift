//
//  TaskDetailPresenter.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import Foundation

final class TaskDetailPresenter: BasePresenterProtocol, TaskDetailPresenterProtocol {
    internal weak var view: TaskDetailViewProtocol?
    internal var interactor: TaskDetailInteractorProtocol?
    internal var router: TaskDetailRouterProtocol?
    
    required init(interactor: TaskDetailInteractorProtocol,
         view: TaskDetailViewProtocol,
         router: TaskDetailRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.interactor?.delegate = self
    }
    
    func load() {
        interactor?.load()
    }
}

extension TaskDetailPresenter: TaskDetailInteractorDelegate {
    func handleOutput(_ output: TaskDetailInteractorOutput) {
        switch output {
        case .setLoading(let isLoading):
            view?.handleOutput(.setLoading(isLoading))
        }
    }
}
