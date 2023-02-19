//
//  EditProfileViewController.swift
//  CookAPI
//
//  Created by Aladdine Abdou on 08/02/2023.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    var user: UserModel?
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!

    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Modifier le profile"
        
        Task {
            self.user = await Database.getUser(email: (Authentication.getCurrentUser()?.email)!)
            self.usernameLabel.text = "\(user?.firstname ?? "") \(user?.lastname ?? "")"
            self.usernameTextField.text = user?.username
            self.firstnameTextField.text = user?.firstname
            self.lastnameTextField.text = user?.lastname
            self.emailTextField.text = user?.email
            self.phoneTextField.text = user?.phone
        }

        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func handleSubmission(_ sender: Any) {
        var user: UserModel?
        Task {
            user = await Database.getUser(email: (Authentication.getCurrentUser()?.email)!)
            user!.username = self.usernameTextField.text ?? ""
            user!.lastname = self.lastnameTextField.text ?? ""
            user!.firstname = self.firstnameTextField.text ?? ""
            user!.phone = self.phoneTextField.text ?? ""
            await Database.editProfile(user:user!)
            self.usernameLabel.text = "\(user?.firstname ?? "") \(user?.lastname ?? "")"
            showToast(message: "Le profil a bien été mis à jour")
        }

    }
    
    @IBAction func handleLogout(_ sender: Any) {
        Authentication.signOut()
        if Authentication.getCurrentUser() == nil {
            self.navigationController?.setViewControllers([AuthenticationViewController()], animated: true)
        }
    }
    
}

extension UIViewController {

    func showToast(message : String) {
        print(self.view.frame.size.width)
        let toastLabel = UILabel(frame: CGRect(x: 0, y: self.view.frame.size.height-50, width: self.view.frame.size.width, height: 30))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
}
