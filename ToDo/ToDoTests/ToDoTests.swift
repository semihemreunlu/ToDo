//
//  ToDoTests.swift
//  ToDoTests
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import XCTest
@testable import ToDo

private var view: TaskListViewMock!
private var interactor: TaskListInteractor!
private var presenter: TaskListPresenter!
private var router: TaskListRouterMock!
private var service: TaskServiceMock!

class ToDoTests: XCTestCase {
        override class func setUp() {
            super.setUp()
        
            service = TaskServiceMock()
            view = TaskListViewMock()
            interactor = TaskListInteractor(service: service)
            router = TaskListRouterMock()
            presenter = TaskListPresenter(interactor: interactor,
                                          view: view,
                                          router: router)
            view.presenter = presenter
    }
    
    func testLoadTaskList(){
        // Given:
        let taskList = try? ResourceLoader.loadTaskList(from: "TaskListMock")
        service.taskList = taskList
        
        // When:
        view.viewDidLoad()
        
        // Then:
        XCTAssertEqual(view.outputs.count, 4)
        
        XCTAssertEqual(view.outputs[0], .setLoading(true))
        XCTAssertEqual(view.outputs[1], .setTasks([]))
        XCTAssertEqual(view.outputs[2], .setLoading(false))
    }
}


