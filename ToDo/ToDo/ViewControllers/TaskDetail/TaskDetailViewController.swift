//
//  TaskDetailViewController.swift
//  ToDo
//
//  Created by Semih Emre Ünlü on 4.10.2020.
//

import UIKit

class TaskDetailViewController: BaseViewController<TaskDetailPresenter> {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    @IBOutlet weak var notificationChoiceSwitch: UISwitch!
    @IBOutlet weak var pickerDescriptionLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.load()
        
        setUIElements()
    }
    
    func setUIElements() {
        saveButton.layer.cornerRadius = 8
        datePicker.minimumDate = Date(timeIntervalSinceNow: TimeInterval(60))
    }
    
    @IBAction func notificationChoiceSwitchStateChanged(_ sender: UISwitch) {
        datePicker.isHidden = !sender.isOn
        pickerDescriptionLabel.isHidden = !sender.isOn
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        let dueDate = notificationChoiceSwitch.isOn ? datePicker.date : nil
        let task = TaskDetailPresentation(title: titleTextField.text ?? "",
                                          note: noteTextField.text ?? "",
                                          dueDate: dueDate)
        presenter?.save(task)
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        presenter?.deleteButtonTapped()
    }
}

extension TaskDetailViewController: TaskDetailViewProtocol {
    func handleOutput(_ output: TaskDetailPresenterOutput) {
        switch output {
        case .setLoading(let isLoading):
            isLoading ? self.showHud() : self.hideHud(0.5)
        case .show(let task):
            self.titleTextField.text = task.title
            self.noteTextField.text = task.note
            
            notificationChoiceSwitch.isOn = task.dueDate != nil
            datePicker.isHidden = task.dueDate == nil
            
            if let dueDate = task.dueDate {
                datePicker.date = dueDate
            }
        case .hideDeleteButton:
            self.deleteButton.isHidden = true
        case .showSucceed(let text):
            self.showSucceed(text)
        }
    }
}
