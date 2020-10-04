//
//  TaskService.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import Foundation
import RealmSwift

protocol TaskServiceProtocol {
    func getTaskList() -> [TaskModel]
}

class TaskService: TaskServiceProtocol {
    private var realm = try! Realm()
    
    func getTaskList() -> [TaskModel] {
        return []
    }
}

class TaskServiceMock: TaskServiceProtocol {
    var taskList: [TaskModel]?
    
    func getTaskList() -> [TaskModel] {
        return taskList ?? []
    }
}
