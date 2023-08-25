//
//  PersonInfoViewController.swift
//  lesson211
//
//  Created by Garib Agaev on 25.08.2023.
//

import UIKit

final class PersonInfoViewController: UIViewController {
    
    //MARK: - Publik property
    var person: Person!
    
    //MARK: - Private property
    private let emailLabel = UILabel()
    private let phoneNumberLabel = UILabel()
    private let stackView = UIStackView()
    
    //MARK: - Override UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
        title = person.name
        setupEmailLabel()
        setupPhoneNumberLabel()
    }
}


//MARK: - Setting View
private extension PersonInfoViewController {
    func setupView() {
        view.backgroundColor = .systemRed
        addSubview()
        setFalse()
        setupStackView()
        setConstraint()
    }
}

//MARK: - Setting
private extension PersonInfoViewController {
    func addSubview() {
        view.addSubview(stackView)
    }
    
    func setFalse() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupEmailLabel() {
        emailLabel.text = "Email: \(person.email)"
    }
    
    func setupPhoneNumberLabel() {
        phoneNumberLabel.text = "Phone: \(person.phoneNumber)"
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 20
        stackView.distribution = .fill
        
        [phoneNumberLabel, emailLabel].forEach {
            stackView.addArrangedSubview($0)
        }
        
    }
}
//MARK: - Layout
private extension PersonInfoViewController {
    func setConstraint() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(
                item: stackView, attribute: .top,
                relatedBy: .equal,
                toItem: view.safeAreaLayoutGuide, attribute: .top,
                multiplier: 1, constant: 20
            ),
            NSLayoutConstraint(
                item: stackView, attribute: .leading,
                relatedBy: .equal,
                toItem: view.safeAreaLayoutGuide, attribute: .leading,
                multiplier: 1, constant: 16
            )
        ])
    }
}
