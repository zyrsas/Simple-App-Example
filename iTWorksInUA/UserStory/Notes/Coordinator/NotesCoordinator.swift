//
//  NotesCoordinator.swift
//  iTWorksInUA
//
//  Created by Sasha on 9/11/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import UIKit

protocol NoteCoordinatorDelegate: class {
    func didTapOnNote(_ note: Note)
    func didTapOnCreateNote()
}

class NotesCoordinator: Coordinator {
        
    unowned let navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let notesVC: NotesVC = NotesVC()
        notesVC.coordinator = self
        self.navigationController.setViewControllers([notesVC], animated: true)
    }
}

extension NotesCoordinator: NoteCoordinatorDelegate {
    func didTapOnNote(_ note: Note) {
        let noteDetailCoordinator = NoteDetailCoordinator(navigationController: navigationController)
        noteDetailCoordinator.start(withNote: note)
    }
    
    func didTapOnCreateNote() {
        let noteDetailCoordinator = NoteDetailCoordinator(navigationController: navigationController)
        noteDetailCoordinator.start()
    }
}
