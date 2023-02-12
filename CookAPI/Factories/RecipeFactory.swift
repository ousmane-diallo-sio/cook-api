//
//  RecipeFactory.swift
//  CookAPI
//
//  Created by Ousmane Diallo on 12/02/2023.
//

import Foundation

class RecipeFactory {
    
    static func recipe(from dict: [String: Any]) -> RecipeModel? {
        guard let img = dict["img"] as? String,
              let title = dict["title"] as? String,
              let desc = dict["desc"] as? String,
              let category = dict["category"] as? String,
              let rating = dict["rating"] as? Int,
              let dish = dict["dish"] as? String else {
            print("Error -> RecipeFactory::recipe()")
            return nil
        }
        let recipe = RecipeModel(
            author: UserModel(
                username: "my_username",
                firstname: "Prenom",
                lastname: "nom",
                email: "email",
                picture: "https://torange.biz/photofxnew/1/IMAGE/clear-sky-1049.jpg",
                favRecipes: [],
                follows: [],
                followers: []
            ),
            imgUrl: img,
            title: title,
            desc: desc,
            ingredients: [
            
            ],
            category: category,
            dish: dish,
            steps: [
            
            ],
            rating: RatingModel(rawValue: rating) ?? RatingModel.one
        )
        
        return recipe
    }
    
}
