//
//  User.swift
//  CookAPI
//
//  Created by Aladdine Abdou on 18/01/2023.
//

import Foundation

class UserModel {
    var username: String
    var firstname: String
    var lastname: String
    var email: String
    var phone: String
    var picture: String
    var favRecipes: [Recipe]
    var follows: [UserModel]
    var followers: [UserModel]
    
    init(username: String, firstname: String, lastname: String, email: String, phone: String, picture: String = "", favRecipes: [Recipe] = [], follows: [UserModel] = [], followers: [UserModel] = []) {

        self.username = username
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.phone = phone
        self.picture = picture
        self.favRecipes = favRecipes
        self.follows = follows
        self.followers = followers
    }
}
