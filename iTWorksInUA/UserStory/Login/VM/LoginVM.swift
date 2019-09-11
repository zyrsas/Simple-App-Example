//
//  LoginVM.swift
//  iTWorksInUA
//
//  Created by Sasha on 9/11/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import Foundation

class LoginVM: NSObject {
    
    weak var delegate: LoginVMDelegate?
    
    func bind(_ delegate: LoginVMDelegate) {
        self.delegate = delegate
    }
    
    func loginUserWithCredentials(_ email: String, _ password: String) {
        delegate?.showActivity("")
        AuthService.shared.signInUser(withEmail: email, password: password) { [weak self] (result, error) in
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

protocol LoginVMDelegate: BaseDelegate {
    func openNotes()
}
