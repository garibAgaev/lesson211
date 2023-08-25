//
//  Person.swift
//  lesson211
//
//  Created by Garib Agaev on 25.08.2023.
//

import Foundation


func getRandomNumberOf(lenght: Int) -> String {
    let number = String(format: "%.\(lenght)f", Float.random(in: 0..<1))
    return String(number[number.index(number.startIndex, offsetBy: 2)...])
}

struct Person {
    let firstName: String
    let secondName: String
    let email: String
    let phoneNumber: String
    
    var name: String {
        "\(firstName) \(secondName)"
    }
    
    private static let firstNames = ["Егор", "Евгений", "Адам", "Сергей", "Максим", "Алексей"]
    private static let secondNames = ["Иванов", "Потапов", "Попов", "Морозов"]
    
    static var contacts: [Person] {
        let array = Array(repeating: true, count: Int.random(in: 10...100))
        return array.map { _ in
            Person(
                firstName: firstNames[Int.random(in: 0..<firstNames.count)],
                secondName: secondNames[Int.random(in: 0..<secondNames.count)]
            )
        }
    }
    
    init(firstName: String, secondName: String) {
        self.firstName = firstName
        self.secondName = secondName
        email = "\(firstName)_\(secondName)@mail.ru"
        phoneNumber = "8 (999) \(getRandomNumberOf(lenght: 3))-\(getRandomNumberOf(lenght: 2))-\(getRandomNumberOf(lenght: 2))"
    }
}

final class PersonsContainer {
    var contacts = Person.contacts
}
