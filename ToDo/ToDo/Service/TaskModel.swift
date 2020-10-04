//
//  TaskModel.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import RealmSwift

class TaskModel: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var note: String = ""
    @objc dynamic var id = NSUUID().uuidString
    @objc dynamic var createDate = Date()
    @objc dynamic var dueDate: Date?
    @objc dynamic var isCompleted = false
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(title: String?,
                     note: String,
                     dueDate: Date? = nil) {
        self.init()
        
        self.title = title ?? "Note"
        self.note = note
        self.dueDate = dueDate
    }
    
    convenience init(title: String?,
                     note: String,
                     dueDate: Date? = nil,
                     id: String) {
        self.init()
        
        self.title = title ?? "Note"
        self.note = note
        self.dueDate = dueDate
        self.id = id
    }
}
