//
//  Recipe.swift
//  CookAPI
//
//  Created by Aladdine Abdou on 18/01/2023.
//

import Foundation

class RecipeModel {
    
    let author: UserModel
    var imgUrl: String
    let title: String
    var desc: String
    var ingredients: [IngredientModel]
    var category: String
    var dish: String
    var steps: [RecipeStepModel] // Ajouter la classe RecipeStep
    let rating: RatingModel
    let ratings: [Int]

    init(author: UserModel, imgUrl: String, title: String, desc: String, ingredients: [IngredientModel], category: String, dish: String, steps: [RecipeStepModel], rating: RatingModel, ratings: [Int]) {
        self.author = author
        self.imgUrl = imgUrl
        self.title = title
        self.desc = desc
        self.ingredients = ingredients
        self.category = category
        self.dish = dish
        self.steps = steps
        self.rating = rating
        self.ratings = ratings
    }
    
    func calcRating() {
        
    }
}
