//
//  BaseViewController.swift
//  iTWorksInUA
//
//  Created by Sasha on 9/11/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import UIKit
import MBProgressHUD

class BaseVC: UIViewController {

    var tap: UITapGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraint()
        configuration()
        configureKeyboard()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        dismissKeyboard()
    }
    
    // MARK: - Configuration
    
    private func configuration() {
        view.backgroundColor = .lightGray
    }
    
    private func configureKeyboard() {
        tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap!)
    }
    
    public func disableTap() {
        guard let tap = tap else { return }
        tap.isEnabled = false
    }
    
    @objc
    private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    public func setupUI() {
       
    }
    
    public func setupConstraint() {
        
    }
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public func showHudView(_ message: String) {
        let loadingNotification = MBProgressHUD.showAdded(to: self.view, animated: true)
        loadingNotification.mode = MBProgressHUDMode.indeterminate
        loadingNotification.label.text = message
        loadingNotification.minSize = CGSize(width: 220, height: 140);
        loadingNotification.bezelView.layer.cornerRadius = 10
    }
    
    public func hideHudView() {
        MBProgressHUD.hide(for: view, animated: true)
    }
    
    public func showAlert(title: String?, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
