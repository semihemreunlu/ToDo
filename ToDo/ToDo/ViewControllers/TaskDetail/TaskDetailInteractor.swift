//
//  TaskDetailInteractor.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import Foundation
import RealmSwift

final class TaskDetailInteractor: TaskDetailInteractorProtocol {
    weak var delegate: TaskDetailInteractorDelegate?
    private let service: TaskServiceProtocol
    var task: TaskModel?
    
    init(service: TaskServiceProtocol, task: TaskModel?) {
        self.service = service
        self.task = task
    }
    
    func load() {
        self.delegate?.handleOutput(.setLoading(true))
        if let task = task {
            self.delegate?.handleOutput(.show(task))
        } else {
            self.delegate?.handleOutput(.hideDeleteButton)
        }
        self.delegate?.handleOutput(.setLoading(false))
        
    }
    
    func save(_ task: TaskDetailPresentation) {
        if self.task != nil {
            service.updateTask(task: TaskModel(title: task.title,
                                               note: task.note,
                                               dueDate: task.dueDate,
                                               id: self.task!.id))
        } else {
            service.addTask(task: TaskModel(title: task.title,
                                            note: task.note,
                                            dueDate: task.dueDate))
        }
        self.delegate?.handleOutput(.showSucceed("Saved"))
    }
    
    func deleteButtonTapped() {
        service.deleteTask(task: self.task!)
        self.delegate?.handleOutput(.showSucceed("Deleted"))
    }
}
