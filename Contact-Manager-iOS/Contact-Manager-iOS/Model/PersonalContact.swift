//
//  PersonalContact.swift
//  Contact-Manager-iOS
//
//  Created by Doyoung An on 1/6/24.
//

struct PersonalContact {
    static var personalContactsCounting: Int = 0
    let id: Int
    var name: String?
    var age: String?
    var contactNumber: String?
    
    init(name: String? = nil, age: String? = nil, contactNumber: String? = nil) {
        self.id = PersonalContact.personalContactsCounting == 0 ? 0 : PersonalContact.personalContactsCounting
        self.name = name
        self.age = age
        self.contactNumber = contactNumber
        PersonalContact.personalContactsCounting += 1
    }
}
