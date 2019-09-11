//
//  LoginView.swift
//  iTWorksInUA
//
//  Created by Sasha on 9/11/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import UIKit

protocol LoginViewDelegate: class {
    func openRegistration()
    func loginButtonDidPress(withEmail email: String, _ password: String)
}

class LoginView: BaseView {
    
    // MARK: - Delegate
    
    weak var delegate: LoginViewDelegate?
    
    // MARK: - UI Elements
    
    lazy var someLogo: UILabel = {
        let someLogo = UILabel()
        someLogo.textColor = .red
        someLogo.textAlignment = .center
        someLogo.font = UIFont.boldSystemFont(ofSize: 22)
        someLogo.text = "Some logo =)"
        return someLogo
    }()
    
    lazy var loginStackView: UIStackView = {
        let loginStackView = UIStackView()
        loginStackView.spacing = 10
        loginStackView.axis = .vertical
        return loginStackView
    }()
    
    lazy var loginField: BaseTextField = {
        let loginField = BaseTextField()
        loginField.placeholder = "Email"
        loginField.keyboardType = .emailAddress
        loginField.autocapitalizationType = .none
        return loginField
    }()
    
    lazy var passwordField: BaseTextField = {
        let passwordField = BaseTextField()
        passwordField.placeholder = "Password"
        passwordField.isSecureTextEntry = true
        return passwordField
    }()
    
    lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitleColor(.black, for: .normal)
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        loginButton.layer.cornerRadius = 15
        loginButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(loginButtonPressed)))
        return loginButton
    }()
    
    lazy var registrationStackView: UIStackView = {
        let registrationStackView = UIStackView()
        registrationStackView.spacing = 5
        registrationStackView.axis = .vertical
        return registrationStackView
    }()

    lazy var infoLabel: UILabel = {
        let infoLabel = UILabel()
        infoLabel.textColor = .white
        infoLabel.textAlignment = .center
        infoLabel.font = UIFont.systemFont(ofSize: 17)
        infoLabel.text = "Don't have an account?"
        return infoLabel
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
        addSubview(someLogo)
        addSubview(loginStackView)
        loginStackView.addArrangedSubview(loginField)
        loginStackView.addArrangedSubview(passwordField)
        loginStackView.addArrangedSubview(loginButton)
        
        loginStackView.addArrangedSubview(registrationStackView)
        registrationStackView.addArrangedSubview(infoLabel)
        registrationStackView.addArrangedSubview(registrationButton)

        someLogo.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(loginStackView.snp.top).offset(-30)
        }
        
        loginField.snp.makeConstraints { (make) in
            make.height.equalTo(35)
        }
        
        passwordField.snp.makeConstraints { (make) in
            make.height.equalTo(35)
        }
        
        loginStackView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
    }
    
    // MARK: - Actions
    
    @objc
    func loginButtonPressed() {
        guard let delegate = delegate else { return }
        delegate.loginButtonDidPress(withEmail: loginField.text ?? "", passwordField.text ?? "")
    }
    
    @objc
    func registrationButtonPressed() {
        guard let delegate = delegate else { return }
        delegate.openRegistration()
    }
}
