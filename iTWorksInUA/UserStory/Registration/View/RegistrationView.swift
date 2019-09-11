//
//  RegistrationView.swift
//  iTWorksInUA
//
//  Created by Sasha on 9/11/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import UIKit

protocol RegistrationViewDelegate: class {
    func registrationButtonDidPress(withEmail email: String, _ password: String, _ repeatPassword: String)
}

class RegistrationView: BaseView {

    // MARK: - Delegate
    
    weak var delegate: RegistrationViewDelegate?
    
    // MARK: - UI Elements
    
    lazy var registrationStackView: UIStackView = {
        let registrationStackView = UIStackView()
        registrationStackView.spacing = 10
        registrationStackView.axis = .vertical
        return registrationStackView
    }()
    
    lazy var emailField: BaseTextField = {
        let emailField = BaseTextField()
        emailField.placeholder = "Email"
        emailField.keyboardType = .emailAddress
        emailField.autocapitalizationType = .none
        return emailField
    }()
    
    lazy var passwordField: BaseTextField = {
        let passwordField = BaseTextField()
        passwordField.placeholder = "Password"
        passwordField.isSecureTextEntry = true
        return passwordField
    }()
    
    lazy var repeatPasswordField: BaseTextField = {
        let passwordField = BaseTextField()
        passwordField.placeholder = "Repeat password"
        passwordField.isSecureTextEntry = true
        return passwordField
    }()
    
    lazy var registrationButton: UIButton = {
        let registrationButton = UIButton()
        registrationButton.setTitleColor(.black, for: .normal)
        registrationButton.setTitle("Registration", for: .normal)
        registrationButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        registrationButton.layer.cornerRadius = 15
        registrationButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(registrationButtonPressed)))
        return registrationButton
    }()
    
    
    // MARK: - Add subviews
    
    override func addSubViews() {
        addSubview(registrationStackView)
        registrationStackView.addArrangedSubview(emailField)
        registrationStackView.addArrangedSubview(passwordField)
        registrationStackView.addArrangedSubview(repeatPasswordField)
        registrationStackView.addArrangedSubview(registrationButton)
        
        emailField.snp.makeConstraints { (make) in
            make.height.equalTo(35)
        }
        
        passwordField.snp.makeConstraints { (make) in
            make.height.equalTo(35)
        }
        
        repeatPasswordField.snp.makeConstraints { (make) in
            make.height.equalTo(35)
        }
        
        registrationStackView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
    }
    
    // MARK: - Actions
    
    @objc
    func registrationButtonPressed() {
        guard let delegate = delegate else { return }
        delegate.registrationButtonDidPress(withEmail: emailField.text ?? "",
                                            passwordField.text ?? "",
                                            repeatPasswordField.text ?? "")
    }
}
