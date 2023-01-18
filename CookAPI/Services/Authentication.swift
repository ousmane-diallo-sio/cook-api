//
//  AuthenticationViewController.swift
//  CookAPI
//
//  Created by Aladdine Abdou on 14/01/2023.
//

import Foundation
import FirebaseAuth

class Authentication {
    static let auth: Auth = Auth.auth()
    
    class func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    class func signOut() {
        try? auth.signOut()
    }
    
    class func getCurrentUser() -> User? {
        return auth.currentUser
    }
    
    class func register(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}
