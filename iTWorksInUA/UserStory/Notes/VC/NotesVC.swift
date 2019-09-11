//
//  NotesVC.swift
//  iTWorksInUA
//
//  Created by Sasha on 9/11/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import UIKit

final class NotesVC: BaseVC {
    
    // MARK: - UI elements
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        return tableView
    }()
    
    // MARK: - Variables
    
    public weak var coordinator: NoteCoordinatorDelegate?
    private var viewModel = NotesVM()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        disableTap()
        viewModel.bind(self)
        viewModel.getAllNotes()
    }
    
    // MARK: - Configuration
    
    override func setupUI() {
        title = "Notes"
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItems = [add]
    }
    
    override func setupConstraint() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - Actions
    
    @objc
    func addTapped() {
        coordinator?.didTapOnCreateNote()
    }
}

extension NotesVC: NoteVMDelegate {
    func reloadData() {
        tableView.reloadData()
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

extension NotesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItem()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = viewModel.noteByIndexPath(indexPath: indexPath).title
        cell.detailTextLabel?.text = viewModel.noteByIndexPath(indexPath: indexPath).body
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.didTapOnNote(viewModel.noteByIndexPath(indexPath: indexPath))
    }
}
