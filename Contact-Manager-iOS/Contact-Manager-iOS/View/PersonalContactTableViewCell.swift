//
//  PersonalContactTableViewCell.swift
//  Contact-Manager-iOS
//
//  Created by Doyoung An on 1/6/24.
//

import UIKit

final class PersonalContactTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    var personalContact: PersonalContact? {
        didSet {
            guard let personalContact = personalContact else { return }
            personalContactNameLabel.text = personalContact.name
            personalContactAgeLabel.text = "(\(personalContact.age ?? "0"))"
            personalContactContactNumberLabel.text = personalContact.contactNumber
        }
    }
    
    private let personalContactNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let personalContactAgeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let personalContactContactNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameWithAgeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [personalContactNameLabel, personalContactAgeLabel])
        stackView.spacing = 1
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var nameWithContactNumberStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameWithAgeStackView, personalContactContactNumberLabel])
        stackView.spacing = 2
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    // MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: "PersonalContactTableViewCell")
        
        configureUI()
        configureCellDetail()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Methods
    private func configureUI() {
        self.addSubview(nameWithContactNumberStackView)
        
//        nameWithAgeStackView.addArrangedSubview(personalContactNameLabel)
//        nameWithAgeStackView.addArrangedSubview(personalContactAgeLabel)
//        
//        nameWithContactNumberStackView.addArrangedSubview(nameWithAgeStackView)
//        nameWithContactNumberStackView.addArrangedSubview(personalContactContactNumberLabel)
    }
    
    private func configureCellDetail() {
        accessoryType = .disclosureIndicator
//        selectionStyle = .gray
    }
    
    
    // MARK: - AutoLayout Setting
    override func updateConstraints() {
        configureConstraints()
        super.updateConstraints()
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            nameWithContactNumberStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameWithContactNumberStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25)
        ])
    }
}
