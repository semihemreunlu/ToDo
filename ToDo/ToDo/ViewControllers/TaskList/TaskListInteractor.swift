//
//  TaskListInteractor.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import Foundation


final class TaskListInteractor: TaskListInteractorProtocol {
    weak var delegate: TaskListInteractorDelegate?
    private let service: TaskServiceProtocol
    private var tasks: [TaskModel]?
    
    init(service: TaskServiceProtocol) {
        self.service = service
    }
    
    func load() {
     
    }
}
