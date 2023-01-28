//
//  Database.swift
//  CookAPI
//
//  Created by Aladdine Abdou on 18/01/2023.
//

import Foundation
import FirebaseCore
import FirebaseFirestore




class Database {
    static let db: Firestore = Firestore.firestore()
    
    private init() {}
    
    class func createUser(user: UserModel) {
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = Database.db.collection("users").addDocument(data: [
            "username": user.username,
            "firstname": user.firstname,
            "lastname": user.lastname,
            "email": user.email,
            "picture": user.picture,
            "favRecipes": user.favRecipes,
            "follows": user.follows,
            "followers": user.followers,
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }

}
