//
//  PersonsListViewController.swift
//  lesson211
//
//  Created by Garib Agaev on 25.08.2023.
//

import UIKit

class PersonsListViewController: UITableViewController {
    let contacts: PersonsContainer
    
    init(persons: PersonsContainer) {
        self.contacts = persons
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table view data source
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    private func setupVC() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellId")
        
        title = "Persons List"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
}
