//
//  BaseDelegate.swift
//  iTWorksInUA
//
//  Created by Sasha on 9/11/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import Foundation

protocol BaseDelegate: class {
    func showActivity(_ message: String)
    func hideActivity()
    func showAlertView(title: String, message: String)
}
