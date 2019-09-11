//
//  NoteDetailCoordinator.swift
//  iTWorksInUA
//
//  Created by Sasha on 9/11/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import UIKit

class NoteDetailCoordinator: Coordinator {
        
    unowned let navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let noteDetailVC: NoteDetailVC = NoteDetailVC()
        self.navigationController.pushViewController(noteDetailVC, animated: true)
    }
    
    func start(withNote note: Note) {
        let noteDetailVC: NoteDetailVC = NoteDetailVC.newInstance(note: note)
        self.navigationController.pushViewController(noteDetailVC, animated: true)
    }
}
