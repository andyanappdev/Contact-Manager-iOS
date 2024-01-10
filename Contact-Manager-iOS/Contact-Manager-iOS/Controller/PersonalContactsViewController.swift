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
        configureNavigationBar()
        configureTableView()
    }
    
    
    // MARK: - Helpers Funtions
    private func configureNavigationBar() {
        title = "연 락 처"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(plusButtonTapped))
    }
    
    private func configureTableView() {
        personalContactsView.personalContactsTableView.dataSource = self
        personalContactsView.personalContactsTableView.register(PersonalContactTableViewCell.self, forCellReuseIdentifier: "PersonalContactTableViewCell")
    }
    
    // MARK: - Selectors
    @objc func plusButtonTapped() {
        let detailPersonalConactViewController: UIViewController = DetailPersonalContactViewController()
        let detailPersonalConactNavigationViewController = UINavigationController(rootViewController: DetailPersonalContactViewController())
        present(detailPersonalConactViewController, animated: true)
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
