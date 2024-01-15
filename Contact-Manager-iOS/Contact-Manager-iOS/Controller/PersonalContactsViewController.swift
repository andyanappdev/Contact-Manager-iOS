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
    
    
    // MARK: - Methods
    private func configureNavigationBar() {
        title = "연락처"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(plusButtonTapped))
    }
    
    private func configureTableView() {
        personalContactsView.personalContactsTableView.dataSource = self
        personalContactsView.personalContactsTableView.delegate = self
        personalContactsView.personalContactsTableView.register(PersonalContactCustomTableViewCell.self, forCellReuseIdentifier: "PersonalContactTableViewCell")
    }
    
    
    // MARK: - Selectors
    @objc private func plusButtonTapped() {
        let detailPersonalConactViewController = DetailPersonalContactViewController()
        let detailPersonalConactNavigationViewController = UINavigationController(rootViewController: detailPersonalConactViewController)
        
        detailPersonalConactViewController.delegate = self
        detailPersonalConactViewController.title = "새 연락처"
        detailPersonalConactViewController.toggleIsPresentedModally()
        
        present(detailPersonalConactNavigationViewController, animated: true)
    }
    
}


// MARK: - Extention
extension PersonalContactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personalContactManager.showUpAllPersonalContacts().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let reusableCell = tableView.dequeueReusableCell(withIdentifier: "PersonalContactTableViewCell", for: indexPath) as? PersonalContactCustomTableViewCell else {
            fatalError("Error: Cannot dequeue resuable cell")
        }
        
        reusableCell.personalContact = personalContactManager.showUpAllPersonalContacts()[indexPath.row]
        
        return reusableCell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let id = personalContactManager.showUpAllPersonalContacts()[indexPath.row].id
            personalContactManager.deleteSelectedPersonalContact(personalContactID: id)
            personalContactsView.personalContactsTableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension PersonalContactsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let detailPersonalConactViewController = DetailPersonalContactViewController()
//        let detailPersonalConactNavigationViewController = UINavigationController(rootViewController: detailPersonalConactViewController)
        let detailPersonalConactViewController: DetailPersonalContactViewController = DetailPersonalContactViewController()
        
        detailPersonalConactViewController.delegate = self
        detailPersonalConactViewController.title = "기존 연락처 수정"
        detailPersonalConactViewController.personalContact = personalContactManager.showUpAllPersonalContacts()[indexPath.row]
        
        navigationController?.pushViewController(detailPersonalConactViewController, animated: true)
    }
}

extension PersonalContactsViewController: PersonalContactDelegate {
    func addNewPersonalContact(newPersonalContact: PersonalContact) {
        personalContactManager.addNewPersonalContact(newPersonalContact: newPersonalContact)
        personalContactsView.personalContactsTableView.reloadData()
    }
    
    func updateSelectedPersonalContact(personalContactID id: Int, with selectedPersonalContact: PersonalContact) {
        personalContactManager.updateSelectedPersonalContact(personalContactID: id, with: selectedPersonalContact)
        personalContactsView.personalContactsTableView.reloadData()
    }
}
