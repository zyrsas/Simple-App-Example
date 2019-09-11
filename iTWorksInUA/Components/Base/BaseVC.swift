//
//  BaseViewController.swift
//  iTWorksInUA
//
//  Created by Sasha on 9/11/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import UIKit

class BaseVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Configuration
    
    private func configuration() {
        navigationController?.setToolbarHidden(true, animated: false)
    }
}
