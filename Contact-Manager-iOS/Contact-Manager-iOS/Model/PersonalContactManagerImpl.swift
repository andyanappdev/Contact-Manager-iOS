//
//  PersonalContactManagerImpl.swift
//  Contact-Manager-iOS
//
//  Created by Doyoung An on 1/6/24.
//

final class PersonalContactManagerImpl: PersonalContactManager {
    
    // MARK: - Properties
    private var personalContactsList: [PersonalContact]
    
    init(personalContactsList: [PersonalContact]) {
        self.personalContactsList = []
    }
    
    
    // MARK: - Methods
    func showUpAllPersonalContacts() -> [PersonalContact] {
        return personalContactsList
    }
    
    func addNewPersonalContact(newPersonalContact: PersonalContact) {
        personalContactsList.append(newPersonalContact)
    }
    
    func deleteSelectedPersonalContact(at index: Int) {
        personalContactsList.remove(at: index)
    }
    
    func updateSelectedPersonalContact(at index: Int, with selectedPersonalContact: PersonalContact) {
        personalContactsList[index] = selectedPersonalContact
    }
}
