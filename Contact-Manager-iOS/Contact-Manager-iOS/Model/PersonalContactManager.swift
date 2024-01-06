//
//  PersonalContactManager.swift
//  Contact-Manager-iOS
//
//  Created by Doyoung An on 1/6/24.
//

protocol PersonalContactManager {
    func showUpAllPersonalContacts() -> [PersonalContact]
    func addNewPersonalContact(newPersonalContact: PersonalContact)
    func deleteSelectedPersonalContact(at index: Int)
    func updateSelectedPersonalContact(at index: Int, with selectedPersonalContact: PersonalContact)
}
