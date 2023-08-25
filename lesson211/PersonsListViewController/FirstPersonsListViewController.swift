//
//  FirstPersonsListViewController.swift
//  lesson211
//
//  Created by Garib Agaev on 25.08.2023.
//

import UIKit

final class FirstPersonsListViewController: PersonsListViewController {
    
    let contactInfoVC = PersonInfoViewController()
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contacts.contacts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = contacts.contacts[indexPath.row].name
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let current = contacts.contacts.remove(at: sourceIndexPath.row)
        contacts.contacts.insert(current, at: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        contactInfoVC.person = contacts.contacts[indexPath.row]
        navigationController?.pushViewController(contactInfoVC, animated: true)
    }
}
