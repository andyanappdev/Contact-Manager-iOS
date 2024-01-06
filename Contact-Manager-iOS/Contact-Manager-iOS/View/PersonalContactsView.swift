//
//  PersonalContactsView.swift
//  Contact-Manager-iOS
//
//  Created by Doyoung An on 1/6/24.
//

import UIKit

final class PersonalContactsView: UIView {
    
    // MARK: - Properties
    let personalContactsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        configuerPersonalContactsTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Helpers Functions
    
    private func configuerPersonalContactsTableView() {
        
        self.addSubview(personalContactsTableView)
        personalContactsTableView.rowHeight = 60
        
        NSLayoutConstraint.activate([
            personalContactsTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            personalContactsTableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            personalContactsTableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            personalContactsTableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
    }
}
