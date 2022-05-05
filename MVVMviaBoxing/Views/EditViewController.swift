//
//  EditViewController.swift
//  MVVMviaBoxing
//
//  Created by Vladislav Miroshnichenko on 20.10.2021.
//

import UIKit

final class EditViewController: UIViewController {

    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var lastNameTextField: UITextField!
    @IBOutlet private weak var birthdayTextField: UITextField!
    @IBOutlet private weak var phoneTextField: UITextField!
    
    public var viewModel: EditViewViewModelProtocol!
    private let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureDatePicker()
        
        viewModel.binding.bind { [unowned self] (contact) in
            self.fillTextFields(data: contact)
        }
    }
    
    @IBAction private func saveButton(_ sender: UIButton) {
        guard let name = nameTextField.text,
              let lastName = lastNameTextField.text,
              let birthday = dateFormatter(date: birthdayTextField.text!),
              let phone = phoneTextField.text
        else {
            showAlert(title: "Warning", message: "Not all fields are filled")
            return
        }
        
        if viewModel.saveData(name: name, lastName: lastName, birthday: birthday, phone: phone) {
            navigationController?.popViewController(animated: true)
        } else {
            showAlert(title: "Error", message: "Data has not been saved")
        }
    }
    
    private func fillTextFields(data: Contact) {
        nameTextField.text = data.name
        lastNameTextField.text = data.lastName
        birthdayTextField.text = dateFormatter(date: data.dateOfBirth!)
        phoneTextField.text = data.phoneNumber
    }
    
    private func dateFormatter(date: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.date(from: date) ?? nil
    }
    
    private func dateFormatter(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: date)
    }
    
    private func configureDatePicker() {
        datePicker.datePickerMode = .date
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        toolBar.setItems([doneButton], animated: true)
        birthdayTextField.inputView = datePicker
        birthdayTextField.inputAccessoryView = toolBar
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func doneAction() {
        birthdayTextField.text = dateFormatter(date: datePicker.date)
        self.view.endEditing(true)
    }

}
