//
//  PersonalContactTableViewCell.swift
//  Contact-Manager-iOS
//
//  Created by Doyoung An on 1/6/24.
//

import UIKit

final class PersonalContactCustomTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    var personalContact: PersonalContact? {
        didSet {
            guard let personalContact = personalContact else { return }
            personalContactNameLabel.text = "이   름 : \(personalContact.name)"
            personalContactAgeLabel.text = "나   이 : \(personalContact.age ?? "나이 없음")"
            personalContactContactNumberLabel.text = "연락처 : \(personalContact.contactNumber ?? "연락처 없음")"
        }
    }
    
    private let personalContactNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor.label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let personalContactAgeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let personalContactContactNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor.label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var allStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [personalContactNameLabel, personalContactAgeLabel, personalContactContactNumberLabel])
        stackView.spacing = 5
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = UIStackView.Distribution.fill
        stackView.alignment = UIStackView.Alignment.leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
//    private lazy var nameWithAgeStackView: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [personalContactNameLabel, personalContactAgeLabel])
//        stackView.spacing = 1
//        stackView.axis = .horizontal
//        stackView.distribution = .fill
//        stackView.alignment = .fill
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
//    
//    private lazy var nameWithContactNumberStackView: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [nameWithAgeStackView, personalContactContactNumberLabel])
//        stackView.spacing = 2
//        stackView.axis = .vertical
//        stackView.distribution = .fill
//        stackView.alignment = .leading
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
    
    
    // MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: "PersonalContactTableViewCell")
        
        configureStackView()
        configureCellDetail()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Methods
    private func configureStackView() {
        self.addSubview(allStackView)
//        nameWithAgeStackView.addArrangedSubview(personalContactNameLabel)
//        nameWithAgeStackView.addArrangedSubview(personalContactAgeLabel)
//        
//        nameWithContactNumberStackView.addArrangedSubview(nameWithAgeStackView)
//        nameWithContactNumberStackView.addArrangedSubview(personalContactContactNumberLabel)
    }
    
    private func configureCellDetail() {
        accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
//        selectionStyle = .gray
    }
    
    
    // MARK: - AutoLayout Setting
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            allStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            allStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
        ])
    }
}
