//
//  TaskListRouterMock.swift
//  ToDoTests
//
//  Created by Semih Emre Ünlü on 5.10.2020.
//

import Foundation
import XCTest

@testable import ToDo
class TaskListRouterMock: TaskListRouterProtocol {
    
    var routes: [TaskListRoute] = []
    
    func navigate(to route: TaskListRoute) {
        routes.append(route)
    }
}

