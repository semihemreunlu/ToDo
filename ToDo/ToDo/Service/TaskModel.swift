//
//  TaskModel.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import RealmSwift

class TaskModel: Object {
    @objc dynamic var note: String = ""
    
    convenience init(note: String) {
        self.init()
        
        self.note = note
    }
}
