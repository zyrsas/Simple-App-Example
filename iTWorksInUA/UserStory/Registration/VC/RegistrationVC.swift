//
//  RegistrationVC.swift
//  iTWorksInUA
//
//  Created by Sasha on 9/11/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import UIKit

final class RegistrationVC: BaseVC {

    // MARK: - Variables
    
    private var registrationView = RegistrationView()
    private let viewModel = RegistrationVM()
    public weak var coordinator: RegistrationCoordinatorDelegate?

    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bind(self)
        registrationView.delegate = self
    }
    
    // MARK: - Setup
    
    override func setupUI() {
        title = "Registration"
    }
    
    override func setupConstraint() {
        view.addSubview(registrationView)
        
        registrationView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension RegistrationVC: RegistrationVMDelegate {
    func openNotes() {
        coordinator?.navigateToNotesPage()
    }
    
    func showActivity(_ message: String) {
        showHudView(message)
    }
    
    func hideActivity() {
        hideHudView()
    }
    
    func showAlertView(title: String, message: String) {
        showAlert(title: title, message: message)
    }
}

extension RegistrationVC: RegistrationViewDelegate {
    func registrationButtonDidPress(withEmail email: String, _ password: String, _ repeatPassword: String) {
        viewModel.signUpUserWithCredentials(email, password, repeatPassword)
    }
}
