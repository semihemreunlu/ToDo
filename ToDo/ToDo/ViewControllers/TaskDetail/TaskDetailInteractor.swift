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
        
    }
}
