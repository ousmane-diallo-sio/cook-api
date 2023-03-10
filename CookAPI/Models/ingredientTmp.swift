//
//  ingredientTmp.swift
//  CookAPI
//
//  Created by Ousmane Diallo on 08/03/2023.
//

import Foundation

class IngredientTmp:CustomStringConvertible{
    let title: String
    let quantite: Int
    let unite: Int
    var description: String{
        return "<album title='(title)' id='(quantite)' userId='(unite)' />"
    }

    init(title: String, quantite: Int, unite: Int) {
        self.title = title
        self.quantite = quantite
        self.unite = unite
    }
}
