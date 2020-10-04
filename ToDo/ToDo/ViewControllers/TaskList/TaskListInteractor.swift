//
//  TaskListInteractor.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import Foundation
import RealmSwift

final class TaskListInteractor: TaskListInteractorProtocol {
    weak var delegate: TaskListInteractorDelegate?
    private let service: TaskServiceProtocol
    private var tasks: [TaskModel]?
    private var notificationToken: NotificationToken?
    
    init(service: TaskServiceProtocol) {
        self.service = service
    }
    
    func load() {
        notificationToken = service.observe({ (notification, realm) in
            self.getTaskList()
        })
        getTaskList()
    }
    
    func getTaskList() {
        self.delegate?.handleOutput(.setLoading(true))
        self.tasks = self.service.getTaskList()
        self.delegate?.handleOutput(.setTaskList(tasks))
        self.delegate?.handleOutput(.setLoading(false))
        self.delegate?.handleOutput(.setEmptyAlert(self.tasks?.isEmpty ?? true))
    }
    
    func selectTask(at index: Int) {
        guard let task = tasks?[safe:index] else {
            return
        }
        self.delegate?.handleOutput(.edit(task))
    }
    
    func deleteTask(at index: Int) {
        guard let task = tasks?[safe:index] else {
            return
        }
        service.deleteTask(task: task)
    }
    
    func completeTask(at index: Int) {
        guard let task = tasks?[safe:index] else {
            return
        }
        service.completeTask(task: task)
    }
    
    func taskListWillDissapear() {
        notificationToken?.invalidate()
    }
}
