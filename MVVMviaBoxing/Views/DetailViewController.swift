//
//  DetailViewController.swift
//  MVVMviaBoxing
//
//  Created by Vladislav Miroshnichenko on 20.10.2021.
//

import UIKit

final class DetailViewController: UIViewController {

    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var lastNameLabel: UILabel!
    @IBOutlet weak private var birthdayLabel: UILabel!
    @IBOutlet weak private var phoneLabel: UILabel!
    
    public var viewModel: DetailViewViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.data.bind { [unowned self](contact) in
            self.fillTextFields(data: contact)
        }
    }
    
    @IBAction func editBarButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "EditViewSegue", sender: nil)
    }
    
    private func fillTextFields(data: Contact) {
        nameLabel.text = "Name: \(data.name!)"
        lastNameLabel.text = "Last Name: \(data.lastName!)"
        
        if let birthday = data.dateOfBirth {
            birthdayLabel.text = "Birthday: \(dateFormatter(date: birthday))"
        }
        
        phoneLabel.text = "Phone: \(data.phoneNumber!)"
    }
    
    private func dateFormatter(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter.string(from: date)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "EditViewSegue" {
            openEditView(segue: segue, data: viewModel.data.value)
        }
        
    }
    
    private func openEditView(segue: UIStoryboardSegue, data: Contact) {
        
        if let dvc = segue.destination as? EditViewController {
            dvc.viewModel = EditViewViewModel(data: data)
        }
        
    }


}
