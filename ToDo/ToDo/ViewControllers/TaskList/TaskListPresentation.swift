//
//  TaskListPresentation.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import Foundation

struct TaskListPresentation: Equatable {
    var title: String
    var note: String
    var dueDate: Date?
    var isCompleted = false
    
    public init(title: String,
                note: String,
                dueDate: Date? = nil,
                isCompleted: Bool) {
        self.title = title
        self.note = note
        self.dueDate = dueDate
        self.isCompleted = isCompleted
    }
}
