//
//  SecondPersonsListViewController.swift
//  lesson211
//
//  Created by Garib Agaev on 25.08.2023.
//

import UIKit

final class SecondPersonsListViewController: PersonsListViewController {

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return contacts.contacts.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        var content = cell.defaultContentConfiguration()
        if indexPath.row == 0 {
            content.text = contacts.contacts[indexPath.section].phoneNumber
        } else if indexPath.row == 1 {
            content.text = contacts.contacts[indexPath.section].email
        }
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        contacts.contacts[section].name
    }
}
