//
//  LoginVC.swift
//  iTWorksInUA
//
//  Created by Sasha on 9/11/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import UIKit

final class LoginVC: BaseVC {
    
    // MARK: - Variables
    
    public weak var coordinator: LoginCoordinatorDelegate?
    private var loginView = LoginView()
    private let viewModel = LoginVM()

    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.delegate = self
        viewModel.bind(self)
    }

    // MARK: - Setup
    
    override func setupUI() {
        title = "Login"
    }
    
    override func setupConstraint() {
        view.addSubview(loginView)
        
        loginView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension LoginVC: LoginViewDelegate {
    func loginButtonDidPress(withEmail email: String, _ password: String) {
        viewModel.loginUserWithCredentials(email, password)
    }
    
    func openRegistration() {
        coordinator?.navigateToRegistrationPage()
    }
}

extension LoginVC: LoginVMDelegate {
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
