//
//  AppDelegate.swift
//  CookAPI
//
//  Created by Ousmane Diallo on 24/12/2022.
//

import UIKit
import FirebaseCore


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UINavigationController(rootViewController: AuthenticationViewController())
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }


}

