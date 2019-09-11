//
//  LoginCoordinator.swift
//  iTWorksInUA
//
//  Created by Sasha on 9/11/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import UIKit

protocol LoginCoordinatorDelegate: class {
    func navigateToRegistrationPage()
    func navigateToNotesPage()
}

class LoginCoordinator: Coordinator {
        
    unowned let navigationController: UINavigationController
    
    private var coordinator: Coordinator?

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let loginVC: LoginVC = LoginVC()
        loginVC.coordinator = self
        self.navigationController.viewControllers = [loginVC]
    }
}

extension LoginCoordinator: LoginCoordinatorDelegate {
    func navigateToRegistrationPage() {
        coordinator = RegistrationCoordinator(navigationController: navigationController)
        coordinator?.start()
    }
    
    func navigateToNotesPage() {
        coordinator = NotesCoordinator(navigationController: navigationController)
        coordinator?.start()
    }
}
