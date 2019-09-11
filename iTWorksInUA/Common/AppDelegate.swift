//
//  AppDelegate.swift
//  iTWorksInUA
//
//  Created by Sasha on 9/11/19.
//  Copyright © 2019 Sasha. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: Coordinator?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController()

        if Auth.auth().currentUser != nil {
            coordinator = NotesCoordinator(navigationController: window?.rootViewController as! UINavigationController)
        } else {
            coordinator = LoginCoordinator(navigationController: window?.rootViewController as! UINavigationController)
        }
        coordinator?.start()
        
        window?.makeKeyAndVisible()
        return true
    }
}
