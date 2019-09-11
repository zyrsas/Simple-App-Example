//
//  RegistrationVM.swift
//  iTWorksInUA
//
//  Created by Sasha on 9/11/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import Foundation

class RegistrationVM: NSObject {
    
    weak var delegate: RegistrationVMDelegate?
    
    func bind(_ delegate: RegistrationVMDelegate) {
        self.delegate = delegate
    }
    
    func signUpUserWithCredentials(_ email: String, _ password: String, _ repeatPassword: String) {
        if !isPasswordsMath(password, repeatPassword) {
            self.delegate?.showAlertView(title: "", message: "Passwords don't match")
            return
        }
        delegate?.showActivity("")
        AuthService.shared.signUpUser(withEmail: email, password: password) { [weak self] (result, error) in
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
    
    // MARK: - Validations
    
    private func isPasswordsMath(_ password: String, _ repeatPassword: String) -> Bool {
        return password == repeatPassword
    }
}

protocol RegistrationVMDelegate: BaseDelegate {
    func openNotes()
}
