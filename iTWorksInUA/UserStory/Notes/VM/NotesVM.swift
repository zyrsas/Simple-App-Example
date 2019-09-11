//
//  NotesVM.swift
//  iTWorksInUA
//
//  Created by Sasha on 9/11/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import Foundation

class NotesVM: NSObject {
    
    weak var delegate: NoteVMDelegate?
    
    public var notes: [Note] = []
    
    func bind(_ delegate: NoteVMDelegate) {
        self.delegate = delegate
    }
    
    func numberOfItem() -> Int {
        return notes.count
    }
    
    func noteByIndexPath(indexPath: IndexPath) -> Note {
        return notes[indexPath.row]
    }
    
    func getAllNotes() {
        delegate?.showActivity("")
        FirestoreService.shared.addNotesListener { [weak self] (notes, error) in
            DispatchQueue.main.async {
                self?.delegate?.hideActivity()
                if let error = error {
                    self?.delegate?.showAlertView(title: "", message: error)
                } else {
                    self?.notes = notes ?? []
                    self?.delegate?.reloadData()
                }
            }
        }
    }
}

protocol NoteVMDelegate: BaseDelegate {
    func reloadData()
}
