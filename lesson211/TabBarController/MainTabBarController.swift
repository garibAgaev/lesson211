//
//  MainTabBarController.swift
//  lesson211
//
//  Created by Garib Agaev on 25.08.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {
    //MARK: - Publik property
    let persons = PersonsContainer()
    
    //MARK: - Override UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
}

//MARK: - Setting View
private extension MainTabBarController {
    func setupTabBar() {
        let firstTVC = FirstPersonsListViewController(persons: persons)
        let secondTVC = SecondPersonsListViewController(persons: persons)
        viewControllers = [
            UINavigationController(rootViewController: firstTVC),
            UINavigationController(rootViewController: secondTVC)
        ]
        viewControllers?.enumerated().forEach {
            $1.tabBarItem = UITabBarItem(title: "Contacts", image: UIImage(systemName: "person.circle"), tag: $0)
        }
    }
}
