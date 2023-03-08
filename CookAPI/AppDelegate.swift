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
        switch UIDevice.current.userInterfaceIdiom {
            case .pad:
                bootIpadApp()
            default:
                bootIphoneApp()
        }
        
        return true
    }
    
    func bootIphoneApp() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = .white
        
        let authViewController = UINavigationController(rootViewController: AuthenticationViewController())
        let editRecipeVC = UINavigationController(rootViewController: EditRecipeViewController())
        let editProfile = UINavigationController(rootViewController: EditProfileViewController())
        let aboutVC = UINavigationController(rootViewController: AboutViewController())
        authViewController.tabBarItem.title = "Authentification"
        editRecipeVC.tabBarItem.title = "Créer une recette"
        editProfile.tabBarItem.title = "Modifier profil"
        aboutVC.tabBarItem.title = "A propos"
        
        tabBarController.viewControllers = [
            authViewController,
            editRecipeVC,
            editProfile,
            aboutVC
        ]
        tabBarController.hidesBottomBarWhenPushed = true
        window.rootViewController = UINavigationController(rootViewController: tabBarController)
        window.makeKeyAndVisible()
        self.window = window
    }
    
    func bootIpadApp() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let splitViewController = UISplitViewController()
        splitViewController.viewControllers = [AuthenticationViewController()]
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = .white
        
        let editRecipeVC = UINavigationController(rootViewController: EditRecipeViewController())
        let editProfile = UINavigationController(rootViewController: EditProfileViewController())
        let aboutVC = UINavigationController(rootViewController: AboutViewController())
        
        splitViewController.tabBarItem.title = "Authentification"
        editRecipeVC.tabBarItem.title = "Créer une recette"
        editProfile.tabBarItem.title = "Modifier profil"
        aboutVC.tabBarItem.title = "A propos"
        
        tabBarController.viewControllers = [
            splitViewController,
            editRecipeVC,
            editProfile,
            aboutVC
        ]
        tabBarController.hidesBottomBarWhenPushed = true
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
    }

}

