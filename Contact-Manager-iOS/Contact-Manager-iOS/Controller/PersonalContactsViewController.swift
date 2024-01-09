//
//  ViewController.swift
//  Contact-Manager-iOS
//
//  Created by Doyoung An on 1/3/24.
//

import UIKit

final class PersonalContactsViewController: UIViewController {
    
    // MARK: - Properties
    private let personalContactManager: PersonalContactManager = PersonalContactManager(personalContactsList: [])
    private let personalContactsView: PersonalContactsView = PersonalContactsView()
    
    
    // MARK: - Life Cycle
    override func loadView() {
    view = personalContactsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personalContactManager.makePersonalContactsListData()
        configureTableView()
    }
    
    
    // MARK: - Helpers Funtions
    private func configureTableView() {
        personalContactsView.personalContactsTableView.dataSource = self
        personalContactsView.personalContactsTableView.register(PersonalContactTableViewCell.self, forCellReuseIdentifier: "PersonalContactTableViewCell")
    }
}


// MARK: - Extention
extension PersonalContactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personalContactManager.showUpAllPersonalContacts().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let reusableCell = tableView.dequeueReusableCell(withIdentifier: "PersonalContactTableViewCell", for: indexPath) as? PersonalContactTableViewCell else {
            fatalError("Error: Cannot dequeue resuable cell")
        }
        
        reusableCell.personalContact = personalContactManager.showUpAllPersonalContacts()[indexPath.row]
        
        return reusableCell
    }
}
