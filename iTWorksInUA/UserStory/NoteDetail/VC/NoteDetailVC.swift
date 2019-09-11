//
//  NoteDetailVC.swift
//  iTWorksInUA
//
//  Created by Sasha on 9/11/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import UIKit

final class NoteDetailVC: BaseVC {

    // MARK: - Variables
    
    private var detailView = NoteDetailView()
    private var viewModel = NoteDetailVM()
    
    static func newInstance(note: Note) -> NoteDetailVC {
        let vc = NoteDetailVC()
        vc.viewModel = NoteDetailVM(note)
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bind(self)
    }
    
    // MARK: - Setup
    
    override func setupUI() {
        configureWithNote()
    }
    
    override func setupConstraint() {
        view.addSubview(detailView)
        
        detailView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: Configuration
    
    private func configureWithNote() {
        switch viewModel.state {
        case .create:
            let add = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTapped))
            navigationItem.rightBarButtonItems = [add]
        case .view:
            title = viewModel.note?.title ?? ""
            fillNote()
        }
    }
    
    private func fillNote() {
        detailView.fillNote(viewModel.note)
    }
    
    // MARK: - Acions
    
    @objc func saveTapped() {
        viewModel.createNote(withTitle: detailView.titleField.text ?? "",
                             body: detailView.bodyTextView.text)
    }
}

extension NoteDetailVC: NoteDetailVMDelegate {
    func openNotes() {
        showAlertView(title: "Saved!", message: "")
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
