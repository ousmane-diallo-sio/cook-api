//
//  SuccessAuthViewController.swift
//  CookAPI
//
//  Created by Aladdine Abdou on 14/01/2023.
//

import UIKit

class SuccessAuthViewController: UIViewController {
    
    @IBOutlet weak var mailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mailLabel.text = Authentication.getCurrentUser()!.email
    }
    
    @IBAction func handleLogout(_ sender: Any) {
        Authentication.signOut()
        if Authentication.getCurrentUser() == nil {
            self.navigationController?.setViewControllers([AuthenticationViewController()], animated: true)
        }
    }
    

}
