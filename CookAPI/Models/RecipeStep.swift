//
//  RecipeStep.swift
//  CookAPI
//
//  Created by Ousmane Diallo on 29/01/2023.
//

import Foundation

class RecipeStepModel {
    let description: String
    let duration: Int // in minutes
    
    init(description: String, duration: Int) {
        self.description = description
        self.duration = duration
    }
}
