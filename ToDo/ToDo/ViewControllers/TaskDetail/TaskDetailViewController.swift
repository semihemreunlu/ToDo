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
        
        saveButton.layer.cornerRadius = 8
    }
    
    @IBAction func notificationChoiceSwitchStateChanged(_ sender: UISwitch) {
        datePicker.isHidden = !sender.isOn
        pickerDescriptionLabel.isHidden = !sender.isOn
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
    }
}

extension TaskDetailViewController: TaskDetailViewProtocol {
    func handleOutput(_ output: TaskDetailPresenterOutput) {
        
    }
}
