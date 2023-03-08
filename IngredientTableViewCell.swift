//
//  IngredientTableViewCell.swift
//  CookAPI
//
//  Created by Jean on 07/03/2023.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {

    
    @IBOutlet weak var IngredientLabel: UILabel!
    @IBOutlet weak var QuantiteLabel: UILabel!
    @IBOutlet weak var UniteLabel: UILabel!
    
    @IBOutlet weak var ButtonSupp: UIButton!
    
    func redraw(with ingredient: IngredientTmp){
        self.IngredientLabel.text = ingredient.title
        self.QuantiteLabel.text = "\(ingredient.quantite)"
        self.UniteLabel.text = "\(ingredient.unite)"
    }
    
}
