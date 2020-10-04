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
    func addTask(task: TaskModel, isUpdate: Bool?)
    func updateTask(task: TaskModel)
    func getTask(with id: String) -> TaskModel?
    func changeTaskNote(task: TaskModel, note: String)
    func completeTask(task: TaskModel)
    func undoneTask(task: TaskModel)
    func deleteTask(task: TaskModel)
    func observe(_ block: @escaping NotificationBlock) -> NotificationToken
}

class TaskService: TaskServiceProtocol {
    func observe(_ block: @escaping NotificationBlock) -> NotificationToken {
        realm.observe(block)
    }
    
    private var realm = try! Realm()
    
    //MARK: Tasks
    private func getTasks() -> Results<TaskModel> {
        return realm.objects(TaskModel.self)
    }
    
    func getTaskList() -> [TaskModel] {
        return getTasks().filter({ (_) -> Bool in
            return true
        })
    }
    
    func addTask(task: TaskModel, isUpdate: Bool? = false) {
        do {
            try realm.write {
                realm.add(task, update: (isUpdate ?? false) ? .all : .modified)
                
                if let dueDate = task.dueDate {
                    if isUpdate ?? false {
                        LocalNotificationManager.instance.updateNotification(title: task.title,
                                                                             note: task.note,
                                                                             date: dueDate,
                                                                             id: task.id)
                    } else {
                        LocalNotificationManager.instance.createNotification(title: task.title,
                                                                             note: task.note,
                                                                             date: dueDate,
                                                                             id: task.id)
                    }
                }
            }
        }
        catch {
            setError(name: #function, object: task)
        }
    }
    
    func updateTask(task: TaskModel) {
        self.addTask(task: task, isUpdate: true)
    }
    
    func getTask(with id: String) -> TaskModel? {
        let results = self.getTasks().filter("id == '\(id)'")
        return results.first
    }
    
    func changeTaskNote(task: TaskModel, note: String) {
        do {
            try realm.write {
                task.note = note
            }
        }
        catch {
            setError(name: #function, object: task)
        }
    }
    
    func completeTask(task: TaskModel) {
        do {
            try realm.write {
                task.isCompleted = true
                task.dueDate = Date()
            }
            
        }
        catch {
            setError(name: #function, object: task)
        }
    }
    
    func undoneTask(task: TaskModel) {
        do {
            try realm.write {
                task.isCompleted = false
                task.dueDate = nil
            }
        }
        catch {
            setError(name: #function, object: task)
        }
    }
    
    func deleteTask(task: TaskModel) {
        do {
            try realm.write {
                realm.delete(task)
            }
        }
        catch {
            setError(name: #function, object: task)
        }
    }
    
    //MARK: Error
    func setError(name: String, object: Object) {
        print("Realm error reason: \(name) - \(object)")
    }
}

class TaskServiceMock: TaskServiceProtocol {
    var taskList: [TaskModel]?
    
    func getTaskList() -> [TaskModel] {
        return taskList ?? []
    }
    
    func addTask(task: TaskModel, isUpdate: Bool?) {
        
    }
    
    func updateTask(task: TaskModel) {
        
    }
    
    func getTask(with id: String) -> TaskModel? {
        return nil
    }
    
    func changeTaskNote(task: TaskModel, note: String) {
        
    }
    
    func completeTask(task: TaskModel) {
        
    }
    
    func undoneTask(task: TaskModel) {
        
    }
    
    func deleteTask(task: TaskModel) {
        
    }
    
    func observe(_ block: @escaping NotificationBlock) -> NotificationToken {
        return NotificationToken()
    }
}
