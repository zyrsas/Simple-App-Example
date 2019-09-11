//
//  RegistrationCoordinator.swift
//  iTWorksInUA
//
//  Created by Sasha on 9/11/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import UIKit

protocol RegistrationCoordinatorDelegate: class {
    func navigateToNotesPage()
}

class RegistrationCoordinator: Coordinator {
        
    unowned let navigationController: UINavigationController
    
    private var notesCoordinator: NotesCoordinator?

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let registrationVC: RegistrationVC = RegistrationVC()
        registrationVC.coordinator = self
        self.navigationController.pushViewController(registrationVC, animated: true)
    }
}

extension RegistrationCoordinator: RegistrationCoordinatorDelegate {
    func navigateToNotesPage() {
        notesCoordinator = NotesCoordinator(navigationController: navigationController)
        notesCoordinator?.start()
    }
}
