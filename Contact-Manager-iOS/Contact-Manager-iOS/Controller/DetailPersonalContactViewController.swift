//
//  DetailPersonalContactViewController.swift
//  Contact-Manager-iOS
//
//  Created by Doyoung An on 1/10/24.
//

import UIKit

final class DetailPersonalContactViewController: UIViewController {
    
    // MARK: - Properties
    private let personalContactDetailView: PersonalContactDetailView = PersonalContactDetailView()
    
    private var isPresentedModally: Bool = false
    
    var personalContact: PersonalContact?
    
    weak var delegate: PersonalContactDelegate?
    
    
    
    // MARK: - Life Cycle
    override func loadView() {
        view = personalContactDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePersonalContactData()
        configureNavigationBar()
    }
    
    
    // MARK: - Methods
    private func configurePersonalContactData() {
        personalContactDetailView.personalContact = personalContact
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
    }
    
    private func presentCancelAlert() {
        let alert = UIAlertController(title: "정말로 취소하시겠습니까?", message: nil, preferredStyle: .alert)
        let noAction = UIAlertAction(title: "아니오", style: .default)
        let okAction = UIAlertAction(title: "예", style: .destructive) { [weak self] _ in
            self?.moveToPersonalContactsViewScreen()
        }
        alert.addAction(noAction)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func moveToPersonalContactsViewScreen() {
        if isPresentedModally {
            self.dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    private func presentSaveFailureAlert(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func toggleIsPresentedModally() {
            isPresentedModally = !isPresentedModally
    }
    
    
    // MARK: - Selectors
    @objc private func saveButtonTapped() {
        if personalContact == nil {
            let name = personalContactDetailView.accessNameTextField.text ?? ""
            let age = personalContactDetailView.accessAgeTextField.text ?? ""
            let contactNumber = personalContactDetailView.accessContactNumberTextField.text ?? ""
            
            let newPersonalContact = PersonalContact(name: name, age: age, contactNumber: contactNumber)
            
            delegate?.addNewPersonalContact(newPersonalContact: newPersonalContact)
        } else {
//            let personalContactID = personalContact?.id
//            personalContact?.name = personalContactDetailView.nameTextField.text
//            personalContact?.age = personalContactDetailView.ageTextField.text
//            personalContact?.contactNumber = personalContactDetailView.contactNumberTextField.text
//            
//            personalContactDetailView.personalContact = personalContact
//            
//            
//            delegate?.updateSelectedPersonalContact(personalContactID: personalContactID, with: <#T##PersonalContact#>)
            
        }
    }
    
    @objc private func cancelButtonTapped() {
        presentCancelAlert()
    }
}
