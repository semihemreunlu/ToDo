//
//  TaskListPresentation.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import Foundation

struct TaskListPresentation: Equatable {
    let note: String
    
    public init(note: String) {
        self.note = note
    }
}
