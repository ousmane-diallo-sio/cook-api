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
    
        class func createRecipes(recipe: RecipeModel) {
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = Database.db.collection("recipe").addDocument(data: [
            "author": [
                "username": recipe.author.username,
                "firstname": recipe.author.firstname,
                "lastname": recipe.author.lastname,
                "email": recipe.author.email,
                "picture": recipe.author.picture,
                "favRecipes": recipe.author.favRecipes,
                "follows": recipe.author.follows,
                "followers": recipe.author.followers,
            ],
            "imgUrl": recipe.imgUrl,
            "title": recipe.title,
            "desc": recipe.desc,
            "ingredients": recipe.ingredients,
            "category": recipe.category,
            "dish": recipe.dish,
            "steps": recipe.steps,
            "rating": RatingModel(rawValue: recipe.rating.rawValue) ?? RatingModel.one,
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    class func editRecipe(recipe: RecipeModel) async {
        let recipesRef =  db.collection("recipe")
        let document = try! await recipesRef.whereField("title", isEqualTo: recipe.title).getDocuments().documents[0]
        try! await document.reference.updateData([
            "imgUrl": recipe.imgUrl,
            "title": recipe.title,
            "desc": recipe.desc,
            "ingredients": recipe.ingredients,
            "category": recipe.category,
            "dish": recipe.dish,
            "steps": recipe.steps,
            "rating": recipe.rating,
        ])
    }
    
    class func editRecipeRating(recipe: RecipeModel, newRating: Int) async {
        let recipesRef =  db.collection("recipe")
        let document = try! await recipesRef.whereField("title", isEqualTo: recipe.title).getDocuments().documents[0]
        try! await document.reference.updateData([
            "rating": newRating,
        ])
    }
    
    class func deleteRecipe(recipe: RecipeModel) async {
        let recipesRef =  db.collection("recipe")
        let document = try! await recipesRef.whereField("title", isEqualTo: recipe.title).getDocuments().documents[0]
        try! await document.reference.delete()
    }
    
    class func getFeedRecipes(callback: @escaping ([RecipeModel]?, Error?) -> Void) {
        Database.db.collection("recipe").getDocuments { querySnapshot, err in
            if (err != nil) {
                print("Error -> Database.getFeedRecipes() : \(err!)")
                callback(nil, err)
                return
            }
            var arrayRecipes: [RecipeModel] = []
            querySnapshot?.documents.forEach { document in
                let recipe = RecipeFactory.recipe(from: document.data())
                if (recipe != nil) {
                    arrayRecipes.append(recipe!)
                }
            }
            callback(arrayRecipes, nil)
        }
    }

}
