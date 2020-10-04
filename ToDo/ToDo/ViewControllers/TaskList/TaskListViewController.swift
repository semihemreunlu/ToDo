//
//  TaskListViewController.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import UIKit

class TaskListViewController: BaseViewController<TaskListPresenter> {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setTableView()
        setNavigationBar()
        presenter?.load()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        presenter?.taskListWillDissapear()
    }
    
    var tasks: [TaskListPresentation] = []
    
    func setTableView() {
        tableView.register(TaskListTableViewCell.self)
        tableView.tableFooterView = UIView()
    }
    
    func setNavigationBar() {
        let barButton = UIButton(type: .custom)
        barButton.addTarget(self, action: #selector(addTask), for: .touchUpInside)
        barButton.setImage(UIImage(named: "add"), for: UIControl.State())
        
        let barButtonItem = UIBarButtonItem(customView: barButton)
        self.navigationItem.leftBarButtonItem = barButtonItem
        
        let backButton = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        self.title = "ToDo"
    }
    
    @objc func addTask() {
        presenter?.addTask()
    }
}

extension TaskListViewController: TaskListViewProtocol {
    func handleOutput(_ output: TaskListPresenterOutput) {
        switch output {
        case .setLoading(let isLoading):
            isLoading ? self.showHud() : self.hideHud(0.5)
        case .setTasks(let tasks):
            self.tasks = tasks
            self.tableView.reloadData()
        case .setEmptyAlert(let isEmpty):
            self.tableView.isHidden = isEmpty
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
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: TaskListTableViewCell.self)
        let task = tasks[safe: indexPath.row]
        cell.titleLabel.text = task?.title ?? ""
        cell.noteLabel.text = task?.note ?? ""
        cell.dateLabel.text = task?.dueDate?.description ?? ""
        return cell
    }
}
