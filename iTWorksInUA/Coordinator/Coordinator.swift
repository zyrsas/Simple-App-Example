//
//  Coordinator.swift
//  iTWorksInUA
//
//  Created by Sasha on 9/11/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import UIKit

public protocol Coordinator: class {
    init(navigationController: UINavigationController)
    func start()
}
