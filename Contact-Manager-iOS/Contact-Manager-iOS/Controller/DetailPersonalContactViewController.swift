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
    
    var personalContact: PersonalContact?
    
    
    // MARK: - Life Cycle
    override func loadView() {
        view = personalContactDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBar()
    }
    
    
    // MARK: - Methods
    private func configureNavigationBar() {
        title = "새 연락처"
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
    }
   
    
    // MARK: - Selectors
    @objc func saveButtonTapped() {
        
    }
    
    @objc func cancelButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
