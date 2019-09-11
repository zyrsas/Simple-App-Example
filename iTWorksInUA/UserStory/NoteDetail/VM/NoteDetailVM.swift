//
//  NoteDetailVM.swift
//  iTWorksInUA
//
//  Created by Sasha on 9/11/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import Foundation

enum State {
    case create, view
}

class NoteDetailVM: NSObject {
    
    weak var delegate: NoteDetailVMDelegate?
    
    var state: State = .create
    var note: Note?
    
    override init() { }
    
    init(_ note: Note) {
        self.note = note
        state = .view
    }
    
    func bind(_ delegate: NoteDetailVMDelegate) {
        self.delegate = delegate
    }
    
    func createNote(withTitle title: String, body: String) {
        delegate?.showActivity("")
        FirestoreService.shared.createNote(withTitle: title, body: body) { [weak self] (error) in
            DispatchQueue.main.async {
                self?.delegate?.hideActivity()
                if let error = error {
                    self?.delegate?.showAlertView(title: "", message: error)
                } else {
                    self?.delegate?.openNotes()
                }
            }
        }
        
    }
}

protocol NoteDetailVMDelegate: BaseDelegate {
    func openNotes()
}
