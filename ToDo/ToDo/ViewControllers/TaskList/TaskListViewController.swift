//
//  TaskListViewController.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import UIKit

class TaskListViewController: BaseViewController<TaskListPresenter> {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.load()
    }
    
    var tasks: [TaskListPresentation] = []
}

extension TaskListViewController: TaskListViewProtocol {
    func handleOutput(_ output: TaskListPresenterOutput) {
        switch output {
        case .setLoading(let isLoading):
            isLoading ? self.showHud() : self.hideHud(0.5)
        case .setTasks(let tasks):
            self.tasks = tasks
            self.tableView.reloadData()
        }
    }
}

extension TaskListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.completeTask(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        presenter?.selectTask(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        guard let row = indexPath?.row else {
            return
        }
        presenter?.deleteTask(at: row)
    }
}

extension TaskListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
