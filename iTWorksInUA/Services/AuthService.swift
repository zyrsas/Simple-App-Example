//
//  AuthService.swift
//  iTWorksInUA
//
//  Created by Sasha on 9/11/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import FirebaseAuth

typealias completionHandlerType = (AuthDataResult?, String?) -> Void

protocol AuthServiceProtocol: class {
    func signInUser(withEmail email: String, password: String, completionHandler: @escaping completionHandlerType)
    func signUpUser(withEmail email: String, password: String, completionHandler: @escaping completionHandlerType) 
}

class AuthService: AuthServiceProtocol {
    
    public static let shared = AuthService()
    
    private init() { }
    
    func signInUser(withEmail email: String, password: String, completionHandler: @escaping completionHandlerType) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error == nil {
                completionHandler(result, nil)
            } else {
                completionHandler(nil, error?.localizedDescription)
            }
        }
    }
    
    func signUpUser(withEmail email: String, password: String, completionHandler: @escaping completionHandlerType) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error == nil {
                completionHandler(result, nil)
            } else {
                completionHandler(nil, error?.localizedDescription)
            }
        }
    }
}
