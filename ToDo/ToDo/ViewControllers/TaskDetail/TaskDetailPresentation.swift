//
//  TaskDetailPresentation.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import Foundation

struct TaskDetailPresentation: Equatable {
    var title: String
    var note: String
    var dueDate: Date?
    
    public init(title: String,
                note: String,
                dueDate: Date? = nil) {
        self.title = title
        self.note = note
        self.dueDate = dueDate
    }
}
