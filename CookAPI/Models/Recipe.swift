//
//  Recipe.swift
//  CookAPI
//
//  Created by Aladdine Abdou on 18/01/2023.
//

import Foundation

class RecipeModel {
    
    let author: UserModel
    let imgUrl: String
    let title: String
    let desc: String
    let ingredients: [IngredientModel]
    let category: String
    let dish: String
    let steps: [RecipeStepModel] // Ajouter la classe RecipeStep
    let rating: RatingModel

    init(author: UserModel, imgUrl: String, title: String, desc: String, ingredients: [IngredientModel], category: String, dish: String, steps: [RecipeStepModel], rating: RatingModel) {
        self.author = author
        self.imgUrl = imgUrl
        self.title = title
        self.desc = desc
        self.ingredients = ingredients
        self.category = category
        self.dish = dish
        self.steps = steps
        self.rating = rating
    }
}
