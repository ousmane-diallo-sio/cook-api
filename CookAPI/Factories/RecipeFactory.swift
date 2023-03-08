//
//  RecipeFactory.swift
//  CookAPI
//
//  Created by Ousmane Diallo on 12/02/2023.
//

import Foundation
import FirebaseFirestore

class RecipeFactory {
    
    static func recipe(from dict: [String: Any]) -> RecipeModel? {
        print(dict)
        guard let img = dict["img"] as? String,
              let title = dict["title"] as? String,
              let desc = dict["desc"] as? String,
              let category = dict["category"] as? String,
              let rating = dict["rating"] as? Int,
              let ingredients = dict["ingredients"] as? [[String: String]],
              let steps = dict["steps"] as? [[String: Any]],
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
                phone: "0123456789",
                picture: "https://torange.biz/photofxnew/1/IMAGE/clear-sky-1049.jpg",
                favRecipes: [],
                follows: [],
                followers: []
            ),
            imgUrl: img,
            title: title,
            desc: desc,
            ingredients: RecipeFactory.ingredients(data: ingredients) ?? [],
            category: category,
            dish: dish,
            steps: RecipeFactory.steps(data: steps) ?? [],
            rating: RatingModel(rawValue: rating) ?? RatingModel.one,
            ratings: []
        )
        
        return recipe
    }
    
    class func ingredient(ingredient: Dictionary<String, String>) -> IngredientModel? {
        
        guard let name = ingredient["name"],
              let amout = ingredient["amount"] else {
            return nil
        }
        return IngredientModel(name: name, amount: amout)
    }
    
    class func ingredients(data: [[String: String]]) -> [IngredientModel]? {
        data.compactMap{dict in
            return RecipeFactory.ingredient(ingredient: dict)
        }
    }
    
    class func step(step: Dictionary<String, Any>) -> RecipeStepModel? {
        
        guard let description = step["description"],
              let duration = step["duration"] else {
            return nil
        }
        return RecipeStepModel(description: description as! String, duration: duration as! Int)
    }
    
    class func steps(data: [[String: Any]]) -> [RecipeStepModel]? {
        data.compactMap{dict in
            return RecipeFactory.step(step: dict)
        }
    }
    
}
