//
//  User.swift
//  CookAPI
//
//  Created by Aladdine Abdou on 18/01/2023.
//

import Foundation

class UserModel {
    let username: String
    let firstname: String
    let lastname: String
    let email: String
    let picture: String
    let favRecipes: [RecipeModel]
    let follows: [UserModel]
    let followers: [UserModel]
    
    init(username: String, firstname: String, lastname: String, email: String, picture: String = "", favRecipes: [RecipeModel] = [], follows: [UserModel] = [], followers: [UserModel] = []) {
        self.username = username
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.picture = picture
        self.favRecipes = favRecipes
        self.follows = follows
        self.followers = followers
    }
}
