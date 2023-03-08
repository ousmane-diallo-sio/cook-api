//
//  RegistrationViewController.swift
//  CookAPI
//
//  Created by Aladdine Abdou on 14/01/2023.
//

import UIKit
import FirebaseAuth

class RegistrationViewController: UIViewController {
    
    var handle: AuthStateDidChangeListenerHandle?

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmationTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Inscription"
        self.passwordTextField.isSecureTextEntry = true
        self.passwordConfirmationTextField.isSecureTextEntry = true
    }
    
    @IBAction func handleRegistration(_ sender: Any) {
        if (usernameTextField.text?.isEmpty ?? true ||
            lastNameTextField.text?.isEmpty ?? true ||
            firstNameTextField.text?.isEmpty ?? true ||
            emailTextField.text?.isEmpty ?? true ||
            phoneTextField.text?.isEmpty ?? true ||
            passwordTextField.text?.isEmpty ?? true
        ) {
            print("")
            return
        }

        
        if passwordTextField.text != nil && passwordConfirmationTextField.text != nil {
            if passwordTextField.text!.count > 7 && passwordTextField.text!.elementsEqual(passwordConfirmationTextField.text!) {
                Authentication.register(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
                let userModel = UserModel(username: usernameTextField.text!, firstname: firstNameTextField.text!, lastname: lastNameTextField.text!, email: emailTextField.text!, phone: phoneTextField.text!)
                Database.createUser(user: userModel)
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { auth, user in
            if user != nil {
                self.navigationController?.setViewControllers([EditProfileViewController()], animated: true)
                self.showToast(message: "Bienvenue !")
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }

}
