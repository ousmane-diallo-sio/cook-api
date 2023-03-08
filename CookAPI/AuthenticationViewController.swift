//
//  AuthenticationViewController.swift
//  CookAPI
//
//  Created by Aladdine Abdou on 13/01/2023.
//

import UIKit
import FirebaseAuth

class AuthenticationViewController: UIViewController {
    
    var handle: AuthStateDidChangeListenerHandle?

    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registrationButton: UIButton!

    @IBOutlet weak var mailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Connexion"
        self.mailErrorLabel.text = nil
        self.passwordErrorLabel.text = nil
        self.passwordTextField.isSecureTextEntry = true
    }
    
    @IBAction func handleLogin(_ sender: UIButton) {
        Task {
            await Authentication.signIn(email: self.mailTextField.text ?? "", password: self.passwordTextField.text ?? "")
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.showToast(message: "Identifiants incorrects")
        }  
    }
    
    @IBAction func handleRegistration(_ sender: UIButton) {
        if self.navigationController != nil {
            self.navigationController?.pushViewController(RegistrationViewController(), animated: true)
        } else if self.splitViewController != nil {
            self.splitViewController?.viewControllers.insert(RegistrationViewController(), at: 1)
        }
    }
    
     override func viewWillAppear(_ animated: Bool) {
         handle = Auth.auth().addStateDidChangeListener { auth, user in
             if user != nil {
                 if self.navigationController != nil {
                     self.tabBarController?.hidesBottomBarWhenPushed = false
                     self.navigationController?.setViewControllers([FeedViewController()], animated: true)
                 } else if self.splitViewController != nil {
                     self.tabBarController?.hidesBottomBarWhenPushed = false
                     self.splitViewController?.viewControllers.insert(FeedViewController(), at: 0)
                     self.splitViewController?.viewControllers.remove(at: 1)
                 }
                 self.tabBarController?.removeFromParent()
             }
         }
     }
     
     override func viewWillDisappear(_ animated: Bool) {
         Auth.auth().removeStateDidChangeListener(handle!)
     }
}
