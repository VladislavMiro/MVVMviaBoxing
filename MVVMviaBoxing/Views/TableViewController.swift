//
//  TableViewController.swift
//  MVVMviaBoxing
//
//  Created by Vladislav Miroshnichenko on 18.10.2021.
//

import UIKit

final class TableViewController: UITableViewController {

    public var viewModel: TableViewViewModelProtocol! {
        didSet {
            viewModel.binding.bind { [unowned self] _ in
                if !tableView.isEditing {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    private var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = TableViewViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.preloadDataFromStorage()
    }

    @IBAction private func addButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "addContactViewSegue", sender: nil)
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.binding.value.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "DetailViewSegue", sender: nil)
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        
        guard let tableViewCell = cell else { return UITableViewCell() }
        
        let contact = viewModel.binding.value[indexPath.row]
        
        tableViewCell.viewModel = TableViewCellViewModel(name: contact.name ?? "", lastName: contact.lastName ?? "")

        return tableViewCell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // Delete the row from the data source
            if viewModel.deleteData(atIndex: indexPath.row) {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }

    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "addContactViewSegue":
            openAddContactView(segue: segue)
        case "DetailViewSegue":
            openDetailView(segue: segue, contact: viewModel.binding.value[selectedIndex])
        default:
            return
        }

    }
    
    private func openAddContactView(segue: UIStoryboardSegue) {
        
        if let dvc = segue.destination as? AddContactViewController {
            dvc.viewModel = AddContactViewModel()
        }
        
    }
    
    private func openDetailView(segue: UIStoryboardSegue, contact: Contact) {
        
        if let dvc = segue.destination as? DetailViewController {            
            dvc.viewModel = DetailViewViewModel(contact: contact)
        }
        
    }

}
