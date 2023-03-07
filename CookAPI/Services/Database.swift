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
            "phone": user.phone,
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
    
    class func getUser(email: String) async -> UserModel? {
        var user: UserModel?
        let usersRef =  db.collection("users")
        let document = try! await usersRef.whereField("email", isEqualTo: email).getDocuments().documents[0]
        let data = document.data()
        let username = data["username"] as? String ?? ""
        let lastname = data["lastname"] as? String ?? ""
        let firstname = data["firstname"] as? String ?? ""
        let email = data["email"] as? String ?? ""
        let phone = data["phone"] as? String ?? ""
        let picture = data["picture"] as? String ?? ""
        
        user = UserModel(username: username, firstname: firstname, lastname: lastname, email: email, phone: phone, picture: picture)
        
        return user
    }

    class func editProfile(user: UserModel) async {
        let usersRef =  db.collection("users")
        let document = try! await usersRef.whereField("email", isEqualTo: user.email).getDocuments().documents[0]
        try! await document.reference.updateData([
            "username": user.username,
            "lastname": user.lastname,
            "firstname": user.firstname,
            "phone": user.phone,
        ])
    }
    
}
