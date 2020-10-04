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
    
    func selectTask(at index: Int) {
        interactor?.selectTask(at: index)
    }
    
    func deleteTask(at index: Int) {
        interactor?.deleteTask(at: index)
    }
    
    func completeTask(at index: Int) {
        interactor?.completeTask(at: index)
    }
    
    func addTask() {
        router?.navigate(to: .addTask)
    }
}

extension TaskListPresenter: TaskListInteractorDelegate {
    func handleOutput(_ output: TaskListInteractorOutput) {
        switch output {
        case .setLoading(let isLoading):
            view?.handleOutput(.setLoading(isLoading))
        case .setTaskList(let tasks):
            var taskPresentationArray: [TaskListPresentation] = []
            
            for task in tasks ?? [] {
                let taskPresentation = TaskListPresentation(title: task.title,
                                                            note: task.note,
                                                            dueDate: task.dueDate,
                                                            isCompleted: task.isCompleted)
                taskPresentationArray.append(taskPresentation)
            }
            view?.handleOutput(.setTasks(taskPresentationArray))
        }
    }
}
