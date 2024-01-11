//
//  PersonalContactDelegate.swift
//  Contact-Manager-iOS
//
//  Created by Doyoung An on 1/11/24.
//

protocol PersonalContactDelegate: AnyObject {
    func addNewPersonalContact(newPersonalContact: PersonalContact)
    func updateSelectedPersonalContact(personalContactID id: Int, with selectedPersonalContact: PersonalContact)
}
